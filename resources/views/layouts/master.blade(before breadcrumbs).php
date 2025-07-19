<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'My App')</title>

    <!-- FontAwesome & AdminLTE CSS -->
    <link rel="stylesheet" href="{{ asset('adminlte/plugins/fontawesome-free/css/all.min.css') }}">
    <link rel="stylesheet" href="{{ asset('adminlte/dist/css/adminlte.min.css') }}">

    <style>
        .dd-handle {
            background: #f8f9fa;
            padding: 10px;
            border: 1px solid #ccc;
            cursor: move;
            margin-bottom: 5px;
        }
        .dd-item > button {
            margin-left: -10px;
            margin-right: 5px;
        }

        

        
    </style>

    @yield('styles')
</head>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        {{-- Navbar --}}
        @include('layouts.navbar')

        {{-- Main Sidebar --}}
        @include('layouts.sidebar')

        {{-- Content Wrapper --}}
        <div class="content-wrapper">
            <section class="content pt-3">
                <div class="container-fluid">
                    @yield('content')
                </div>
            </section>
        </div>

        {{-- Footer --}}
        <footer class="main-footer text-sm">
            <div class="float-right d-none d-sm-inline">Powered by You</div>
            <strong>&copy; {{ date('Y') }} <a href="#">MyApp</a>.</strong> All rights reserved.
        </footer>

    </div>

    <!-- Required Scripts -->
    <script src="{{ asset('adminlte/plugins/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('adminlte/dist/js/adminlte.min.js') }}"></script>

    @yield('scripts')
</body>

</html>