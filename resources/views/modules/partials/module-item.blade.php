<li class="list-group-item" data-id="{{ $module->id }}">
    {{ $module->name }}
    <a href="{{ route('modules.edit', $module->id) }}" class="btn btn-sm btn-outline-secondary float-end">Edit</a>

    @php
        $children = $modules->where('parent_id', $module->id)->sortBy('order');
    @endphp

    @if ($children->count())
        <ul class="list-group mt-2">
            @foreach ($children as $child)
                @include('modules.partials.module-item', ['module' => $child, 'modules' => $modules])
            @endforeach
        </ul>
    @endif
</li>
