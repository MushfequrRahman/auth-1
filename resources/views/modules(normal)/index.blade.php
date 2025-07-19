@extends('layouts.master')
@section('title', 'Module List')
@section('content')

<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h4>Module List</h4>
        <a href="{{ route('modules.create') }}" class="btn btn-primary">Add New Module</a>
    </div>

    <div class="card-body">
        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Module Name</th>
                    <th>Order</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($modules as $index => $module)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $module->name }}</td>
                        <td>{{ $module->order }}</td>
                        <td>
                            <a href="{{ route('modules.edit', $module->id) }}" class="btn btn-sm btn-warning">Edit</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

@endsection
