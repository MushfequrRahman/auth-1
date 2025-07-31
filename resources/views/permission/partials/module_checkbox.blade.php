<div class="ms-{{ $module->parent_id ? '4' : '0' }} mb-2">
    <label>
        <input type="checkbox" name="permissions[]" value="{{ $module->id }}"
            {{ in_array($module->id, $userPermissions) ? 'checked' : '' }}>
        {{ $module->slug }}
    </label>
</div>

@if(!empty($module->children))
    @foreach($module->children as $child)
        @include('partials.module-checkbox', ['module' => $child, 'userPermissions' => $userPermissions])
    @endforeach
@endif
