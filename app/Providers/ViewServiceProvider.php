<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;

class ViewServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        View::composer('layouts.sidebar', function ($view) {
            $user = session('user');

            $modules = DB::table('modules')->get();
            $userModuleIds = [];

            if ($user) {
                $userModuleIds = DB::table('user_module_permission')
                    ->where('user_id', $user->id)
                    ->pluck('module_id')
                    ->toArray();
            }

            $view->with([
                'modules' => $modules,
                'userModuleIds' => $userModuleIds,
                'user' => $user,
            ]);
        });
    }
}
