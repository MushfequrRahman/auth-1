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

        $hasPermission = DB::table('user_module_permission')
            ->join('permissions', 'user_module_permission.permission_id', '=', 'permissions.id')
            ->where('permissions.slug', $permissionSlug)
            ->where('user_module_permission.user_id', $user->id)
            ->exists();

        if (!$hasPermission) {
            abort(403, 'Unauthorized');
        }

        return $next($request);
    }
}
