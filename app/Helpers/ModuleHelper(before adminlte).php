<?php

use Illuminate\Support\Facades\Route;

function renderModules($modules, $parentId = null)
{
    $html = '<ol class="dd-list">';
    foreach ($modules->where('parent_id', $parentId)->sortBy('order') as $module) {
        $html .= '<li class="dd-item" data-id="' . $module->id . '">';
        $html .= '<div class="dd-handle">';

        if (!empty($module->route) && Route::has($module->route)) {
            $html .= '<a href="' . route($module->route) . '">' . $module->name . '</a>';
        } else {
            $html .= $module->name;
        }

        $html .= '</div>';

        if ($modules->where('parent_id', $module->id)->count()) {
            $html .= renderModules($modules, $module->id);
        }

        $html .= '</li>';
    }
    $html .= '</ol>';
    return $html;
}





