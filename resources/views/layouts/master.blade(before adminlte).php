<!-- <!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    @include('layouts.navbar') {{-- এই লাইনটা ইনসার্ট করো --}}

    <div class="container mt-4">
        @yield('content')
    </div>
</body>
</html> -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'My App')</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

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

        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .wrapper {
            flex: 1;
            display: flex;
        }

        .sidebar {
            width: 220px;
            background-color: #f8f9fa;
            border-right: 1px solid #ddd;
            padding: 15px;
        }

        .sidebar .list-group-item {
            border: none;
            padding: 8px 15px;
        }

        .sidebar .list-group-item a {
            color: #333;
            text-decoration: none;
        }

        .content {
            flex: 1;
            padding: 20px;
        }
    </style>
</head>
<body>

    @include('layouts.navbar')

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                @php
                    $modules = DB::table('modules')->get();
                @endphp
                @include('layouts.sidebar', ['modules' => $modules])
            </div>
            <div class="col-md-10 mt-3">
                @yield('content')
            </div>
        </div>
    </div>

    <!-- Bootstrap JS + jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    @yield('scripts')
</body>
</html>
