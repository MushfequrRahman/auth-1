<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CheckPermission
{
    public function handle(Request $request, Closure $next, $permissionSlug)
    {
        // Session থেকে ইউজার আনা
        $user = session('user');

        if (!$user) {
            return redirect('/login')->with('error', 'Please login first.');
        }

        // user_module_permission টেবিলে permission slug খোঁজা
        $hasPermission = DB::table('user_module_permission')
            ->join('modules', 'user_module_permission.module_id', '=', 'modules.id')
            ->where('modules.slug', $permissionSlug)
            ->where('modules.type', 'permission')
            ->where('user_module_permission.user_id', $user->id)
            ->exists();

        if (!$hasPermission) {
            abort(403, 'Unauthorized access to permission: ' . $permissionSlug);
        }

        return $next($request);
    }
}
