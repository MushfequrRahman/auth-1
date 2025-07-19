<?php
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

/**
 * Nestable Drag & Drop Tree View for Admin Panel
 */
if (!function_exists('renderModules')) {
    function renderModules($modules, $parentId = null)
    {
        $html = '<ol class="dd-list">';
        foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $module) {
            $html .= '<li class="dd-item" data-id="' . $module->id . '">';
            $html .= '<div class="dd-handle">';

            // Icon যুক্ত করো
            $iconHtml = '<i class="' . ($module->icon ?? 'fas fa-circle') . ' me-1"></i> ';

            // Route থাকলে লিংক করো
            if (!empty($module->route) && Route::has($module->route)) {
                $html .= $iconHtml . '<a href="' . route($module->route) . '">' . $module->name . '</a>';
            } else {
                $html .= $iconHtml . $module->name;
            }

            $html .= '</div>';

            // যদি child থাকে, recursive call
            if ($modules->where('parent_id', $module->id)->count()) {
                $html .= renderModules($modules, $module->id);
            }

            $html .= '</li>';
        }
        $html .= '</ol>';
        return $html;
    }
}


/**
 * Check if any visible children exist (based on permission)
 */
if (!function_exists('hasVisibleChildren')) {
    function hasVisibleChildren($modules, $parentId, $permissions)
    {
        $children = $modules->where('parent_id', $parentId);
        foreach ($children as $child) {
            if (!empty($child->route) && in_array($child->route, $permissions)) {
                return true;
            }
            if (hasVisibleChildren($modules, $child->id, $permissions)) {
                return true;
            }
        }
        return false;
    }
}

/**
 * AdminLTE 3 Style Sidebar Renderer
 */
if (!function_exists('renderSidebarMenu')) {
    function renderSidebarMenu($modules, $parentId = null, $permissions = [])
    {
        $html = '';
        foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $module) {
            $hasChildren = hasVisibleChildren($modules, $module->id, $permissions);
            $isVisible = $hasChildren || (!empty($module->route) && in_array($module->route, $permissions));
            if (!$isVisible) continue;

            $icon = $module->icon ?? 'fas fa-circle';
            $route = (!empty($module->route) && in_array($module->route, $permissions)) ? route($module->route) : '#';
            $isActive = request()->routeIs($module->route ?? '') ? 'active' : '';

            if ($hasChildren) {
                $html .= '<li class="nav-item has-treeview">';
                $html .= '<a href="#" class="nav-link ' . $isActive . '">';
                $html .= '<i class="nav-icon ' . $icon . '"></i>';
                $html .= '<p>' . $module->name . '<i class="right fas fa-angle-left"></i></p>';
                $html .= '</a>';
                $html .= '<ul class="nav nav-treeview">';
                $html .= renderSidebarMenu($modules, $module->id, $permissions);
                $html .= '</ul>';
                $html .= '</li>';
            } else {
                $html .= '<li class="nav-item">';
                $html .= '<a href="' . $route . '" class="nav-link ' . $isActive . '">';
                $html .= '<i class="nav-icon ' . $icon . '"></i>';
                $html .= '<p>' . $module->name . '</p>';
                $html .= '</a>';
                $html .= '</li>';
            }
        }
        return $html;
    }
}

/**
 * User Permission Checker
 */
if (!function_exists('userHasPermission')) {
    function userHasPermission($slug)
    {
        $user = session('user');
        if (!$user) return false;

        $permissions = cache()->remember('user_permissions_' . $user->id, 60, function () use ($user) {
            return DB::table('user_module_permission')
                ->join('permissions', 'user_module_permission.permission_id', '=', 'permissions.id')
                ->where('user_module_permission.user_id', $user->id)
                ->pluck('permissions.slug')
                ->toArray();
        });

        return in_array($slug, $permissions);
    }
}
