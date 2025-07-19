<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RoleController extends Controller
{
    public function index()
    {
        $roles = DB::table('roles')->get();
        return view('roles.index', compact('roles'));
    }

    public function create()
    {
        return view('roles.create');
    }

    public function store(Request $request)
    {
        $request->validate(['name' => 'required|unique:roles']);

        DB::table('roles')->insert([
            'name' => $request->name,
            'created_at' => now(),
            'updated_at' => now()
        ]);

        return redirect()->route('roles.index')->with('success', 'Role created');
    }

    public function edit($id)
    {
        $role = DB::table('roles')->where('id', $id)->first();
        return view('roles.edit', compact('role'));
    }

    public function update(Request $request, $id)
    {
        $request->validate(['name' => 'required']);

        DB::table('roles')->where('id', $id)->update([
            'name' => $request->name,
            'updated_at' => now()
        ]);

        return redirect()->route('roles.index')->with('success', 'Role updated');
    }

    public function destroy($id)
    {
        DB::table('roles')->where('id', $id)->delete();
        return redirect()->route('roles.index')->with('success', 'Role deleted');
    }

    public function showAssignForm($id)
{
    $role = DB::table('roles')->where('id', $id)->first();
    $modules = DB::table('modules')->orderBy('order')->get();
    $permissions = DB::table('permissions')->get();

    $assigned = DB::table('role_module_permission')
        ->where('role_id', $id)
        ->get()
        ->groupBy('module_id')
        ->map(function ($group) {
            return $group->pluck('permission_id')->toArray();
        })
        ->toArray();

    return view('roles.permission-form', compact('role', 'modules', 'permissions', 'assigned'));
}

public function assignPermissions(Request $request, $id)
{
    DB::table('role_module_permission')->where('role_id', $id)->delete();

    foreach ($request->permissions as $moduleId => $permissionIds) {
        foreach ($permissionIds as $pid) {
            DB::table('role_module_permission')->insert([
                'role_id' => $id,
                'module_id' => $moduleId,
                'permission_id' => $pid,
            ]);
        }
    }

    return redirect()->route('roles.index')->with('success', 'Permissions updated.');
}

}
