@extends('layouts.master')
@section('title', 'All Route List')

@section('content')
<div class="card">
    <div class="card-header">
        <h4>Laravel Route List</h4>
    </div>
    <div class="card-body table-responsive">
        <table class="table table-bordered table-hover table-sm">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Method</th>
                    <th>URI</th>
                    <th>Name</th>
                    <th>Controller</th> {{-- ✅ New --}}
                    <th>Action</th>
                    <th>Middleware</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($routes as $index => $route)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td><code>{{ $route['method'] }}</code></td>
                        <td>{{ $route['uri'] }}</td>
                        <td>{{ $route['name'] ?? '-' }}</td>
                        <td>{{ $route['controller'] }}</td> {{-- ✅ Show Controller --}}
                        <td>{{ $route['action'] }}</td>
                        <td>{{ $route['middleware'] }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection
