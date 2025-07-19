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

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:modules,name'
        ]);

        DB::table('modules')->insert([
            'name' => $request->name,
            'order' => DB::table('modules')->max('order') + 1,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return redirect()->back()->with('success', 'Module added.');
    }

    public function updateOrder(Request $request)
    {
        foreach ($request->order as $index => $id) {
            DB::table('modules')->where('id', $id)->update(['order' => $index]);
        }

        return response()->json(['status' => 'Order updated']);
    }
    // Show Edit Form
    public function edit($id)
    {
        $module = DB::table('modules')->where('id', $id)->first();
        return view('modules.edit', compact('module'));
    }

    // Handle Update Request
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255'
        ]);

        DB::table('modules')->where('id', $id)->update([
            'name' => $request->name
        ]);

        return redirect()->route('modules.index')->with('success', 'Module updated successfully!');
    }
}
