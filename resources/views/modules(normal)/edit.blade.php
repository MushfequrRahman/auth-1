@extends('layouts.master')
@section('title', 'Edit Module')
@section('content')

<div class="col-md-6 mx-auto">
    <div class="card">
        <div class="card-header">Edit Module</div>
        <div class="card-body">
            <form action="{{ route('modules.update', $module->id) }}" method="POST">
                @csrf
                @method('PUT')

                <div class="mb-3">
                    <label class="form-label">Module Name</label>
                    <input type="text" name="name" class="form-control" value="{{ old('name', $module->name) }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Order</label>
                    <input type="number" name="order" class="form-control" value="{{ old('order', $module->order) }}">
                </div>

                <button type="submit" class="btn btn-success">Update</button>
                <a href="{{ route('modules.index') }}" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

@endsection
