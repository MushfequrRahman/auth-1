@extends('layouts.master')
@section('title', 'Assign Permissions')

@section('content')
<h3>Assign Permissions</h3>

<div class="mb-3">
    <label for="user_id" class="form-label">Select User:</label>
    <select name="user_id" id="user_id" class="form-select" required>
        <option value="">-- Select User --</option>
        @foreach($users as $user)
        <option value="{{ $user->id }}">{{ $user->name }} ({{ $user->email }})</option>
        @endforeach
    </select>
</div>

<div id="permissionTable" class="mt-3">
    <p class="text-muted">Select a user to view permissions.</p>
</div>
@endsection

@section('scripts')
<script>
    const modules = @json($modules);
    const allPermissions = @json($permissions);

    document.getElementById('user_id').addEventListener('change', function () {
        const userId = this.value;
        const permissionTable = document.getElementById('permissionTable');
        if (!userId) {
            permissionTable.innerHTML = '<p class="text-muted">Select a user to view permissions.</p>';
            return;
        }

        fetch(`/get-user-permissions?user_id=${userId}`)
            .then(res => res.json())
            .then(assignedPermissions => {
                let html = `<table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Module</th>
                            <th>Permission</th>
                        </tr>
                    </thead>
                    <tbody>`;

                modules.forEach(module => {
                    const perms = allPermissions.filter(p => p.module_id === module.id);
                    if (perms.length === 0) return;

                    perms.forEach((perm, index) => {
                        html += `<tr>`;
                        if (index === 0) {
                            html += `<td rowspan="${perms.length}">${module.name}</td>`;
                        }
                        const checked = assignedPermissions.includes(perm.id) ? 'checked' : '';
                        html += `<td>
                            <label>
                                <input type="checkbox" class="perm-check"
                                       data-user="${userId}"
                                       data-module="${module.id}"
                                       data-perm="${perm.id}"
                                       ${checked}>
                                ${perm.name}
                            </label>
                        </td></tr>`;
                    });
                });

                html += `</tbody></table>`;
                permissionTable.innerHTML = html;

                document.querySelectorAll('.perm-check').forEach(input => {
                    input.addEventListener('change', function () {
                        const payload = {
                            user_id: this.dataset.user,
                            module_id: this.dataset.module,
                            permission_id: this.dataset.perm,
                            checked: this.checked
                        };

                        fetch('/update-permission', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': `{{ csrf_token() }}`
                            },
                            body: JSON.stringify(payload)
                        });
                    });
                });
            });
    });
</script>
@endsection
