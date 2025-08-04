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
                    <th>Name</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{ $user_list->name }}</td>
                    <td>{{ $user_list->email }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
@endsection