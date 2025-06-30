<!-- HomePage.aspx -->
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="DimaalaEmployeeExam.Content.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="container mt-5">
    <form id="form1" runat="server">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h1>Employee List</h1>
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addEmployeeModal">Add New Employee</button>
        </div>

        <table class="table table-bordered table-striped" id="empTable">
            <thead class="table-dark">
                <tr>
                    <th>Firstname</th>
                    <th>Middlename</th>
                    <th>Lastname</th>
                    <th>Position</th>
                    <th>Gender</th>
                    <th>Birthdate</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>

        <!-- View Employee Modal (Read Only) -->
        <div class="modal fade" id="employeeModal" tabindex="-1" aria-labelledby="employeeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="employeeModalLabel">Employee Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <dl class="row">
                            <dt class="col-sm-3">Firstname</dt>
                            <dd class="col-sm-9" id="empFirstname"></dd>
                            <dt class="col-sm-3">Middlename</dt>
                            <dd class="col-sm-9" id="empMiddlename"></dd>
                            <dt class="col-sm-3">Lastname</dt>
                            <dd class="col-sm-9" id="empLastname"></dd>
                            <dt class="col-sm-3">Birthdate</dt>
                            <dd class="col-sm-9" id="empBirthdate"></dd>
                            <dt class="col-sm-3">Gender</dt>
                            <dd class="col-sm-9" id="empGender"></dd>
                            <dt class="col-sm-3">Civil Status</dt>
                            <dd class="col-sm-9" id="empCivilStatus"></dd>
                            <dt class="col-sm-3">Nationality</dt>
                            <dd class="col-sm-9" id="empNationality"></dd>
                            <dt class="col-sm-3">Position</dt>
                            <dd class="col-sm-9" id="empPosition"></dd>
                            <dt class="col-sm-3">Date Employed</dt>
                            <dd class="col-sm-9" id="empDateEmployed"></dd>
                        </dl>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Employee Modal -->
        <div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addEmployeeModalLabel">Add New Employee</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body row g-3" id="addEmpForm">
                        <div class="col-md-6">
                            <label>Firstname</label>
                            <input type="text" class="form-control" name="Firstname" required />
                        </div>
                        <div class="col-md-6">
                            <label>Middlename</label>
                            <input type="text" class="form-control" name="Middlename" />
                        </div>
                        <div class="col-md-6">
                            <label>Lastname</label>
                            <input type="text" class="form-control" name="Lastname" required />
                        </div>
                        <div class="col-md-6">
                            <label>Birthdate</label>
                            <input type="date" class="form-control" name="Birthdate" required />
                        </div>
                        <div class="col-md-6">
                            <label>Gender</label>
                            <select class="form-control" name="Gender" required>
                                <option value="">Select...</option>
                                <option>Male</option>
                                <option>Female</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Civil Status</label>
                            <input type="text" class="form-control" name="CivilStatus" />
                        </div>
                        <div class="col-md-6">
                            <label>Nationality</label>
                            <input type="text" class="form-control" name="Nationality" />
                        </div>
                        <div class="col-md-6">
                            <label>Position</label>
                            <input type="text" class="form-control" name="Position" required />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" onclick="submitNewEmployee()">Save</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Employee Modal -->
        <div class="modal fade" id="editEmployeeModal" tabindex="-1" aria-labelledby="editEmployeeModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="editEmployeeModalLabel">Edit Employee</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
      
              <div class="modal-body row g-3" id="editEmpForm">
                <input type="hidden" name="id" />
        
                <div class="col-md-6">
                  <label>Firstname</label>
                  <input type="text" class="form-control" name="Firstname" required />
                </div>
                <div class="col-md-6">
                  <label>Middlename</label>
                  <input type="text" class="form-control" name="Middlename" />
                </div>
                <div class="col-md-6">
                  <label>Lastname</label>
                  <input type="text" class="form-control" name="Lastname" required />
                </div>
                <div class="col-md-6">
                  <label>Birthdate</label>
                  <input type="date" class="form-control" name="Birthdate" required />
                </div>
                <div class="col-md-6">
                  <label>Gender</label>
                  <select class="form-control" name="Gender" required>
                    <option value="">Select...</option>
                    <option>Male</option>
                    <option>Female</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <label>Civil Status</label>
                  <input type="text" class="form-control" name="CivilStatus" />
                </div>
                <div class="col-md-6">
                  <label>Nationality</label>
                  <input type="text" class="form-control" name="Nationality" />
                </div>
                <div class="col-md-6">
                  <label>Position</label>
                  <input type="text" class="form-control" name="Position" required />
                </div>
              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="submitEditEmployee()">Save Changes</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
              </div>
            </div>
          </div>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/Scripts/employee.js"></script>
    </form>
</body>
</html>
