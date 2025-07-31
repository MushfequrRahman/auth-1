<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/**
 * ✅ Nestable Drag & Drop Tree View for Admin Panel
 */
if (!function_exists('renderModules')) {
    function renderModules($modules, $parentId = null)
    {
        $html = '<ol class="dd-list">';

        $children = $modules->where('parent_id', $parentId)->sortBy('order');
        foreach ($children as $module) {
            $html .= '<li class="dd-item" data-id="' . $module->id . '">';
            $html .= '<div class="dd-handle">';

            $icon = $module->icon ?? 'fas fa-circle';
            $iconHtml = '<i class="' . $icon . ' me-1"></i> ';

            // যদি valid route থাকে
            if (!empty($module->route) && Route::has($module->route)) {
                $html .= $iconHtml . '<a href="' . route($module->route) . '">' . $module->name . '</a>';
            } else {
                $html .= $iconHtml . $module->name;
            }

            $html .= '</div>';

            // চাইল্ড থাকলে রিকার্সিভ কল
            if ($modules->where('parent_id', $module->id)->isNotEmpty()) {
                $html .= renderModules($modules, $module->id);
            }

            $html .= '</li>';
        }

        $html .= '</ol>';
        return $html;
    }
}

/**
 * ✅ চেক করে যে কোন child মডিউল user এর permission আছে কিনা
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
 * ✅ AdminLTE 3 style sidebar renderer, user_module_permission ভিত্তিক
 */
function renderSidebarMenu($modules, $permissions, $parentId = null)
{
    $html = '';
    $filtered = $modules->where('parent_id', $parentId);

    foreach ($filtered as $module) {
        $hasPermission = isset($permissions[$module->id]);

        // Recursively check if this module or its descendants have permission
        $hasVisibleChildren = hasVisibleDescendantPermission($modules, $module->id, $permissions);

        // Render permission link if directly accessible
        if (
            $module->type === 'permission' &&
            $hasPermission &&
            $module->route &&
            $module->slug
        ) {
            $html .= '<li class="nav-item">';
            $html .= '<a href="' . route($module->route) . '" class="nav-link">';
            $html .= '<i class="nav-icon fas fa-dot-circle"></i>';
            $html .= '<p>' . $module->name . '</p>';
            $html .= '</a></li>';
        }

        // Render module if it has visible children
        elseif (
            $module->type === 'module' &&
            $hasVisibleChildren
        ) {
            $html .= '<li class="nav-item has-treeview">';
            $html .= '<a href="#" class="nav-link">';
            $html .= '<i class="nav-icon fas fa-folder"></i>';
            $html .= '<p>' . $module->name . '<i class="right fas fa-angle-left"></i></p>';
            $html .= '</a>';
            $html .= '<ul class="nav nav-treeview">';
            $html .= renderSidebarMenu($modules, $permissions, $module->id);
            $html .= '</ul></li>';
        }
    }

    return $html;
}

if (!function_exists('hasVisibleDescendantPermission')) {
    function hasVisibleDescendantPermission($modules, $parentId, $permissions)
    {
        $children = $modules->where('parent_id', $parentId);

        foreach ($children as $child) {
            if ($child->type === 'permission' && isset($permissions[$child->id])) {
                return true;
            }

            if ($child->type === 'module' && hasVisibleDescendantPermission($modules, $child->id, $permissions)) {
                return true;
            }
        }

        return false;
    }
}




/**
 * ✅ User এর অনুমোদিত route list (permission module গুলো)
 */
if (!function_exists('userPermissions')) {
    function userPermissions()
    {
        $user = Auth::user();
        if (!$user) return [];

        return cache()->remember("user_routes_{$user->id}", 60, function () use ($user) {
            return DB::table('user_module_permission')
                ->join('modules', 'user_module_permission.module_id', '=', 'modules.id')
                ->where('user_module_permission.user_id', $user->id)
                ->where('modules.type', 'permission')
                ->whereNotNull('modules.route')
                ->pluck('modules.route')
                ->toArray();
        });
    }
}


/**
 * ✅ নির্দিষ্ট module slug এর permission আছে কিনা
 */
if (!function_exists('userHasPermission')) {
    function userHasPermission($slug)
    {
        $user = Auth::user();
        if (!$user) return false;

        return DB::table('user_module_permission')
            ->join('modules', 'user_module_permission.module_id', '=', 'modules.id')
            ->where('user_module_permission.user_id', $user->id)
            ->where('modules.slug', $slug)
            ->exists();
    }
}
