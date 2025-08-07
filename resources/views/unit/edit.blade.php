@extends('layouts.master')

@section('content')
<div class="container">
    <h2>Edit Unit</h2>

    <form action="{{ route('unit.update', $unit->id) }}" method="POST">
        @csrf
        <div class="form-group">
            <label>Unit Name</label>
            <input type="text" name="name" class="form-control" value="{{ $unit->name }}" required>
            @error('name') <small class="text-danger">{{ $message }}</small> @enderror
        </div>

        <div class="form-group">
            <label>address (optional)</label>
            <textarea name="address" class="form-control">{{ $unit->address }}</textarea>
        </div>

        <button type="submit" class="btn btn-primary">Update Unit</button>
    </form>
</div>
@endsection
