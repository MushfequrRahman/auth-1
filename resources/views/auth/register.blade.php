@extends('layouts.master')
@section('title', 'Register')

@section('content')
<h2>Register</h2>

@if(session('error'))
    <div class="alert alert-danger">{{ session('error') }}</div>
@endif

@if ($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<form method="POST" action="{{ url('/register') }}">
    @csrf

    <div class="mb-3">
        <label>Name</label>
        <input type="text" name="name" class="form-control" required value="{{ old('name') }}" />
    </div>

    <div class="mb-3">
        <label>Email</label>
        <input type="email" name="email" class="form-control" required value="{{ old('email') }}" />
    </div>

    <div class="mb-3">
        <label>Password</label>
        <input type="password" name="password" class="form-control" required />
    </div>

    <div class="mb-3">
        <label>Confirm Password</label>
        <input type="password" name="password_confirmation" class="form-control" required />
    </div>

    <div class="mb-3">
        <label>Select Role</label>
        <select name="role_id" class="form-control" required>
            <option value="">-- Select Role --</option>
            @foreach(DB::table('roles')->get() as $role)
                <option value="{{ $role->id }}" {{ old('role_id') == $role->id ? 'selected' : '' }}>
                    {{ $role->name }}
                </option>
            @endforeach
        </select>
    </div>

    <button class="btn btn-success">Register</button>
</form>

<p class="mt-3">Already have an account?
    <a href="{{ route('login') }}">Login</a>
</p>
@endsection
