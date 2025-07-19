@php
    use Illuminate\Support\Facades\DB;

    $user = session('user');
    $currentRoute = request()->route() ? request()->route()->getName() : null;

    // Login, Register বা Guest-only page এ মেনু লুকায়
    $isGuestPage = in_array($currentRoute, [
        'login', 'login.show',
        'register', 'register.show'
    ]);

    $modules = collect();  // default empty
    $permissions = [];

    if ($user && !$isGuestPage) {
        $modules = DB::table('modules')->get();

        $permissions = DB::table('user_module_permission')
            ->join('permissions', 'user_module_permission.permission_id', '=', 'permissions.id')
            ->where('user_module_permission.user_id', $user->id)
            ->pluck('permissions.slug')
            ->toArray();
    }
@endphp

@if($user && !$isGuestPage && count($permissions))
    <div class="p-3">
        <h5 class="mb-3">Menu</h5>
        {!! renderSidebarMenu($modules, null, $permissions) !!}
    </div>
@endif
