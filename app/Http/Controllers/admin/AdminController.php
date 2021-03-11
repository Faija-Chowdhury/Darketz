<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\CustomerQuestion;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('role:admin', ['except' => ['loginView']]);
    }
    public function loginView()
    {
        Auth::logout();
        return view('auth-admin.login');
    }
    public function dashboard()
    {
        $productsCount = Product::count();
        $ordersCount = Order::where('status', 'PENDING')->count();
        $readyToShipCount  = Order::where('status', 'READY TO SHIP')->count();
        $customerQueryCount  = CustomerQuestion::whereNUll('reply')->count();
        /*Monthly Earn*/
        $year_data = Order::whereYear('created_at', \Carbon\Carbon::now()->year)->whereMonth('created_at', \Carbon\Carbon::now()->month)->where('status','DELIVERED')->get();
        $price = 0;
        foreach ($year_data as $data) {
            $price += $data->sum('price');
        }
        $monthly_price_count= number_format((float)($price), 2, '.', '');

        /*Yearly Earn*/
        $month_data = Order::whereYear('created_at', \Carbon\Carbon::now()->year)->where('status','DELIVERED')->get();
        $price = 0;
        foreach ($month_data as $data) {
            $price += $data->sum('price');
        }
        $yearly_price_count= number_format((float)($price), 2, '.', '');

        return view('admin.dashboard', compact([
            'productsCount', 'ordersCount', 'readyToShipCount', 'customerQueryCount','monthly_price_count','yearly_price_count'
        ]));

    }

    public function profile()
    {
        return view('admin.profile');
    }

    public function incomeChart(Request $request)
    {
        $year = \Carbon\Carbon::now()->year;
        $items = Order::whereYear('created_at', $year)
        ->where('status','DELIVERED')
        ->get()
        ->groupBy(function($d) {
            return \Carbon\Carbon::parse($d->created_at)->format('m');
        });
        $result = [];
        foreach($items as $month => $item_collections){
            foreach($item_collections as $item){
                $amount = $item->sum('price');
                $m = intval($month);
                isset($result[$m]) ? $result[$m] += $amount : $result[$m] = $amount;
            }
        }
        $data = [];
        for ($i=1; $i <=12 ; $i++) { 
            $monthName = date("F", mktime(0, 0, 0, $i, 1));
            $data[$monthName] = (!empty($result[$i]))? number_format((float)($result[$i]), 2, '.', '') : 0.0;
        }
        return $data;
    }
    
}
