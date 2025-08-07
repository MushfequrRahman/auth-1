@extends('layouts.master')

@section('title', 'User List')

@section('content')
<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="mb-0">User Profile</h4>
            </div>
        </div>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Permission Assign</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($user_list as $user)
            <tr>
                <td>{{ $user->id }}</td>
                <td>{{ $user->name }}</td>
                <td>{{ $user->email }}</td>
                <td>
                    <a href="{{ route('permissions.assign-form', ['user_id' => $user->id,'user_name' => $user->name]) }}" class="btn btn-sm btn-warning">Assign</a>
                </td>
            </tr>
        @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection