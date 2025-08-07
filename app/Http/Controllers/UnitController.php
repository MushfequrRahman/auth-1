<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class UnitController extends Controller
{
    // সব ইউনিট দেখানো
    public function index()
    {
        $unit = DB::table('unit')->get();
        return view('unit.index', compact('unit'));
    }

    // ইউনিট তৈরির ফর্ম দেখানো
    public function create()
    {
        return view('unit.create');
    }

    // নতুন ইউনিট সংরক্ষণ করা
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:unit,name',
            'address' => 'nullable|string',
        ]);

        DB::table('unit')->insert([
            'id' => $request->id, // অথবা custom id দিতে পারেন
            'name' => $request->name,
            'address' => $request->address,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return redirect()->route('unit.index')->with('success', 'Unit created successfully.');
    }

    // ইউনিট সম্পাদনার ফর্ম দেখানো
    public function edit($id)
    {
        $unit = DB::table('unit')->where('id', $id)->first();
        if (!$unit) {
            return redirect()->route('unit.index')->with('error', 'Unit not found.');
        }

        return view('unit.edit', compact('unit'));
    }

    // ইউনিট আপডেট করা
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|unique:unit,name,' . $id . ',id',
            'address' => 'nullable|string',
        ]);

        DB::table('unit')->where('id', $id)->update([
            'name' => $request->name,
            'address' => $request->address,
            'updated_at' => now(),
        ]);

        return redirect()->route('unit.index')->with('success', 'Unit updated successfully.');
    }

    // ইউনিট মুছে ফেলা
    public function destroy($id)
    {
        DB::table('unit')->where('id', $id)->delete();
        return redirect()->route('unit.index')->with('success', 'Unit deleted successfully.');
    }
}
