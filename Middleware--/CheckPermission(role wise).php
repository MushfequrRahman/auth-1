<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CheckPermission
{
    public function handle(Request $request, Closure $next, $permissionSlug)
    {
        $user = session('user');
        if (!$user) {
            return redirect('/login')->with('error', 'Please login first.');
        }

        $roleId = $user->role_id;

        $hasPermission = DB::table('role_module_permission')
            ->join('permissions', 'role_module_permission.permission_id', '=', 'permissions.id')
            ->where('permissions.slug', $permissionSlug)
            ->where('role_module_permission.role_id', $roleId)
            ->exists();

        if (!$hasPermission) {
            abort(403, 'Unauthorized');
        }

        return $next($request);
    }
}
