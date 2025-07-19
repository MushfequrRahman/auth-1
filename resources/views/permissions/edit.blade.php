@extends('layouts.master')
@section('title', 'Edit Permission')
@section('content')
    <h3>Edit Permission</h3>
    <!-- <form method="POST" action="{{ route('permissions.update', $permission->id) }}"> -->
        <form method="POST" action="{{ url('/permissions/' . $permission->id) }}">
        @csrf
        @method('PUT')
        <div class="mb-3">
            <label>Module</label>
            <select name="module_id" class="form-select" required>
                @foreach($modules as $module)
                    <option value="{{ $module->id }}" {{ $module->id == $permission->module_id ? 'selected' : '' }}>
                        {{ $module->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="mb-3">
            <label>Permission Name</label>
            <input type="text" name="name" value="{{ $permission->name }}" class="form-control" required />
        </div>
        <div class="mb-3">
            <label>Slug</label>
            <input type="text" name="slug" value="{{ $permission->slug }}" class="form-control" required />
        </div>
        <button class="btn btn-primary">Update</button>
    </form>
@endsection


