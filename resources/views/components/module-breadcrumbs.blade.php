@php
    $routeName = request()->route()->getName();
    $modules = session('modules');
    $breadcrumbs = findModuleChainByRoute($modules, $routeName);
@endphp

@if($breadcrumbs->count())
    <ol class="breadcrumb float-sm-right">
        <li class="breadcrumb-item">
            <a href="{{ route('dashboard') }}"><i class="fas fa-home"></i> Dashboard</a>
        </li>
        @foreach($breadcrumbs as $mod)
            @if($loop->last)
                <li class="breadcrumb-item active">{{ $mod->name }}</li>
            @else
                @if($mod->route && Route::has($mod->route))
                    <li class="breadcrumb-item">
                        <a href="{{ route($mod->route) }}">{{ $mod->name }}</a>
                    </li>
                @else
                    <li class="breadcrumb-item">{{ $mod->name }}</li>
                @endif
            @endif
        @endforeach
    </ol>
@endif
