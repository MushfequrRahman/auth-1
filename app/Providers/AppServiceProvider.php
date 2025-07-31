<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

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
        // View Composer: সব ভিউতে $modules শেয়ার করা হচ্ছে
        View::composer('*', function ($view) {
            // ক্যাশ থেকে modules আনা হচ্ছে, না থাকলে নতুন করে DB থেকে এনে ক্যাশে রাখা হবে 60 মিনিটের জন্য
            $modules = Cache::remember('modules', 60, function () {
                return DB::table('modules')->orderBy('order')->get();
            });

            // View এ পাঠানো
            $view->with('modules', $modules);
        });

        // সেশনেও একই modules রাখা হচ্ছে
        // if (!session()->has('modules')) {
        //     $modules = Cache::get('modules');
        //     session(['modules' => $modules]);
        // }
    }
}
