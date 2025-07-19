<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PermissionController extends Controller
{
    public function index()
    {
        $permissions = DB::table('permissions')->join('modules', 'permissions.module_id', '=', 'modules.id')
            ->select('permissions.*', 'modules.name as module_name')
            ->get();
        return view('permissions.index', compact('permissions'));
    }

    public function create()
    {
        //$modules = DB::table('modules')->get();
        $pmodules = DB::table('modules')
            ->where(function ($query) {
                $query->whereNull('route')
                    ->orWhere('route', '')
                    ->orWhere('route', '#');
            })
            ->get();
        return view('permissions.create', compact('pmodules'));
    }

    public function store(Request $request)
    {
        DB::table('permissions')->insert([
            'module_id' => $request->module_id,
            'name' => $request->name,
            'slug' => strtolower($request->slug),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        return redirect()->route('permissions.index')->with('success', 'Permission created.');
    }

    public function edit($id)
    {
        $permission = DB::table('permissions')->where('id', $id)->first();
        //$modules = DB::table('modules')->get();
        $pmodules = DB::table('modules')
            ->where(function ($query) {
                $query->whereNull('route')
                    ->orWhere('route', '')
                    ->orWhere('route', '#');
            })
            ->get();
        return view('permissions.edit', compact('permission', 'pmodules'));
    }

    // public function update(Request $request, $id)
    // {
    //     DB::table('permissions')->where('id', $id)->update([
    //         'module_id' => $request->module_id,
    //         'name' => $request->name,
    //         'slug' => strtolower($request->slug),
    //         'updated_at' => now(),
    //     ]);
    //     return redirect()->route('permissions.index')->with('success', 'Permission updated.');
    // }

    public function update(Request $request, $id)
    {
        $request->validate([
            'module_id' => 'required|integer',
            'name' => 'required|string',
            'slug' => 'required|string',
        ]);

        // Get old module_id before update
        $oldPermission = DB::table('permissions')->where('id', $id)->first();

        // Update the permission
        DB::table('permissions')->where('id', $id)->update([
            'module_id' => $request->module_id,
            'name' => $request->name,
            'slug' => strtolower($request->slug),
            'updated_at' => now(),
        ]);

        // If module_id changed, update related user_module_permission entries
        if ($oldPermission && $oldPermission->module_id != $request->module_id) {
            DB::table('user_module_permission')
                ->where('module_id', $oldPermission->module_id)
                ->update([
                    'module_id' => $request->module_id
                ]);
        }

        return redirect()->route('permissions.index')->with('success', 'Permission updated.');
    }


    public function destroy($id)
    {
        DB::table('permissions')->where('id', $id)->delete();
        return redirect()->route('permissions.index')->with('success', 'Permission deleted.');
    }
}
