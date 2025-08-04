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
                <tr>
                    <td>{{ $user_list->id }}</td>
                    <td>{{ $user_list->name }}</td>
                    <td>{{ $user_list->email }}</td>
                    <td><a href="{{ route('permissions.assign-form', $user_list->id) }}" class="btn btn-sm btn-warning">Assign</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
@endsection