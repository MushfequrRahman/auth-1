@extends('layouts.master')
@section('title', 'Edit Module')

@section('content')
<h4>Edit Module</h4>

<form action="{{ route('modules.update', $module->id) }}" method="POST">
    @csrf
    @method('PUT')

    <div class="mb-3">
        <label>Module Name</label>
        <input type="text" name="name" class="form-control" value="{{ $module->name }}" required>
    </div>

    <div class="mb-3">
        <label>Route</label>
        <input type="text" name="route" class="form-control" value="{{ $module->route }}">
    </div>

    <div class="mb-3">
        <label>Icon (FontAwesome)</label>
        <input type="text" name="icon" class="form-control" value="{{ $module->icon }}">
        <small class="text-muted">Example: fas fa-cog</small>
    </div>

    <button type="submit" class="btn btn-success">Update</button>
    <a href="{{ route('modules.index') }}" class="btn btn-secondary">Cancel</a>
</form>
@endsection
