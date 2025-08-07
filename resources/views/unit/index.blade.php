@extends('layouts.master')

@section('content')
<div class="container">
    <h2>All unit</h2>
    <a href="{{ route('unit.create') }}" class="btn btn-primary mb-3">Add New Unit</a>

    @if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>address</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($unit as $unit)
            <tr>
                <td>{{ $unit->id }}</td>
                <td>{{ $unit->name }}</td>
                <td>{{ $unit->address }}</td>
                <td>
                    <a href="{{ route('unit.edit', $unit->id) }}" class="btn btn-sm btn-warning">Edit</a>
                    <!-- <a href="{{ route('unit.destroy', $unit->id) }}" class="btn btn-sm btn-danger"
                       onclick="return confirm('Are you sure to delete?')">Delete</a> -->
                    <form action="{{ route('unit.destroy', $unit->id) }}" method="POST" style="display:inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>

                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection