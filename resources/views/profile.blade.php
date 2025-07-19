@extends('layouts.master')

@section('title', 'User Profile')

@section('content')
<div class="row justify-content-center">
    <div class="col-md-6">

        <div class="card">
            <div class="card-header">
                <h4 class="mb-0">User Profile</h4>
            </div>
            <div class="card-body">
                <p><strong>Name:</strong> {{ $user->name }}</p>
                <p><strong>Email:</strong> {{ $user->email }}</p>
                <!-- চাইলে আরেকটি edit button বা password change button রাখতে পারো -->
            </div>
        </div>

    </div>
</div>
@endsection
