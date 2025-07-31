<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class ProfileController extends Controller
{
    // Show user profile
    public function index()
    {
        $user = Session::get('user'); // custom auth system অনুযায়ী session থেকে ইউজার নিচ্ছি
        return view('profile', compact('user'));
    }
}
