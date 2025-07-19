<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        View::composer('*', function ($view) {
            $modules = DB::table('modules')->orderBy('order')->get();
            $view->with('modules', $modules);
        });
        $modules = DB::table('modules')->get();
session(['modules' => $modules]);

    }
}
