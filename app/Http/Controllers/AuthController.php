<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class AuthController extends Controller
{
    public function showLogin()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = DB::table('users')->where('email', $request->email)->first();

        if ($user && Hash::check($request->password, $user->password)) {
            Session::put('user', $user);
            return redirect('/dashboard');
        }

        return back()->with('error', 'Invalid credentials.');
    }

    public function showRegister()
    {
        return view('auth.register');
    }

    public function register(Request $request)
    {
        $request->validate([
            'name'     => 'required|string|max:255',
            'email'    => 'required|email|unique:users,email',
            'password' => 'required|min:6|confirmed',
            'role_id'  => 'required|exists:roles,id',
        ]);

        DB::table('users')->insert([
            'name'       => $request->name,
            'email'      => $request->email,
            'password'   => Hash::make($request->password),
            'role_id'    => $request->role_id,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return redirect('/login')->with('success', 'Registration successful. Please login.');
    }

    public function dashboard()
    {
        return view('dashboard');
    }
    // Show user profile
    
    public function user_list()
    {
        $user_list = Session::get('user'); // custom auth system অনুযায়ী session থেকে ইউজার নিচ্ছি
        return view('user_list', compact('user_list'));
    }

    public function logout()
    {
        Session::forget('user');
        return redirect('/login')->with('success', 'Logged out successfully.');
    }
}
