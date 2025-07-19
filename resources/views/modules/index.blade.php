@extends('layouts.master')
@section('title', 'Nested Module Sort')

@section('content')

@if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
@endif

@if(session('error'))
    <div class="alert alert-danger">{{ session('error') }}</div>
@endif

<div class="mb-4">
    <form action="{{ route('modules.store') }}" method="POST" class="d-flex flex-wrap gap-2">
        @csrf
        <input type="text" name="name" placeholder="Module name" class="form-control mb-2" required>
        <input type="text" name="route" placeholder="Route name (optional)" class="form-control mb-2">
        <input type="text" name="icon" placeholder="FontAwesome Icon (e.g., fas fa-users)" class="form-control mb-2">
        <button type="submit" class="btn btn-primary mb-2">Add Module</button>
    </form>
</div>

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
