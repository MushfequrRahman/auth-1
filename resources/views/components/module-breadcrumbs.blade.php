@php
    $modules = session('modules') ?? DB::table('modules')->orderBy('order')->get();
    $routeName = request()->route()->getName();

    $breadcrumbs = collect();

    if (!empty($modules) && $routeName) {
        $modules = collect($modules);

        $currentModule = $modules->firstWhere('route', $routeName) ?? $modules->firstWhere('slug', $routeName);

        if ($currentModule) {
            $chain = [];
            while ($currentModule) {
                array_unshift($chain, $currentModule);
                if (empty($currentModule->parent_id) || $currentModule->parent_id == 0) {
                    break;
                }
                $currentModule = $modules->firstWhere('id', $currentModule->parent_id);
            }
            $breadcrumbs = collect($chain);
        }
    }
@endphp

@if($breadcrumbs->isNotEmpty())
    <ol class="breadcrumb float-sm-right">
        <li class="breadcrumb-item">
            <a href="{{ route('dashboard') }}">
                <i class="fas fa-home"></i> Dashboard
            </a>
        </li>
        @foreach($breadcrumbs as $mod)
            @if($loop->last)
                <li class="breadcrumb-item active" aria-current="page">{{ $mod->name }}</li>
            @else
                @php
                    $url = ($mod->route && $mod->route !== '#' && Route::has($mod->route)) ? route($mod->route) : '#';
                @endphp
                <li class="breadcrumb-item">
                    <a href="{{ $url }}">{{ $mod->name }}</a>
                </li>
            @endif
        @endforeach
    </ol>
@endif
