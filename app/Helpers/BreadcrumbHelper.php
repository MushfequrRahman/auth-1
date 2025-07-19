<?php

use Illuminate\Support\Facades\DB;

/**
 * Get all permissions (routes) of logged-in user
 */
if (!function_exists('getUserRoutePermissions')) {
    function getUserRoutePermissions(): array
    {
        $user = session('user');
        if (!$user) return [];

        return cache()->remember("user_permissions_{$user->id}", 60, function () use ($user) {
            return DB::table('user_module_permission')
                ->join('permissions', 'user_module_permission.permission_id', '=', 'permissions.id')
                ->where('user_module_permission.user_id', $user->id)
                ->pluck('permissions.slug')
                ->toArray();
        });
    }
}

/**
 * Return breadcrumb module chain (if user has permission)
 */
if (!function_exists('findModuleChainByRoute')) {
    function findModuleChainByRoute($modules, string $routeName)
    {
        if (!$modules || !is_iterable($modules)) return collect();

        $permissions = getUserRoutePermissions();
        if (!in_array($routeName, $permissions)) return collect();

        $modules = collect($modules);
        $current = $modules->firstWhere('route', $routeName);
        if (!$current) return collect();

        $chain = [];
        while ($current) {
            $chain[] = $current;
            $current = $modules->firstWhere('id', $current->parent_id);
        }

        return collect(array_reverse($chain)); // parent → child
    }
}
