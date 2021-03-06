<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Product;
use App\Models\bikash;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;
use DB;

class CartController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        return view('user.my-cart');
    }
    public function demo()
    {
        return view('cart');
    }
    public function post(Request $request){
    return $request->all();
    }

    public function store(Request $request)
    {
        $product = Product::findOrFail($request->product_id); //get product
        $user = auth()->user(); //get authenticated user

        $exists = $user->cart()->where('product_id', $request->product_id)->get();
        if ($exists->count()) {
            Alert::info('You haved already added');
            return redirect($product->path());
        }

        $cart = new Cart();
        $cart->user_id = auth()->user()->id;
        $cart->product_id = $product->id;
        $cart->quantity = $request->quantity;
        if ($cart->save()) {
            Alert::toast('Product added to cart!');
        } else {
            Alert::toast('Something went wrong');
        }

        return redirect()->route('cart.index');
    }

    //mass delete
    public function destroySelected(Request $request)
    {
        $cartItems = Cart::where('user_id', auth()->user()->id)->whereIn('id', $request->cart)->get(); //get all cart ids
        foreach ($cartItems as $item) {
            $item->delete();
        }
        return ['delete' => "success"];
    }

    public function all()
    {
        $cartItems = Cart::where('user_id', auth()->user()->id)->with('product.getImage')->get();

        return $cartItems;
    }
    public function save(Request $request){
   $data=new bikash;
   $data->number=$request->number;
   $data->trncsation_id=$request->trans;
    $data->user_id=Auth::user()->id;
    $data->save();
    return $data;
    }
   
}
