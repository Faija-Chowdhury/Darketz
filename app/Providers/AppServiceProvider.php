<?php

namespace App\Providers;

use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\FlashSale;
use App\Models\Carousel;
use App\Models\subCategory;
use App\Models\CustomerQuestion;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useBootstrap();
        View::composer('layouts.app', function ($view) {

            $navbarCategories = Category::with('subCategory')->take(15)->get();
            $carousels = Carousel::latest()->take(3)->get();
            $flashSaleProducts = FlashSale::inRandomOrder()->with('product.productImage')->take(6)->get();
            $newProducts = Product::inRandomOrder()->with('productImage')->take(24)->get();

            $view->with([
                'navbarCategories' => $navbarCategories,
                'carousels' => $carousels,
                'flashSaleProducts' => $flashSaleProducts,
                'newProducts' => $newProducts
            ]);
        });



        view()->composer('layouts.admin', function ($view) {
                $orders = Order::where('status','Pending')->get();
                $question = CustomerQuestion::where('reply')->get();
                $count = count($orders)+count($question);
                $view->with('data',$count)->with('newOrders',$orders)->with('newQuestion',$question);
        });



        View::composer('layouts.app', function ($view) {

            $cart = DB::table('carts')
            ->select('carts.id', 'carts.user_id','carts.product_id','carts.quantity' )
            ->where('carts.user_id', Auth::id())
            ->get();
                $count = count($cart);
                     $view->with([
                            'navbarcart' => $cart,
                            'data' => $count
                        ]);
        });
        // View::composer('shop.index', function ($view) {
        //     $productCategories = Category::inRandomOrder()->take(6)->get();
        //     $view->with([
        //         'productCategories' => $productCategories
        //     ]);
        // });
    }
}
