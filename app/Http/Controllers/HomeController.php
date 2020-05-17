<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\LoginActivity;
use App\Customer;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $customerLoginActivity = LoginActivity::where('customer_id', auth()->user()->id)->get();

       /* $customer_id = auth()->user()->id;

        dump(auth()->user());
        dump($customer_id);
        dump($customerLoginActivity);
        die;*/
       //dump();die;

        return view('home',['customerLoginActivity'=> $customerLoginActivity ]);
    }
}
