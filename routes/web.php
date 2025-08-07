<?php

// use Illuminate\Support\Facades\Route;

// Route::get('/', function () {
//     return view('welcome');
// });


// use Illuminate\Support\Facades\Route;
// use App\Http\Controllers\AuthController;
// use App\Http\Controllers\DashboardController;
// use App\Http\Controllers\ProfileController;

// Route::get('/', function () {
//     return redirect('/login');
// });

// Route::get('/login', [AuthController::class, 'showLogin'])->name('login.show');
// Route::post('/login', [AuthController::class, 'login'])->name('login');

// Route::get('/register', [AuthController::class, 'showRegister'])->name('register.show');
// Route::post('/register', [AuthController::class, 'register'])->name('register');

// Route::middleware(['authcheck'])->group(function () {
//     Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
//     Route::get('/profile', [ProfileController::class, 'index'])->name('profile');
//     Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
// });

// use Illuminate\Support\Facades\Route;
// use App\Http\Controllers\AuthController;
// use App\Http\Controllers\DashboardController;
// use App\Http\Controllers\ProfileController;
// use App\Http\Controllers\RoleController;
// use App\Http\Controllers\ModuleController;
// use App\Http\Controllers\RouteListController;
// use App\Http\Controllers\PermissionAssignController;

// Route::get('/', function () {
//     return redirect('/login');
// });

// Route::middleware(['guestonly'])->group(function () {
//     Route::get('/login', [AuthController::class, 'showLogin'])->name('login.show');
//     Route::post('/login', [AuthController::class, 'login'])->name('login');

//     Route::get('/register', [AuthController::class, 'showRegister'])->name('register.show');
//     Route::post('/register', [AuthController::class, 'register'])->name('register');
// });

// Route::middleware(['authcheck'])->group(function () {
//     Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
//     Route::get('/profile', [ProfileController::class, 'index'])->name('profile');
//     Route::get('/roles', [RoleController::class, 'index'])->name('roles.index');
//     Route::get('/roles/create', [RoleController::class, 'create'])->name('roles.create');
//     Route::post('/roles', [RoleController::class, 'store'])->name('roles.store');
//     Route::get('/roles/{id}/edit', [RoleController::class, 'edit'])->name('roles.edit');
//     Route::put('/roles/{id}', [RoleController::class, 'update'])->name('roles.update');
//     Route::delete('/roles/{id}', [RoleController::class, 'destroy'])->name('roles.destroy');
//     // Normal

//     // Route::resource('modules', ModuleController::class)->except(['show', 'destroy']);

//     // Single Drag Drop

//     // Route::get('/modules', [ModuleController::class, 'index'])->middleware('authcheck')->name('modules.index');
//     // Route::post('/modules', [ModuleController::class, 'store'])->middleware('authcheck')->name('modules.store');
//     // Route::post('/modules/order-update', [ModuleController::class, 'updateOrder'])->middleware('authcheck')->name('modules.order-update');
//     // Route::get('/modules/{id}/edit', [ModuleController::class, 'edit'])->name('modules.edit');
//     // Route::post('/modules/{id}/update', [ModuleController::class, 'update'])->name('modules.update');

//     Route::get('/modules', [ModuleController::class, 'index'])->name('modules.index');
//     Route::get('/modules/create', [ModuleController::class, 'create'])->name('modules.create');
//     Route::post('/modules', [ModuleController::class, 'store'])->name('modules.store');
//     Route::get('/modules/{id}/edit', [ModuleController::class, 'edit'])->name('modules.edit');
//     Route::put('/modules/{id}', [ModuleController::class, 'update'])->name('modules.update');
//     Route::delete('/modules/{id}', [ModuleController::class, 'destroy'])->name('modules.destroy');
//     Route::post('/modules/order-update', [ModuleController::class, 'updateOrder'])->name('modules.order-update');
//     Route::get('/permission-assign', [PermissionAssignController::class, 'show'])->name('permissions.assign-form');
// Route::post('/permission-assign', [PermissionAssignController::class, 'store'])->name('permissions.assign');



