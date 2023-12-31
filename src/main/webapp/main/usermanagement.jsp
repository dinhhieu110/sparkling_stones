<%@page import="dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Quản Lí Người Dùng</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="/common/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	color: #566787;
	background: #f5f5f5;
	font-size: 16px;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #3B71CA;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn-group {
	float: right;
}

.table-title .btn {
	color: #black;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
/* Custom checkbox */
.custom-checkbox {
	position: relative;
}

.custom-checkbox input[type="checkbox"] {
	opacity: 0;
	position: absolute;
	margin: 5px 0 0 3px;
	z-index: 9;
}

.custom-checkbox label:before {
	width: 18px;
	height: 18px;
}

.custom-checkbox label:before {
	content: '';
	margin-right: 10px;
	display: inline-block;
	vertical-align: text-top;
	background: white;
	border: 1px solid #bbb;
	border-radius: 2px;
	box-sizing: border-box;
	z-index: 2;
}

.custom-checkbox input[type="checkbox"]:checked+label:after {
	content: '';
	position: absolute;
	left: 6px;
	top: 3px;
	width: 6px;
	height: 11px;
	border: solid #000;
	border-width: 0 3px 3px 0;
	transform: inherit;
	z-index: 3;
	transform: rotateZ(45deg);
}

.custom-checkbox input[type="checkbox"]:checked+label:before {
	border-color: #03A9F4;
	background: #03A9F4;
}

.custom-checkbox input[type="checkbox"]:checked+label:after {
	border-color: #fff;
}

.custom-checkbox input[type="checkbox"]:disabled+label:before {
	color: #b8b8b8;
	cursor: auto;
	box-shadow: none;
	background: #ddd;
}
/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
	font-size: 14px;
}

.modal .modal-footer {
	background: #3B71CA;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
}
</style>
</head>
<body>
	<%@include file="/common/adminheader.jsp"%>
	<input type="hidden" id="status"
		value="<%=request.getParameter("status")%>">

	<main style="margin-top: 58px">
		<div class="container pt-4">
			<section class="mb-4">
				<div class="table-responsive">
					<div class="table-wrapper">
						<div class="table-title">
							<div class="row">
								<div class="col-sm-6">
									<h2>
										QUẢN LÍ <b>NGƯỜI DÙNG</b>
									</h2>
								</div>
								<div class="col-sm-6">
									<a href="#openModal" onClick ="addUser()" class="btn btn-light text-dark"
										data-toggle="modal"><i class="material-icons">&#xE147;</i>
										<span>THÊM NGƯỜI DÙNG MỚI</span></a>
								</div>
							</div>
						</div>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Email</th>
									<th>Họ và tên</th>
									<th>Địa chỉ</th>
									<th>Số điện thoại</th>
									<th>Vai trò</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listU}" var="u">
									<tr>
										<td>${u.email}</td>
										<td>${u.lastName} ${u.firstName}</td>
										<td>${u.address}</td>
										<td>${u.phone}</td>
										<td>${u.role}</td>
										<td><a href="#openModal" class="edit"
											onclick="updateUser('${u.id}')"
											data-toggle="modal"><i class="material-icons"
												data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
											href="#deleteEmployeeModal"
											class="delete" 
											onclick="deleteUser('${u.id}')"
											data-toggle="modal"><i
												class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%
						UserDAO uDao = new UserDAO();
						int countU = uDao.getTotalUser();
						%>
						<div class="clearfix">
							<div class="hint-text">
								Hiển thị <b>${listU.size()}</b> trong số <b><%=countU%></b>
								nguời dùng
							</div>
							<ul class="pagination">
								<li class="page-item ${tag == endP ?"disabled":" "}""><a
									class="page-link" href="manage-user?index=${(tag-1)}"
									aria-label="Next"> <span aria-hidden="true">&laquo;</span></a></li>
								<c:forEach begin="1" end="${endP}" var="i">
									<li class="page-item ${tag == i ?"active":" "}"><a
										class="page-link" href="manage-user?index=${i}">${i}</a></li>
								</c:forEach>
								<li class="page-item ${tag == endP ?"disabled":" "}""><a
									class="page-link" href="manage-user?index=${(tag+1)}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Add & Edit Modal HTML -->
				<div id="openModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="manage-user" method="post">
								<div class="modal-header">
									<h4 id ="title" class="modal-title">Thêm Người Dùng Mới</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div class="form-floating mb-3">
										<input type="email" class="form-control" id="email"
											placeholder="name@example.com" name="email"> <label
											for="email">Email</label>
									</div>
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="firstName"
											placeholder="lName" name="lastName"> <label
											for="firstName">Họ</label>
									</div>
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="lastName"
											placeholder="name@example.com" name="firstName"> <label
											for="lastName">Tên</label>
									</div>
									<div class="form-floating">
										<input type="password" class="form-control"
											id="pass" placeholder="Password" name="pass">
										<label for="pass">Mật Khẩu</label>
									</div>
									</br>
									<div class="form-floating">
										<textarea name="address" class="form-control" placeholder=" "
											id="address"></textarea>
										<label for="address">Địa chỉ</label>
									</div>
									</br>
									<div class="form-floating">
										<input class="form-control" type="tel" id="phone" name="phone"
											placeholder="123-45-678" required> <label>Số
											điện thoại</label>
									</div>
									</br>
									<div class="form-group container">
										<div class="row">
											<div class="col">
												<input checked type="radio" id="user" name="role"
													value="6d48747d-8781-460e-9b2e-b9dc8c44a6f4" required>
												<label for="user">User</label>
											</div>
											<div class="col">
												<input type="radio" id="admin" name="role"
													value="5268b7a1-a1ff-42c1-884e-2be5df62297c" required>
												<label for="admin">Admin</label>
											</div>
										</div>
									</div>
								</div>
								<input type="hidden" name="myUpdateHidden" id="updateHidden" value =" " />
								<div class="modal-footer">
									<input type="button" class="btn btn-light" data-dismiss="modal"
										value="Hủy">
									<button id ="fbtn" type="submit" class="btn btn-light" name="action"
										value="add">Thêm</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Delete Modal HTML -->
				<div id="deleteEmployeeModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="manage-user" method="post">
								<div class="modal-header">
									<h4 class="modal-title">Xóa Người Dùng</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<p>Bạn có chắc là muốn xóa người dùng này?</p>
									<p class="text-warning">
										<small>Hành động này không thể được hoàn tác.</small>
									</p>
								</div>
								<input type="hidden" name="myDeleteHidden" id="deleteHidden" value =" " />
								<div class="modal-footer">
									<input type="button" class="btn btn-light" data-dismiss="modal"
										value="Hủy">
									<button type="submit" class="btn btn-danger" name="action"
										value="delete">Xóa</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="alert/dist/sweetalert.css">
		<script type="text/javascript">
			var status = document.getElementById("status").value;
			if (status == "SuccessfullyAdded") {
				swal("Chúc mừng!", "Thêm tài khoản thành công", "success");
				status = "";

			}
			if (status == "UnsuccessfullyAdded") {
				swal("Xin lỗi!", "Thêm tài khoản thất bại", "error");
				status = "";

			}
			if(status == "SuccessfullyRemoved"){
				swal("Chúc mừng", "Xóa tài khoản thành công", "success");
				status = "";
			}
			if(status == "SuccessfullyUpdated"){
				swal("Chúc mừng", "Cập nhật tài khoản thành công", "success");
				status = "";
			}
		</script>
		<%@include file="/common/script.jsp"%>
</body>
</html>