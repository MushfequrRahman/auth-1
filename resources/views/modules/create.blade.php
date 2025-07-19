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
        <label>Parent Module:</label>
        <select name="parent_id" class="form-control">
            <option value="">None</option>
            @foreach($modules as $module)
                <option value="{{ $module->id }}">{{ $module->name }}</option>
            @endforeach
        </select>
    </div>
    <button class="btn btn-success">Save</button>
</form>
@endsection