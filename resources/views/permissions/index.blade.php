@extends('layouts.master')
@section('title', 'All Permissions')
@section('content')
    <h3>Permissions</h3>
    <a href="{{ route('permissions.create') }}" class="btn btn-sm btn-primary mb-3">+ Add Permission</a>
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Module</th>
                <th>Name</th>
                <th>Slug</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($permissions as $perm)
                <tr>
                    <td>{{ $perm->module_name }}</td>
                    <td>{{ $perm->name }}</td>
                    <td>{{ $perm->slug }}</td>
                    <td>
                        <a href="{{ route('permissions.edit', $perm->id) }}" class="btn btn-sm btn-warning">Edit</a>
                        <form action="{{ route('permissions.destroy', $perm->id) }}" method="POST" class="d-inline">
                            @csrf @method('DELETE')
                            <button onclick="return confirm('Delete?')" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
