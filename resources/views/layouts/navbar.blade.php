@if(Session::has('user'))
<nav class="main-header navbar navbar-expand navbar-dark bg-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item">
            <a href="{{ route('dashboard') }}" class="nav-link">MyApp</a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a href="{{ route('dashboard') }}" class="nav-link">Dashboard</a>
        </li>
        <li class="nav-item">
            <a href="{{ route('profile') }}" class="nav-link">Profile</a>
        </li>
        <li class="nav-item">
            <a href="{{ route('roles.index') }}" class="nav-link">Role</a>
        </li>
        <li class="nav-item">
            <a href="{{ route('modules.index') }}" class="nav-link">Module</a>
        </li>
        <li class="nav-item">
            <a href="{{ route('routes.index') }}" class="nav-link">Route</a>
        </li>
        <!-- <li class="nav-item">
            <a href="{{ route('permissions.index') }}" class="nav-link">Permission</a>
        </li> -->
        <!-- <li class="nav-item">
            <a href="{{ route('permissions.assign-form') }}" class="nav-link">Permission Assign</a>
        </li> -->
        <li class="nav-item">
            <form action="{{ route('logout') }}" method="POST" class="d-inline">
                @csrf
                <button class="btn btn-link nav-link" type="submit">Logout</button>
            </form>
        </li>
    </ul>
</nav>
@endif
