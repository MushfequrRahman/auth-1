<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class PermissionSeeder extends Seeder
{
    public function run(): void
    {
        $modules = DB::table('modules')->get();

        foreach ($modules as $module) {
            $actions = ['read', 'create', 'update', 'delete'];

            foreach ($actions as $action) {
                DB::table('permissions')->insert([
                    'module_id' => $module->id,
                    'name' => $action,
                    'slug' => Str::slug($module->name . '.' . $action),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}

