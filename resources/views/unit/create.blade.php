@extends('layouts.master')

@section('content')
<div class="container">
    <h2>Add New Unit</h2>

    <form action="{{ route('unit.store') }}" method="POST">
        @csrf
        <div class="form-group">
            <label>Unit ID</label>
            <input type="text" name="id" class="form-control" required>
            @error('id') <small class="text-danger">{{ $message }}</small> @enderror
        </div>

        <div class="form-group">
            <label>Unit Name</label>
            <input type="text" name="name" class="form-control" required>
            @error('name') <small class="text-danger">{{ $message }}</small> @enderror
        </div>

        <div class="form-group">
            <label>address (optional)</label>
            <textarea name="address" class="form-control"></textarea>
        </div>

        <button type="submit" class="btn btn-success">Save Unit</button>
    </form>
</div>
@endsection
