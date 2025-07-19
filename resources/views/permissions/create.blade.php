@extends('layouts.master')
@section('title', 'Create Permission')
@section('content')
    <h3>Create New Permission</h3>
    <form method="POST" action="{{ route('permissions.store') }}">
        @csrf
        <div class="mb-3">
            <label>Module</label>
            <select name="module_id" class="form-select" required>
                <option value="">Select Module</option>
                @foreach($pmodules as $pmodule)
                    <option value="{{ $pmodule->id }}">{{ $pmodule->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label>Permission Name</label>
            <input type="text" name="name" class="form-control" required />
        </div>
        <div class="mb-3">
            <label>Slug</label>
            <input type="text" name="slug" class="form-control" required />
        </div>
        <button class="btn btn-success">Create</button>
    </form>
@endsection
