@extends('layouts.master')
@section('title', 'Edit Module')
@section('content')

<div class="card">
    <div class="card-header">Edit Module</div>
    <div class="card-body">
        <form action="{{ route('modules.update', $module->id) }}" method="POST">
            @csrf
            <div class="mb-3">
                <label for="name" class="form-label">Module Name</label>
                <input type="text" name="name" value="{{ $module->name }}" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Update</button>
            <a href="{{ route('modules.index') }}" class="btn btn-secondary">Back</a>
        </form>
    </div>
</div>

@endsection
