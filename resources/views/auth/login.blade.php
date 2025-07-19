@extends('layouts.master')
@section('title', 'Login')
@section('content')
<h2>Login</h2>
@if(session('error'))
    <div class="alert alert-danger">{{ session('error') }}</div>
@endif
<form method="POST" action="{{ url('/login') }}">
    @csrf
    <div class="mb-3">
        <label>Email</label>
        <input type="email" name="email" class="form-control" required />
    </div>
    <div class="mb-3">
        <label>Password</label>
        <input type="text" name="password" class="form-control" required />
    </div>
    <button class="btn btn-primary">Login</button>
</form>
<a href="{{ route('register') }}">Register</a>
@endsection
