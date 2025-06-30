document.addEventListener("DOMContentLoaded", function () {
    loadEmployees();
});

function loadEmployees() {
    fetch('/api/employee')
        .then(res => res.json())
        .then(data => {
            const tbody = document.querySelector('#empTable tbody');
            tbody.innerHTML = '';

            data.forEach(emp => {
                const row = document.createElement('tr');

                row.innerHTML = `
                    <td>${emp.Firstname}</td>
                    <td>${emp.Middlename}</td>
                    <td>${emp.Lastname}</td>
                    <td>${emp.Position}</td>
                    <td>${emp.Gender}</td>
                    <td>${emp.Birthdate}</td>
                    <td>
                        <button type="button" class="btn btn-sm btn-info me-1" onclick="viewEmployee(${emp.id})">View</button>
                        <button type="button" class="btn btn-sm btn-warning me-1" onclick="editEmployee(${emp.id})">Edit</button>
                        <button type="button" class="btn btn-sm btn-danger" onclick="deleteEmployee(${emp.id})">Delete</button>
                    </td>
                `;

                tbody.appendChild(row);
            });
        })
        .catch(error => {
            console.error('Error loading employees:', error);
        });
}

function viewEmployee(id) {
    fetch(`/api/employee/${id}`)
        .then(res => res.json())
        .then(emp => {
            document.getElementById('empFirstname').textContent = emp.Firstname;
            document.getElementById('empMiddlename').textContent = emp.Middlename;
            document.getElementById('empLastname').textContent = emp.Lastname;
            document.getElementById('empBirthdate').textContent = emp.Birthdate;
            document.getElementById('empGender').textContent = emp.Gender;
            document.getElementById('empCivilStatus').textContent = emp.CivilStatus;
            document.getElementById('empNationality').textContent = emp.Nationality;
            document.getElementById('empPosition').textContent = emp.Position;
            document.getElementById('empDateEmployed').textContent = emp.DateEmployed;

            const modal = new bootstrap.Modal(document.getElementById('employeeModal'));
            modal.show();
        })
        .catch(err => console.error('Error fetching employee:', err));
}

function deleteEmployee(id) {
    if (!confirm("Are you sure you want to delete this employee?")) return;

    fetch(`/api/employee/${id}`, {
        method: 'DELETE'
    })
        .then(res => {
            if (res.ok) {
                alert("Employee deleted.");
                loadEmployees();
            } else {
                alert("Failed to delete employee.");
            }
        })
        .catch(err => console.error('Error deleting employee:', err));
}

function submitNewEmployee() {
    const form = document.getElementById('addEmpForm');
    const inputs = form.querySelectorAll("input, select");
    const employee = {};

    inputs.forEach(input => {
        employee[input.name] = input.value;
    });

    fetch('/api/employee', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(employee)
    })
        .then(res => {
            if (res.ok) return res.text();
            throw new Error("Failed to add employee.");
        })
        .then(() => {
            alert("Employee added successfully.");

            inputs.forEach(i => i.value = "");

            const modal = bootstrap.Modal.getInstance(document.getElementById('addEmployeeModal'));
            modal.hide();

            loadEmployees();
        })
        .catch(err => {
            console.error("Add Employee Error:", err);
            alert("Error adding employee.");
        });
}

function editEmployee(id) {
    console.log("Editing employee with ID:", id);

    fetch(`/api/employee/${id}`)
        .then(res => res.json())
        .then(emp => {
            const form = document.getElementById('editEmpForm');

            form.querySelector('[name="id"]').value = emp.id;
            form.querySelector('[name="Firstname"]').value = emp.Firstname;
            form.querySelector('[name="Middlename"]').value = emp.Middlename;
            form.querySelector('[name="Lastname"]').value = emp.Lastname;
            form.querySelector('[name="Birthdate"]').value = emp.Birthdate?.split('T')[0] || ''; // format yyyy-mm-dd
            form.querySelector('[name="Gender"]').value = emp.Gender;
            form.querySelector('[name="CivilStatus"]').value = emp.CivilStatus;
            form.querySelector('[name="Nationality"]').value = emp.Nationality;
            form.querySelector('[name="Position"]').value = emp.Position;

            const modal = new bootstrap.Modal(document.getElementById('editEmployeeModal'));
            modal.show();
        })
        .catch(err => {
            console.error("Error fetching employee for edit:", err);
            alert("Failed to fetch employee.");
        });
}


function submitEditEmployee() {
    const form = document.getElementById('editEmpForm');
    const inputs = form.querySelectorAll('[name]');
    const employee = {};
    let id;

    inputs.forEach(input => {
        if (input.name === "id") {
            id = input.value;
        } else {
            employee[input.name] = input.value;
        }
    });

    fetch(`/api/employee/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(employee)
    })
        .then(res => {
            if (!res.ok) throw new Error("Failed to update employee.");
            return res.text();
        })
        .then(msg => {
            alert("Employee updated.");
            const modal = bootstrap.Modal.getInstance(document.getElementById('editEmployeeModal'));
            modal.hide();
            loadEmployees();
        })
        .catch(err => {
            console.error("Edit Employee Error:", err);
            alert("Error updating employee.");
        });
}


