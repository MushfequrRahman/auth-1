@extends('layouts.master')
@section('title', 'Module List')

@section('content')
<h2>Module List</h2>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>Name</th>
            <th>Route</th>
            <th>Icon</th>
            <th>Parent</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        @forelse($modules as $module)
            <tr>
                <td>{{ $module->name }}</td>
                <td>{{ $module->route }}</td>
                <td><i class="{{ $module->icon }}"></i> {{ $module->icon }}</td>
                <td>{{ optional($module->parent)->name }}</td>
                <td>
                    <a href="{{ route('modules.edit', $module->id) }}" class="btn btn-sm btn-warning">Edit</a>
                    <form action="{{ route('modules.destroy', $module->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Delete this module?')">
                        @csrf @method('DELETE')
                        <button class="btn btn-sm btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
        @empty
            <tr><td colspan="5">No modules found.</td></tr>
        @endforelse
    </tbody>
</table>
@endsection
