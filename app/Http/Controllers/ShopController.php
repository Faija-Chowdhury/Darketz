<?php

namespace App\Http\Controllers;

use App\Models\Carousel;
use App\Models\FlashSale;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\SubCategory;
use Spatie\QueryBuilder\QueryBuilder;
use Spatie\QueryBuilder\AllowedFilter;
use App\Models\Order;
use Carbon\Carbon;
use RealRashid\SweetAlert\Facades\Alert;
use DB;
use App\Models\Cart;

class ShopController extends Controller

{
    public function fix(Request $request){
             $cart = Cart::findOrFail($request->cart_id)->with('product')->get();
        foreach($cart as $cart){
        $order = new Order();
        $order->user_id = auth()->user()->id;
        $order->product_id = $cart->product->id;
          $order->payment_method = $request->method;
        $order->quantity = $request->quantity;

        //shipping cost defult 100rs
        $order->shipping_cost = 100;
        $order->order_number = rand(200, 299) . '' . Carbon::now()->timestamp;


        if ($cart->product->onSale) {
            $totalPrice = $cart->product->sale_price;
        } else {
            $totalPrice = $cart->product->price;
        }
  
        }
      
        
    }

    public function index()
    {
        $carousels = Carousel::latest()->take(3)->get();
        $newProducts = Product::inRandomOrder()->with('productImage')->take(24)->get();
        $flashSaleProducts = FlashSale::inRandomOrder()->with('product.productImage')->take(24)->get();
        $navbarCategories = Category::with('subCategory')->get();


        //return($newProductsStock);
        return view('shop.index')->with([
            'carousels' => $carousels,
            'newProducts' => $newProducts,
            'flashSaleProducts' => $flashSaleProducts,
            'navbarCategories' => $navbarCategories,

        ]);

    }
    public function show($id)
    {
        $product = Product::where('id', $id)->with('productImage')->first();
        $product->image = $product->productImage->first();

        $questions = $product->getQuestions()->with('user')->paginate(6);
        $mightAlsoLike = Product::where('id', '!=', $product->id)->inRandomOrder()->with('productImage')->take(6)->get();


            /*$productsStock = DB::table('products')->pluck('stock')->first();
            $orderQuantity = DB::table('orders')->pluck('quantity')->first();
            $productDetails = $productsStock-$orderQuantity;*/

        return view('shop.show')->with([
            'product' => $product,
            'questions' => $questions,
            'mightAlsoLike' => $mightAlsoLike,
            //'productDetails' => $productDetails

        ]);
    }

    public function catalog(Request $request)
    {
        //get random sub categories
        $productCategories = SubCategory::inRandomOrder()->take(20)->get();

        $products = QueryBuilder::for(Product::class)
            ->allowedFilters([
                'title',
                'subCategory',
                AllowedFilter::scope('min_price'),
                AllowedFilter::scope('max_price'),
            ])
            ->with('productImage')
            ->paginate(20);

        return view('shop.catalog')->with([
            'productCategories' => $productCategories,
            'products' => $products
        ]);
    }
}
