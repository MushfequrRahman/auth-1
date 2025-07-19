@extends('layouts.master')
@section('title', 'Module List & Sort')
@section('content')

<div class="mb-4">
    <form action="{{ route('modules.store') }}" method="POST" class="d-flex gap-2">
        @csrf
        <input type="text" name="name" placeholder="Module name" class="form-control" required>
        <button type="submit" class="btn btn-primary">Add Module</button>
    </form>
</div>

@if (session('success'))
<div class="alert alert-success">{{ session('success') }}</div>
@endif

<ul id="sortable" class="list-group">
    @foreach ($modules as $module)
    <li class="list-group-item d-flex justify-content-between align-items-center" data-id="{{ $module->id }}">
        <div>
            <span class="handle me-2" style="cursor: move;">⠿</span>
            {{ $module->name }}
        </div>
        <div>
            <a href="{{ route('modules.edit', $module->id) }}" class="btn btn-sm btn-warning">Edit</a>
        </div>
    </li>
    @endforeach
</ul>

@endsection

@section('scripts')
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>
    $(function() {
        $('#sortable').sortable({
            handle: '.handle',
            update: function() {
                let order = [];
                $('#sortable li').each(function() {
                    order.push($(this).data('id'));
                });

                $.ajax({
                    url: "{{ route('modules.order-update') }}",
                    method: "POST",
                    data: {
                        _token: "{{ csrf_token() }}",
                        order: order
                    },
                    success: function(res) {
                        console.log(res.status);
                    }
                });
            }
        });
    });
</script>
@endsection