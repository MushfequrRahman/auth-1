<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;

class RouteListController extends Controller
{
    public function index()
    {
        $routes = collect(Route::getRoutes())->map(function ($route) {
            $action = $route->getActionName();

            // Controller name extract
            $controller = 'Closure';
            if (Str::contains($action, '@')) {
                $controller = explode('@', class_basename($action))[0]; // e.g. AuthController
            }

            return [
                'method'     => implode('|', $route->methods),
                'uri'        => $route->uri,
                'name'       => $route->getName(),
                'action'     => $action,
                'controller' => $controller,
                'middleware' => implode(', ', $route->gatherMiddleware()),
            ];
        });

        return view('routes.index', compact('routes'));
    }
}
