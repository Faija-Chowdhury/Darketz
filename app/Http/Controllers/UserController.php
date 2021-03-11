<?php

namespace App\Http\Controllers;

use App\Models\UserInfo;
use App\Models\User;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;
use App\Http\Controllers\Traits\RouteRoleTrait;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    use RouteRoleTrait;

    public function __construct()
    {
        $this->middleware('auth');
    }
    //user profile 
    public function index()
    {
        if (auth()->user()->hasRole('admin')) {
            return redirect()->route('admin.dashboard');
        }
        return view('user.index');
    }

    //user update profile 
    public function showProfile()
    {
        if (auth()->user()->hasRole('admin')) {
            return redirect()->route('admin.dashboard');
        }
        return view('user.profile');
    }

    public function update(Request $request,User $user)
    {

        $data = $request->all();
        $user = Auth::user();
        if ($request->has('logo')) {
        $data['logo'] = $request->logo->store('/avater');
    }
        
        $update =$user->update($data);
        Alert::toast('Profile info updated!', 'success');
        return redirect()->back();
    }

    //user change password 
    public function show()
    {
        if (auth()->user()->hasRole('admin')) {
            return redirect()->route('admin.dashboard');
        }
        return view('user.change_pw');
    }

    //post route
    public function address(Request $request)
    {
        $request->validate([
            'address' => 'required|min:3',
            'phone' => 'required|min:6'
        ]);

        $userInfo = UserInfo::updateOrCreate([
            'user_id' => auth()->user()->id,
            'address' => $request->address,
            'phone' => $request->phone
        ]);
        Alert::toast('Shipping info updated!', 'success');
        return view('user.index');
    }

    public function changePassword(Request $request)
    {
        if (!auth()->user()) {
            Alert::toast('Not authenticated!', 'success');
            return redirect()->back();
        }

        //check if the password is valid
        $request->validate([
            'current_password' => 'required|min:8',
            'new_password' => 'required|min:8'
        ]);

        $authUser = auth()->user();

        $currentP = $request->current_password;
        $newP = $request->new_password;
        $confirmP = $request->confirm_password;

        if (Hash::check($currentP, $authUser->password)) {
            if (Str::of($newP)->exactly($confirmP)) {
                $user = User::find($authUser->id);
                $user->password = Hash::make($newP);
                if ($user->save()) {
                    Alert::toast('Password Changed!', 'success');
                    if ($user->hasRole('admin')) {
                        return redirect()->route('admin.dashboard');
                    } else {
                        return redirect()->intended('/');
                    }
                } else {
                    Alert::toast('Something went wrong!', 'warning');
                }
            } else {
                Alert::toast('Passwords do not match!', 'info');
            }
        } else {
            Alert::toast('Incorrect Password!', 'info');
        }
        return redirect()->back();
    }
}
