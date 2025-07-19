@extends('layouts.master')
@section('title', 'Add Module')
@section('content')

<div class="col-md-6 mx-auto">
    <div class="card">
        <div class="card-header">Add New Module</div>
        <div class="card-body">
            <form action="{{ route('modules.store') }}" method="POST">
                @csrf

                <div class="mb-3">
                    <label class="form-label">Module Name</label>
                    <input type="text" name="name" class="form-control" value="{{ old('name') }}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Order</label>
                    <input type="number" name="order" class="form-control" value="{{ old('order') }}">
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
                <a href="{{ route('modules.index') }}" class="btn btn-secondary">Back</a>
            </form>
        </div>
    </div>
</div>

@endsection
