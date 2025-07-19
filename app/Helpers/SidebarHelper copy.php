<?php

// use Illuminate\Support\Facades\DB;
// use Illuminate\Support\Facades\Route;

// /**
//  * Nestable Module Structure (Drag & Drop)
//  */
// if (!function_exists('renderModules')) {
//     function renderModules($modules, $parentId = null)
//     {
//         $html = '<ol class="dd-list">';
//         foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $module) {
//             $html .= '<li class="dd-item" data-id="' . $module->id . '">';
//             $html .= '<div class="dd-handle">';

//             if (!empty($module->route) && Route::has($module->route)) {
//                 $html .= '<a href="' . route($module->route) . '">' . $module->name . '</a>';
//             } else {
//                 $html .= $module->name;
//             }

//             $html .= '</div>';

//             if ($modules->where('parent_id', $module->id)->count()) {
//                 $html .= renderModules($modules, $module->id);
//             }

//             $html .= '</li>';
//         }
//         $html .= '</ol>';
//         return $html;
//     }
// }

// /**
//  * Sidebar Menu Build (User Wise)
//  */
// if (!function_exists('buildSidebarMenu')) {
//     function buildSidebarMenu($modules, $userModuleIds, $parentId = null)
//     {
//         $html = '<ul class="list-group list-group-flush">';
//         foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $module) {
//             if (!in_array($module->id, $userModuleIds)) continue;

//             $hasChildren = $modules->where('parent_id', $module->id)->count();
//             $html .= '<li class="list-group-item">';

//             if ($hasChildren) {
//                 $html .= '
//                     <div class="d-flex justify-content-between align-items-center">
//                         <a class="text-decoration-none" data-bs-toggle="collapse" href="#module-' . $module->id . '" role="button" aria-expanded="false">
//                             ' . $module->name . '
//                         </a>
//                         <span>▼</span>
//                     </div>
//                     <div class="collapse ps-3" id="module-' . $module->id . '">
//                         ' . buildSidebarMenu($modules, $userModuleIds, $module->id) . '
//                     </div>
//                 ';
//             } else {
//                 $route = Route::has($module->route) ? route($module->route) : '#';
//                 $html .= '<a href="' . $route . '" class="text-decoration-none d-block">' . $module->name . '</a>';
//             }

//             $html .= '</li>';
//         }
//         $html .= '</ul>';
//         return $html;
//     }
// }

// /**
//  * Check User Permission by Slug (User Wise)
//  */
// if (!function_exists('userHasPermission')) {
//     function userHasPermission($slug)
//     {
//         $user = session('user');
//         if (!$user) return false;

//         $permissions = cache()->remember('user_permissions_' . $user->id, 60, function () use ($user) {
//             return DB::table('user_module_permission')
//                 ->join('permissions', 'user_module_permission.permission_id', '=', 'permissions.id')
//                 ->where('user_module_permission.user_id', $user->id)
//                 ->pluck('permissions.slug')
//                 ->toArray();
//         });

//         return in_array($slug, $permissions);
//     }
// }

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

/**
 * Nestable Drag & Drop Structure
 */
if (!function_exists('renderModules')) {
    function renderModules($modules, $parentId = null)
    {
        $html = '<ol class="dd-list">';
        foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $module) {
            $html .= '<li class="dd-item" data-id="' . $module->id . '">';
            $html .= '<div class="dd-handle">';

            if (!empty($module->route) && Route::has($module->route)) {
                $html .= '<a href="' . route($module->route) . '">' . $module->name . '</a>';
            } else {
                $html .= $module->name;
            }

            $html .= '</div>';

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
 * Build Sidebar Menu for specific user
 */
if (!function_exists('buildSidebarMenu')) {
    function buildSidebarMenu($modules, $permissions, $parentId = null)
    {
        $html = '<ul class="list-group list-group-flush">';

        // শুধু parent module গুলা
        foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $parent) {
            // এই parent module এর all child
            $children = $modules->where('parent_id', $parent->id)->sortBy('order');

            $hasVisibleChild = false;
            $childHtml = '';

            foreach ($children as $child) {
                // child এর route যদি permission list-এ থাকে
                if (!empty($child->route) && in_array($child->route, $permissions)) {
                    $hasVisibleChild = true;
                    $route = !empty($child->route) ? route($child->route) : '#';

                    $childHtml .= '<li class="list-group-item border-0 ps-4">
                        <a href="' . $route . '" class="text-decoration-none d-block">' . $child->name . '</a>
                    </li>';
                }
            }

            if ($hasVisibleChild) {
                $html .= '<li class="list-group-item">';
                $html .= '
                    <div class="d-flex justify-content-between align-items-center">
                        <span>' . $parent->name . '</span>
                        <span>▼</span>
                    </div>
                    <ul class="list-group list-group-flush ps-3">
                        ' . $childHtml . '
                    </ul>
                ';
                $html .= '</li>';
            }
        }

        $html .= '</ul>';
        return $html;
    }
}

/**
 * Check if user has a specific permission by slug
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


///////////// FOR LOGIN PAGE//////


if (!function_exists('hasVisibleChildren')) {
    function hasVisibleChildren($modules, $moduleId, $permissions) {
        $children = $modules->where('parent_id', $moduleId);

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

if (!function_exists('renderSidebarMenu')) {
    function renderSidebarMenu($modules, $parentId, $permissions) {
        $html = '<ul class="list-group list-group-flush">';

        foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $module) {
            $hasChildren = hasVisibleChildren($modules, $module->id, $permissions);

            $isVisible = $hasChildren ||
                (!empty($module->route) && in_array($module->route, $permissions));

            if (!$isVisible) continue;

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
}

