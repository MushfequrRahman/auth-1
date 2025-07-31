@extends('layouts.master')
@section('title', 'Edit Module')

@section('content')
<h2>Edit Module</h2>
<form action="{{ route('modules.update', $module->id) }}" method="POST">
    @csrf
    @method('PUT')

    <div class="mb-3">
        <label>Module Name</label>
        <input type="text" name="name" class="form-control" value="{{ $module->name }}" required>
    </div>
    <div class="mb-3">
        <label>Route Name (Optional)</label>
        <input type="text" name="route" class="form-control" value="{{ $module->route }}">
    </div>
    <div class="mb-3">
        <label>FontAwesome Icon</label>
        <input type="text" name="icon" class="form-control" value="{{ $module->icon }}">
    </div>
    <div class="mb-3">
        <label>Parent Module</label>
        <select name="parent_id" class="form-control">
            <option value="">None</option>
            @foreach($modules as $m)
                <option value="{{ $m->id }}" {{ $m->id == $module->parent_id ? 'selected' : '' }}>
                    {{ $m->name }}
                </option>
            @endforeach
        </select>
    </div>
    <button class="btn btn-primary">Update</button>
</form>
@endsection
