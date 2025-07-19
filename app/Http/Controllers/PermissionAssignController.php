<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PermissionAssignController extends Controller
{
    public function show()
    {
        $users = DB::table('users')->get();
        $modules = DB::table('modules')->get();
        $permissions = DB::table('permissions')->get();

        return view('permission.assign', compact('users', 'modules', 'permissions'));
    }

    public function getUserPermissions(Request $request)
    {
        $userId = $request->query('user_id');
        $assignedPermissionIds = DB::table('user_module_permission')
            ->where('user_id', $userId)
            ->pluck('permission_id');

        return response()->json($assignedPermissionIds);
    }

    public function updatePermission(Request $request)
    {
        $data = $request->validate([
            'user_id' => 'required|integer',
            'module_id' => 'required|integer',
            'permission_id' => 'required|integer',
            'checked' => 'required|boolean',
        ]);

        if ($data['checked']) {
            DB::table('user_module_permission')->updateOrInsert(
                [
                    'user_id' => $data['user_id'],
                    'module_id' => $data['module_id'],
                    'permission_id' => $data['permission_id'],
                ],
                ['created_at' => now(), 'updated_at' => now()]
            );
        } else {
            DB::table('user_module_permission')
                ->where([
                    'user_id' => $data['user_id'],
                    'module_id' => $data['module_id'],
                    'permission_id' => $data['permission_id'],
                ])
                ->delete();
        }

        return response()->json(['status' => 'success']);
    }
}

