@extends('layouts.master')
@section('title', 'Module Menu')
@section('content')
<h2>Nested Module Menu</h2>
<ul id="nestable" class="list-group">
    @foreach ($nestedModules[null] ?? [] as $module)
        @include('modules.partials.module-item', ['module' => $module, 'nestedModules' => $nestedModules])
    @endforeach
</ul>
@endsection

@section('scripts')
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>
function serializeModules(ul, parentId = null) {
    let order = [];
    $(ul).children('li').each(function(index) {
        const id = $(this).data('id');
        order.push({ id: id, parent_id: parentId });

        const children = $(this).children('ul');
        if (children.length) {
            order = order.concat(serializeModules(children, id));
        }
    });
    return order;
}

$('#nestable').sortable({
    handle: '.handle',
    items: '> li',
    placeholder: 'highlight',
    update: function() {
        const order = serializeModules($('#nestable'));

        $.post("{{ route('modules.order-update') }}", {
            _token: "{{ csrf_token() }}",
            order: order
        }, function(res) {
            console.log(res);
        });
    }
});
</script>
@endsection


<!-- ✅ resources/views/modules/partials/module-item.blade.php -->
<li class="list-group-item" data-id="{{ $module->id }}">
    <div class="handle" style="cursor: move;">
        📁 <a href="#">{{ $module->name }}</a>
    </div>
    @if (isset($nestedModules[$module->id]))
        <ul class="list-group ms-4">
            @foreach ($nestedModules[$module->id] as $child)
                @include('modules.partials.module-item', ['module' => $child, 'nestedModules' => $nestedModules])
            @endforeach
        </ul>
    @endif
</li>
