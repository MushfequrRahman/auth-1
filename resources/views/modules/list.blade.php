@extends('layouts.master')
@section('title', 'Module List')

@section('content')
@if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
@endif
@if(session('error'))
    <div class="alert alert-danger">{{ session('error') }}</div>
@endif

<h4 class="mb-3">Module List</h4>

<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>#</th>
            <th>Module Name</th>
            <th>Route</th>
            <th>Icon</th>
            <th>Parent</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        @forelse($modules as $index => $mod)
        <tr>
            <td>{{ $index + 1 }}</td>
            <td>{{ $mod->name }}</td>
            <td>{{ $mod->route ?? '-' }}</td>
            <td><i class="{{ $mod->icon }}"></i> {{ $mod->icon }}</td>
            <td>
                @php
                    $parent = $modules->firstWhere('id', $mod->parent_id);
                @endphp
                {{ $parent->name ?? '-' }}
            </td>
            <td>
                <a href="{{ route('modules.edit', $mod->id) }}" class="btn btn-sm btn-primary">Edit</a>
            </td>
        </tr>
        @empty
        <tr>
            <td colspan="6" class="text-center">No modules found.</td>
        </tr>
        @endforelse
    </tbody>
</table>
@endsection
