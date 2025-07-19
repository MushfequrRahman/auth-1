@if(Session::has('user'))
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="{{ route('dashboard') }}">MyApp</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('profile') }}">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('roles.index') }}">Role</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('modules.index') }}">Module</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('routes.index') }}">Route</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('permissions.index') }}">Permission</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('permissions.assign-form') }}">Permission Assign</a></li>
                <li class="nav-item">
                    <form action="{{ route('logout') }}" method="POST" class="d-inline">
                        @csrf
                        <button class="btn btn-link nav-link" type="submit">Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
@endif