//     Route::get('/route-list', [RouteListController::class, 'index'])->middleware('authcheck')->name('routes.index');
//     Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
// });

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\ModuleController;
use App\Http\Controllers\RouteListController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\PermissionAssignController;
use App\Http\Controllers\UnitController;

/*
|--------------------------------------------------------------------------
| Public Routes (Guest only)
|--------------------------------------------------------------------------
*/

Route::get('/', function () {
    return redirect('/login');
});

Route::middleware(['guestonly'])->group(function () {
    Route::get('/login', [AuthController::class, 'showLogin'])->name('login.show');
    Route::post('/login', [AuthController::class, 'login'])->name('login');

    Route::get('/register', [AuthController::class, 'showRegister'])->name('register.show');
    Route::post('/register', [AuthController::class, 'register'])->name('register');
});

/*
|--------------------------------------------------------------------------
| Protected Routes (After Login - authcheck middleware)
|--------------------------------------------------------------------------
*/
Route::middleware(['authcheck'])->group(function () {

    // Dashboard & Profile
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile');
    Route::get('/user-list', [AuthController::class, 'user_list'])->name('user_list');

    // Role CRUD
    Route::get('/roles', [RoleController::class, 'index'])->name('roles.index');
    Route::get('/roles/create', [RoleController::class, 'create'])->name('roles.create');
    Route::post('/roles', [RoleController::class, 'store'])->name('roles.store');
    Route::get('/roles/{id}/edit', [RoleController::class, 'edit'])->name('roles.edit');
    Route::put('/roles/{id}', [RoleController::class, 'update'])->name('roles.update');
    Route::delete('/roles/{id}', [RoleController::class, 'destroy'])->name('roles.destroy');

    // Module CRUD + Drag & Drop Order
    Route::get('/modules', [ModuleController::class, 'index'])->name('modules.index');
    Route::get('/modules/create', [ModuleController::class, 'create'])->name('modules.create');
    Route::post('/modules', [ModuleController::class, 'store'])->name('modules.store');
    Route::get('/modules/{id}/edit', [ModuleController::class, 'edit'])->name('modules.edit');
    Route::put('/modules/{id}', [ModuleController::class, 'update'])->name('modules.update');
    Route::delete('/modules/{id}', [ModuleController::class, 'destroy'])->name('modules.destroy');
    Route::post('/modules/order-update', [ModuleController::class, 'updateOrder'])->name('modules.order-update');
    Route::get('/modules/list', [ModuleController::class, 'list'])->name('modules.list');

    Route::get('/permissions', [PermissionController::class, 'index'])->name('permissions.index');
    Route::get('/permissions/create', [PermissionController::class, 'create'])->name('permissions.create');
    Route::post('/permissions', [PermissionController::class, 'store'])->name('permissions.store');
    Route::get('/permissions/{id}/edit', [PermissionController::class, 'edit'])->name('permissions.edit');
    Route::put('/permissions/{id}', [PermissionController::class, 'update'])->name('permissions.update');
    Route::delete('/permissions/{id}', [PermissionController::class, 'destroy'])->name('permissions.destroy');

    // Permission Assignment (Form + Store)
    Route::get('/permission-assign', [PermissionAssignController::class, 'index'])->name('permissions.assign-form');
    Route::get('/get-user-permissions', [PermissionAssignController::class, 'getUserPermissions'])->name('permissions.get');
    Route::post('/update-permission', [PermissionAssignController::class, 'updatePermission'])->name('permissions.update');



    // Route List Page
    Route::get('/route-list', [RouteListController::class, 'index'])->name('routes.index');

    // Unit CRUD
    
        Route::get('/unit', [UnitController::class, 'index'])->name('unit.index');
        Route::get('/unit/create', [UnitController::class, 'create'])->name('unit.create');
        Route::post('/unit/store', [UnitController::class, 'store'])->name('unit.store');
        Route::get('/unit/{id}/edit', [UnitController::class, 'edit'])->name('unit.edit');
        Route::post('/unit/{id}/update', [UnitController::class, 'update'])->name('unit.update');
        Route::delete('/unit/{id}', [UnitController::class, 'destroy'])->name('unit.destroy');
   

    //->middleware('checkpermission:roles.create')
    // Logout
    Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
});
