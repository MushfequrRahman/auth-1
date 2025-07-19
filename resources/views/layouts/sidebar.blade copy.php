<!-- @php
    
    $modules = DB::table('modules')->get();
@endphp
@if(Session::has('user'))
<div class="p-3">
    <h5 class="mb-3">Menu</h5>
    {!! buildSidebarMenu($modules) !!}
</div>
@endif -->

@php
    use Illuminate\Support\Facades\DB;

    $user = session('user');
    $modules = DB::table('modules')->get();
    $permissions = [];

    if ($user) {
        $permissions = DB::table('user_module_permission')
            ->join('permissions', 'user_module_permission.permission_id', '=', 'permissions.id')
            ->where('user_module_permission.user_id', $user->id)
            ->pluck('permissions.slug')
            ->toArray();
    }
@endphp

@if($user && count($permissions))
    <div class="p-3">
        <h5 class="mb-3">Menu</h5>

        <ul>
            @foreach ($modules->where('parent_id', null) as $parent)
                @php
                    $children = $modules->where('parent_id', $parent->id);
                    $visibleChildren = $children->filter(function ($child) use ($permissions) {
                        return in_array($child->route, $permissions);
                    });
                @endphp

                @if ($visibleChildren->count())
                    <li><strong>{{ $parent->name }}</strong>
                        <ul>
                            @foreach ($visibleChildren as $child)
                                <li>
                                    <a href="{{ route($child->route) }}">{{ $child->name }}</a>
                                </li>
                            @endforeach
                        </ul>
                    </li>
                @endif
            @endforeach
        </ul>
    </div>
@else
    <p class="text-danger">No menu access</p>
@endif
@php
    function hasVisibleChildren($modules, $moduleId, $permissions) {
        $children = $modules->where('parent_id', $moduleId);

        foreach ($children as $child) {
            // যদি এই child এর route permission এ থাকে
            if (!empty($child->route) && in_array($child->route, $permissions)) {
                return true;
            }

            // নতুবা যদি এর nested child থাকে permission সহ
            if (hasVisibleChildren($modules, $child->id, $permissions)) {
                return true;
            }
        }

        return false;
    }

    function renderSidebarMenu($modules, $parentId, $permissions) {
        $html = '<ul class="list-group list-group-flush">';

        foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $module) {
            if (!hasVisibleChildren($modules, $module->id, $permissions) && (empty($module->route) || !in_array($module->route, $permissions))) {
                continue;
            }

            $children = $modules->where('parent_id', $module->id);
            $hasChildren = hasVisibleChildren($modules, $module->id, $permissions);

            $html .= '<li class="list-group-item">';

            if ($hasChildren) {
                $html .= '
                    <div class="d-flex justify-content-between align-items-center">
                        <a class="text-decoration-none" data-bs-toggle="collapse" href="#module-' . $module->id . '" role="button" aria-expanded="false">
                            ' . $module->name . '
                        </a>
                        <span>▼</span>
                    </div>
                    <div class="collapse ps-3" id="module-' . $module->id . '">
                        ' . renderSidebarMenu($modules, $module->id, $permissions) . '
                    </div>
                ';
            } else {
                $route = (!empty($module->route) && in_array($module->route, $permissions)) ? route($module->route) : '#';
                $html .= '<a href="' . $route . '" class="text-decoration-none d-block">' . $module->name . '</a>';
            }

            $html .= '</li>';
        }

        $html .= '</ul>';
        return $html;
    }
@endphp

@if($user && count($permissions))
    <div class="p-3">
        <h5 class="mb-3">Menu</h5>
        {!! renderSidebarMenu($modules, null, $permissions) !!}
    </div>
@else
    <p class="text-danger">No menu access</p>
@endif


