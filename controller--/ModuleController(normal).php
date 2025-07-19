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

    public function create()
    {
        return view('modules.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:modules,name',
            'order' => 'nullable|integer',
        ]);

        DB::table('modules')->insert([
            'name' => $request->name,
            'order' => $request->order ?? 0,
        ]);

        return redirect()->route('modules.index')->with('success', 'Module created successfully.');
    }

    public function edit($id)
    {
        $module = DB::table('modules')->where('id', $id)->first();
        return view('modules.edit', compact('module'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|unique:modules,name,' . $id,
            'order' => 'nullable|integer',
        ]);

        DB::table('modules')->where('id', $id)->update([
            'name' => $request->name,
            'order' => $request->order ?? 0,
        ]);

        return redirect()->route('modules.index')->with('success', 'Module updated successfully.');
    }
}
