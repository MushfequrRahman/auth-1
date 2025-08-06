@extends('layouts.master')

@section('content')
<div class="container">
    <h3>Assign Permissions to User</h3>

    <form id="permissionForm">
        <input type="hidden" id="user_id" name="user_id" value="{{ $user_id }}">

        @if($user_id)
        <div class="form-group mb-3">
            <label>User ID</label>
            <input type="text" class="form-control" value="{{ $user_id }}" readonly>
        </div>
        @endif

        @if($user_name)
        <div class="form-group mb-3">
            <label>User Name</label>
            <input type="text" class="form-control" value="{{ $user_name }}" readonly>
        </div>
        @endif

        <div id="permission-section" class="mt-4" style="display:none;">
            <table class="table table-bordered">
                <thead class="table-light">
                    <tr>
                        <th style="width: 50%;">Module Name</th>
                        <th style="width: 50%;">Permissions (slug)</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($modules as $module)
                        @if(!isset($permissionsByModule[$module->id]) || count($permissionsByModule[$module->id]) == 0)
                            @continue
                        @endif
                        <tr>
                            <td><strong>{{ $module->name }}</strong></td>
                            <td>
                                @foreach ($permissionsByModule[$module->id] as $permission)
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input permission-checkbox" type="checkbox"
                                        name="module_ids[]" value="{{ $permission->id }}" id="perm_{{ $permission->id }}">
                                    <label class="form-check-label" for="perm_{{ $permission->id }}">
                                        {{ $permission->slug }}
                                    </label>
                                </div>
                                @endforeach
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <button type="submit" class="btn btn-primary mt-3">Save Permissions</button>
    </form>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const userId = document.getElementById('user_id').value;
        const checkboxes = document.querySelectorAll('.permission-checkbox');

        // Reset all checkboxes first
        checkboxes.forEach(cb => cb.checked = false);

        if (userId) {
            document.getElementById('permission-section').style.display = 'block';

            fetch(`/get-user-permissions?user_id=${userId}`)
                .then(res => res.json())
                .then(data => {
                    data.forEach(id => {
                        const checkbox = document.getElementById('perm_' + id);
                        if (checkbox) checkbox.checked = true;
                    });
                });
        } else {
            document.getElementById('permission-section').style.display = 'none';
        }

        document.getElementById('permissionForm').addEventListener('submit', function (e) {
            e.preventDefault();

            if (!userId) {
                alert('User ID খুঁজে পাওয়া যায়নি।');
                return;
            }

            const checkedBoxes = document.querySelectorAll('.permission-checkbox:checked');
            const moduleIds = Array.from(checkedBoxes).map(cb => cb.value);

            fetch('/update-permission', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({
                    user_id: userId,
                    module_ids: moduleIds
                })
            })
            .then(res => res.json())
            .then(data => {
                alert('Permissions updated successfully!');
            });
        });
    });
</script>
@endsection
