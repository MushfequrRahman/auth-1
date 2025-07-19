@php
    $items = $modules->where('parent_id', $parentId);
@endphp
@foreach($items as $module)
    <li class="list-group-item" data-id="{{ $module->id }}">
        <div>{{ $module->name }}
            <a href="{{ route('modules.edit', $module->id) }}" class="btn btn-sm btn-secondary">Edit</a>
        </div>
        @if($modules->where('parent_id', $module->id)->count())
            <ul class="list-group">
                @include('modules.partials.module-nestable', ['modules' => $modules, 'parentId' => $module->id])
            </ul>
        @endif
    </li>
@endforeach