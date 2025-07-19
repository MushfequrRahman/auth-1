<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ModuleController extends Controller
{
    public function index()
    {
        $modules = DB::table('modules')->orderBy('order')->get();
        return view('modules.index', compact('modules'));
    }

    public function list()
    {
        $modules = DB::table('modules')->orderBy('order')->get();
        return view('modules.list', compact('modules'));
    }


    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:modules,name',
            'route' => 'nullable|string',
            'icon'  => 'nullable|string',
        ]);

        DB::table('modules')->insert([
            'name'       => $request->name,
            'route'      => $request->route,
            'icon'       => $request->icon,
            'parent_id'  => null,
            'order'      => DB::table('modules')->max('order') + 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return redirect()->route('modules.index')->with('success', 'Module created successfully.');
    }

    public function updateOrder(Request $request)
    {
        $this->saveNested($request->order);
        return response()->json(['status' => 'success']);
    }

    private function saveNested(array $items, $parentId = null)
    {
        foreach ($items as $index => $item) {
            DB::table('modules')->where('id', $item['id'])->update([
                'parent_id' => $parentId,
                'order'     => $index + 1,
            ]);
            if (!empty($item['children'])) {
                $this->saveNested($item['children'], $item['id']);
            }
        }
    }
    public function edit($id)
    {
        $module = DB::table('modules')->where('id', $id)->first();
        if (!$module) {
            return redirect()->route('modules.index')->with('error', 'Module not found.');
        }

        return view('modules.edit', compact('module'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string',
            'route' => 'nullable|string',
            'icon'  => 'nullable|string',
        ]);

        DB::table('modules')->where('id', $id)->update([
            'name' => $request->name,
            'route' => $request->route,
            'icon'  => $request->icon,
            'updated_at' => now(),
        ]);

        return redirect()->route('modules.index')->with('success', 'Module updated successfully.');
    }
}
