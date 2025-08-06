<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PermissionAssignController extends Controller
{
    public function index(Request $request)
    {
        $users = DB::table('users')->get();
        $user_id = $request->query('user_id');
        $user_name = $request->query('user_name');

        $modules = DB::table('modules')
            ->where('type', 'module')
            ->where('slug', '!=', '#')
            ->orderBy('order')
            ->get();

        $permissionsByModule = DB::table('modules')
            ->where('type', 'permission')
            ->where('slug', '!=', '#')
            ->orderBy('order')
            ->get()
            ->groupBy('parent_id');

        return view('permission.assign', compact('users', 'user_id', 'user_name','modules', 'permissionsByModule'));
    }


    public function getUserPermissions(Request $request)
    {
        $userId = $request->user_id;

        $assigned = DB::table('user_module_permission')
            ->where('user_id', $userId)
            ->pluck('module_id')
            ->toArray();

        return response()->json($assigned);
    }

    public function updatePermission(Request $request)
    {
        $userId = $request->user_id;
        $moduleIds = $request->module_ids ?? [];

        DB::table('user_module_permission')->where('user_id', $userId)->delete();

        foreach ($moduleIds as $moduleId) {
            DB::table('user_module_permission')->insert([
                'user_id' => $userId,
                'module_id' => $moduleId,
            ]);
        }

        return response()->json(['status' => 'success']);
    }
}
