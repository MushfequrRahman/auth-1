@extends('layouts.master')
@section('title', 'All Modules')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>All Modules</h2>
    <a href="{{ route('modules.create') }}" class="btn btn-primary">+ Add Module</a>
</div>

@if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
@endif

@if(session('error'))
    <div class="alert alert-danger">{{ session('error') }}</div>
@endif

<div class="dd" id="nestable">
    {!! renderModules($modules) !!}
</div>

<button id="saveOrder" class="btn btn-success mt-3">Save Order</button>
@endsection

@section('scripts')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/nestable2@1.6.0/jquery.nestable.min.css" />
<script src="https://cdn.jsdelivr.net/npm/nestable2@1.6.0/jquery.nestable.min.js"></script>

<script>
    $('#nestable').nestable();

    $('#saveOrder').click(function () {
        let order = $('#nestable').nestable('serialize');
        $.ajax({
            url: "{{ route('modules.order-update') }}",
            method: "POST",
            data: {
                _token: "{{ csrf_token() }}",
                order: order
            },
            success: function (res) {
                alert('Order updated!');
            },
            error: function () {
                alert('Something went wrong.');
            }
        });
    });
</script>
@endsection
