<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Carbon\Carbon;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\bikash;
use DB;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:admin|shipper')->except(['store']);
    }
    public function index()
    {
        return view('order.index');
    }

    /**
     * request->all() = ['cart_id','quantity']
     */
    public function store(Request $request)
    {
        
        
     if($request->method=="bikash"){
       $result=bikash::latest('created_at')->first();
       $transtion_id= $result->trncsation_id;
           $cart = Cart::whereIn('id',request('cart_id'))->with('product')->get();
        foreach($cart as $cart){
        $order = new Order();
        $order->user_id = auth()->user()->id;
        $order->product_id = $cart->product->id;
          $order->payment = $request->method;
        $order->quantity = $request->quantity;
         $order->transtion_id = $transtion_id;

        //shipping cost defult 100rs
        $order->shipping_cost = 100;
        $order->order_number = rand(200, 299) . '' . Carbon::now()->timestamp;


        if ($cart->product->onSale) {
            $totalPrice = $cart->product->sale_price;
        } else {
            $totalPrice = $cart->product->price;
        }
        $order->price = $totalPrice;
        if ($order->save()) {
            //cart delete
            $cart->delete();
            Alert::toast('Order Placed!', 'success');
        } else {
            Alert::toast('Checkout fail' . 'error');
        }
        }
        return redirect(route('myOrder.index'));
     }else{
         $cart = Cart::whereIn('id',request('cart_id'))->with('product')->get();
        foreach($cart as $cart){
        $order = new Order();
        $order->user_id = auth()->user()->id;
        $order->product_id = $cart->product->id;
          $order->payment = $request->method;
        $order->quantity = $request->quantity;

        //shipping cost defult 100rs
        $order->shipping_cost = 100;
        $order->order_number = rand(200, 299) . '' . Carbon::now()->timestamp;


        if ($cart->product->onSale) {
            $totalPrice = $cart->product->sale_price;
        } else {
            $totalPrice = $cart->product->price;
        }
        $order->price = $totalPrice;
        if ($order->save()) {
            //cart delete
            $cart->delete();
            Alert::toast('Order Placed!', 'success');
        } else {
            Alert::toast('Checkout fail' . 'error');
        }
        }
        return redirect(route('myOrder.index'));
    }
    }
    public function show($id)
    {
        return redirect(route('invoice.index', ['order' => $id]));
    }

    public function destroy(Request $request)
    {
        $ids = $request->get('ids');
        $orders = Order::whereIn('id', $ids)->get(['id', 'status']);
        foreach ($orders as $order) {
            $order->delete();
        }
        Alert::toast('Order removed from the database!', 'success');
       
    }
}