@extends('layouts.master')
@section('title', 'Add Module')
@section('content')
<h2>Create Module</h2>
<form action="{{ route('modules.store') }}" method="POST">
    @csrf

    <div class="mb-3">
        <label>Name:</label>
        <input type="text" name="name" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Slug:</label>
        <input type="text" name="slug" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Type:</label>
        <select name="type" class="form-control" required>
            <option value="module">Module</option>
            <option value="permission">Permission</option>
        </select>
    </div>

    <div class="mb-3">
        <label>Route:</label>
        <input type="text" name="route" class="form-control">
    </div>

    <div class="mb-3">
        <label>Icon:</label>
        <input type="text" name="icon" class="form-control">
    </div>

    <div class="mb-3">
        <label>Order:</label>
        <input type="number" name="order" class="form-control" value="0">
    </div>

    <div class="mb-3">
        <label>Show in Sidebar:</label>
        <input type="number" name="showinsidebar" class="form-control" value="0">
    </div>

    <div class="mb-3">
        <label>Parent Module:</label>
        <select name="parent_id" class="form-control">
            <option value="">None</option>
            @foreach($parentModules as $module)
                <option value="{{ $module->id }}">{{ $module->name }}</option>
            @endforeach
        </select>
    </div>

    <button class="btn btn-success">Save</button>
</form>
@endsection
