@extends('layouts.master')

@section('content')
<h4>Assign Permissions to Role: {{ $role->name }}</h4>

<form action="{{ route('roles.assign-permissions', $role->id) }}" method="POST">
    @csrf
    <div class="mb-3">
        <label class="form-label">Select Module & Permissions</label>
        @foreach($modules as $module)
            <div class="border p-2 mb-2">
                <strong>{{ $module->name }}</strong>
                @foreach($permissions as $permission)
                    <div class="form-check form-check-inline">
                        <input type="checkbox"
                               name="permissions[{{ $module->id }}][]"
                               class="form-check-input"
                               value="{{ $permission->id }}"
                               @if(isset($assigned[$module->id]) && in_array($permission->id, $assigned[$module->id])) checked @endif>
                        <label class="form-check-label">{{ $permission->name }}</label>
                    </div>
                @endforeach
            </div>
        @endforeach
    </div>

    <button class="btn btn-success">Assign</button>
</form>
@endsection
