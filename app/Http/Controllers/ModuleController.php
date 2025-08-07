<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class ModuleController extends Controller
{
    // মডিউলের তালিকা দেখাবে
    public function index()
    {
        $modules = DB::table('modules')->orderBy('order')->get();
        return view('modules.index', compact('modules'));
    }

    // নতুন মডিউল ফর্ম
    public function create()
    {
        $parentModules = DB::table('modules')->where('type', 'module')->get();
        return view('modules.create', compact('parentModules'));
    }

    // নতুন মডিউল সংরক্ষণ
    public function store(Request $request)
    {
        $request->validate([
            'name'      => 'required|unique:modules,name',
            'slug'      => 'nullable|string|max:255',
            'type'      => 'required|in:module,permission',
            'route'     => 'nullable|string|max:255',
            'icon'      => 'nullable|string|max:255',
            'order'     => 'nullable|integer',
            
            'parent_id' => 'nullable|exists:modules,id',
            'showinsidebar'     => 'nullable|integer',
        ]);

        DB::table('modules')->insert([
            'name'      => $request->name,
            'slug'      => $request->slug,
            'type'      => $request->type,
            'route'     => $request->route,
            'icon'      => $request->icon,
            'order'     => $request->order ?? 0,
            
            'parent_id' => $request->parent_id,
            'created_at'=> now(),
            'updated_at'=> now(),
            'show_in_sidebar'     => $request->showinsidebar ?? 0,
        ]);

        Cache::forget('modules'); // ক্যাশ ক্লিয়ার
        session()->forget('modules');

        return redirect()->route('modules.index')->with('success', 'Module created successfully.');
    }

    // মডিউল এডিট ফর্ম
    public function edit($id)
    {
        $module = DB::table('modules')->where('id', $id)->first();
        if (!$module) return redirect()->back()->with('error', 'Module not found.');

        $parentModules = DB::table('modules')->where('type', 'module')->where('id', '!=', $id)->get();

        return view('modules.edit', compact('module', 'parentModules'));
    }

    // মডিউল অর্ডার আপডেট
    public function updateOrder(Request $request)
    {
        $orderData = $request->input('order');

        try {
            $this->saveOrder($orderData);
            Cache::forget('modules'); // ক্যাশ ক্লিয়ার
            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    // রিকার্সিভভাবে অর্ডার সেভ করার জন্য হেল্পার ফাংশন
    protected function saveOrder(array $items, $parentId = null)
    {
        foreach ($items as $index => $item) {
            DB::table('modules')->where('id', $item['id'])->update([
                'order' => $index,
                'parent_id' => $parentId,
            ]);

            if (!empty($item['children'])) {
                $this->saveOrder($item['children'], $item['id']);
            }
        }
    }

    // মডিউল আপডেট
    public function update(Request $request, $id)
    {
        $request->validate([
            'name'      => 'required|unique:modules,name,' . $id,
            'slug'      => 'required',
            'type'      => 'required|in:module,permission',
            'order'     => 'nullable|integer',
            'parent_id' => 'nullable|exists:modules,id',
        ]);

        DB::table('modules')->where('id', $id)->update([
            'name'      => $request->name,
            'slug'      => $request->slug,
            'type'      => $request->type,
            'order'     => $request->order ?? 0,
            'parent_id' => $request->parent_id,
            'updated_at'=> now(),
        ]);

        Cache::forget('modules'); // ক্যাশ ক্লিয়ার
        session()->forget('modules');

        return redirect()->route('modules.index')->with('success', 'Module updated successfully.');
    }

    // মডিউল মুছে ফেলা
    public function destroy($id)
    {
        DB::table('modules')->where('id', $id)->delete();

        Cache::forget('modules'); // ক্যাশ ক্লিয়ার
        session()->forget('modules');

        return redirect()->route('modules.index')->with('success', 'Module deleted successfully.');
    }
}
