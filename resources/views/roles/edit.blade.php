@extends('layouts.master')

@section('title', 'Edit Role')

@section('content')
<div class="row justify-content-center">
    <div class="col-md-6">

        <div class="card">
            <div class="card-header">
                <h4 class="mb-0">Edit Role</h4>
            </div>

            <div class="card-body">

                @if ($errors->any())
                    <div class="alert alert-danger">
                        <strong>Whoops!</strong> Please fix the following errors:
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form method="POST" action="{{ route('roles.update', $role->id) }}">
                    @csrf
                    @method('PUT')

                    <div class="mb-3">
                        <label for="name" class="form-label">Role Name</label>
                        <input type="text" name="name" id="name" class="form-control" value="{{ old('name', $role->name) }}" required>
                    </div>

                    <button type="submit" class="btn btn-success">Update Role</button>
                    <a href="{{ route('roles.index') }}" class="btn btn-secondary">Cancel</a>
                </form>

            </div>
        </div>

    </div>
</div>
@endsection
