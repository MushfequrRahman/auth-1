{{-- resources/views/dashboard.blade.php --}}

@extends('layouts.master')

@section('title', 'Dashboard')

@section('content')
<div class="container mt-4">
    <h2>Welcome to the Dashboard</h2>

    <div class="alert alert-success mt-3">
        Hello, <strong>{{ $user->name; }}</strong>! You are successfully logged in.
    </div>
</div>
@endsection
