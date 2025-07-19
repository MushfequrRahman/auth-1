<?php

use Illuminate\Support\Facades\Route;

function buildSidebarMenu($modules, $parentId = null)
{
    $html = '<ul class="list-group list-group-flush">';
    foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $module) {
        $hasChildren = $modules->where('parent_id', $module->id)->count();

        $html .= '<li class="list-group-item">';

        if ($hasChildren) {
            $html .= '
                <div class="d-flex justify-content-between align-items-center">
                    <a class="text-decoration-none" data-bs-toggle="collapse" href="#module-' . $module->id . '" role="button" aria-expanded="false" aria-controls="module-' . $module->id . '">
                        ' . $module->name . '
                    </a>
                    <span>▼</span>
                </div>
                <div class="collapse ps-3" id="module-' . $module->id . '">
                    ' . buildSidebarMenu($modules, $module->id) . '
                </div>
            ';
        } else {
            $route = Route::has($module->route) ? route($module->route) : '#';
            $html .= '<a href="' . $route . '" class="text-decoration-none d-block">' . $module->name . '</a>';
        }

        $html .= '</li>';
    }
    $html .= '</ul>';

    return $html;
}



