<?php

use Illuminate\Support\Facades\DB;

/**
 * Get all permissions (route slugs) of logged-in user from modules table
 * যেখানে type='permission' এবং user-module relation আছে।
 */
if (!function_exists('getUserRoutePermissions')) {
    function getUserRoutePermissions(): array
    {
        $user = session('user');
        if (!$user) return [];

        return cache()->remember("user_permissions_{$user->id}", 1, function () use ($user) {
            return DB::table('user_module_permission')
                ->join('modules', 'user_module_permission.module_id', '=', 'modules.id')
                ->where('user_module_permission.user_id', $user->id)
                ->where('modules.type', 'permission')
                ->pluck('modules.slug')
                ->toArray();
        });
    }
}

/**
 * Return breadcrumb module chain for a given route name if user has permission
 */
if (!function_exists('findModuleChainByRoute')) {
    function findModuleChainByRoute($modules, string $routeName)
    {
        if (!$modules || !is_iterable($modules)) return collect();

        $permissions = getUserRoutePermissions();
        if (!in_array($routeName, $permissions)) return collect();

        $modules = collect($modules);
        $current = $modules->firstWhere('slug', $routeName);
        if (!$current) return collect();

        $chain = [];
        while ($current) {
            $chain[] = $current;
            $current = $modules->firstWhere('id', $current->parent_id);
        }

        return collect(array_reverse($chain)); // parent → child order
    }
}

