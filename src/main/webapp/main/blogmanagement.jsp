<%@page import="dao.BlogDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Quản Lí Bài Viết</title>
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
	width: 100px;
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

.swiper-slide {
	height: 50%;
}

.swiper-slide>div {
	padding-bottom: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: 100%;
	background-color: transparent;
	border: 1px solid #ccc;
	border-radius: 8px;
}

.swiper-slide-thumb-active {
	overflow: hidden;
}

.swiper-slide-thumb-active::before {
	content: "";
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: 1;
	background-color: rgba(0, 0, 0, 0.25);
}

.description-wrapper {
	max-height: 2em;
	overflow: hidden;
	position: relative;
}

.read-more-btn {
	background: none;
	border: none;
	color: #4F4F4F; /* Set button color to blue (#007bff) */
	cursor: pointer;
	padding: 0;
	font-size: 14px;
	position: absolute;
	bottom: 0;
	right: 0;
	margin: 0; /* Remove margin */
}

.full-description {
	display: none;
}

.description-wrapper.expanded {
	max-height: none;
}

.description-wrapper.expanded .read-more-btn {
	display: none;
}
</style>
</head>
<body>
	<%@include file="/common/adminheader.jsp"%>
	<input type="hidden" id="status"
		value="<%=request.getParameter("status")%>">

	<main style="margin-top: 58px">
		${error}

		<div class="container pt-4">
			<section class="mb-4">
				<div class="table-responsive">
					<div class="table-wrapper">
						<div class="table-title">
							<div class="row">
								<div class="col-sm-6">
									<h2>
										QUẢN LÍ <b>BÀI VIẾT</b>
									</h2>
								</div>
								<div class="col-sm-6">
									<a href="#openModal" onClick="addBlog()"
										class="btn btn-light text-dark" data-toggle="modal"><i
										class="material-icons">&#xE147;</i> <span>THÊM BÀI VIẾT
											MỚI</span></a>
								</div>
							</div>
						</div>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Ảnh chính</th>
									<th>Tiêu đề</th>
									<th>Tiêu đề 1</th>
									<th>Đoạn 1</th>
									<th>Tiêu đề 2</th>
									<th>Đoạn 2</th>
									<th>Ảnh phụ</th>
									<th>Chú thích</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listB}" var="b">
									<tr>
										<td><img width="50px" height="50px" src="${b.thumbnail}" /></td>
										<td>${b.tittle}</td>
										<td>${b.heading1}</td>
										<td class="description-wrapper"><span
											class="full-description">${b.para1}</span> <span
											class="short-description"></span>
											<button class="read-more-btn">Đọc thêm</button></td>
<%-- 										<td>${b.para1}</td>
 --%>										<td>${b.heading2}</td>
										<td class="description-wrapper"><span
											class="full-description">${b.para2}</span> <span
											class="short-description"></span>
											<button class="read-more-btn">Đọc thêm</button></td>
<%-- 										<td>${b.para2}</td>
 --%>										<td><img width="50px" height="50px"
											src="${b.subthumbnial}" /></td>
										<td>${b.note}</td>


										<td><a href="#openModal" class="edit"
											onclick="updateBlog('${b.id}')" data-toggle="modal"><i
												class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
											<a href="#deleteEmployeeModal" class="delete"
											onclick="deleteBlog('${b.id}')" data-toggle="modal"><i
												class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%
						BlogDAO bDao = new BlogDAO();
						int countB = bDao.getTotalBlog();
						%>
						<div class="clearfix">
							<div class="hint-text">
								Hiển thị <b>${listB.size()}</b> trong số <b><%=countB%></b> bài
								viết
							</div>
							<ul class="pagination">
								<li class="page-item ${tag == endP ?"disabled":" "}""><a
									class="page-link" href="manage-blog?index=${(tag-1)}"
									aria-label="Next"> <span aria-hidden="true">&laquo;</span></a></li>
								<c:forEach begin="1" end="${endP}" var="i">
									<li class="page-item ${tag == i ?"active":" "}"><a
										class="page-link" href="manage-blog?index=${i}">${i}</a></li>
								</c:forEach>
								<li class="page-item ${tag == endP ?"disabled":" "}""><a
									class="page-link" href="manage-blog?index=${(tag+1)}"
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
							<form action="manage-blog" method="post">
								<div class="modal-header">
									<h4 id="title" class="modal-title">Thêm Bài Viết Mới</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div class="form-floating mb-3">
										<input type="file" class="form-control" id="thumbnail"
											placeholder="thumbnail" name="thumbnail" value =" " required><label
											for="thumbnail">Ảnh chính</label>
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="tittle"
											placeholder="tittle" name="tittle" value =" "> <label
											for="tittle">Tiêu đề</label>
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="heading1"
											placeholder="heading1" name="heading1" value =" "> <label
											for="heading1">Tiêu đề 1</label>
									</div>
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="para1"
											placeholder="para1" name="para1" value =" "> <label for="para1">Đoạn
											1</label>
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="heading2"
											placeholder="heading2" name="heading2" value =" "> <label
											for="heading2">Tiêu đề 2</label>
									</div>
									<div class="form-floating mb-3">
										<input type="text" class="form-control" id="para2"
											placeholder="para2" name="para2" value =" "> <label for="para2">Đoạn
											2</label>
									</div>

									<div class="form-floating mb-3">
										<input type="file" class="form-control" id="subthumbnial"
											placeholder="Subthumbnail" name="subthumbnial" value =" " required><label
											for="subthumbnial">Ảnh phụ</label>
									</div>

									<div class="form-floating">
										<textarea name="note" class="form-control" placeholder="note "
											id="note" ></textarea>
										<label for="note">Chú thích</label>
									</div>
								</div>
								<input type="hidden" name="myUpdateHidden" id="updateHidden"
									value=" " />
								<div class="modal-footer">
									<input type="button" class="btn btn-light" data-dismiss="modal"
										value="Hủy">
									<button id="fbtn" type="submit" class="btn btn-light"
										name="action" value="add">Thêm</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Delete Modal HTML -->
				<div id="deleteEmployeeModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="manage-blog" method="post">
								<div class="modal-header">
									<h4 class="modal-title">Xóa Bài Viết</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<p>Bạn có chắc là muốn xóa bài viết này?</p>
									<p class="text-warning">
										<small>Hành động này không thể được hoàn tác.</small>
									</p>
								</div>
								<input type="hidden" name="myDeleteBlogHidden" id="deleteBlogHidden"
									value=" " />
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

	</main>
</body>


<script type="text/javascript">
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						var descriptionWrappers = document
								.querySelectorAll('.description-wrapper');

						descriptionWrappers
								.forEach(function(wrapper) {
									var fullDescription = wrapper
											.querySelector('.full-description').textContent;
									var shortDescription = fullDescription
											.substring(0, 100); // Lấy 100 ký tự đầu tiên

									wrapper.querySelector('.short-description').textContent = shortDescription
											+ '...';

									var readMoreBtn = wrapper
											.querySelector('.read-more-btn');

									readMoreBtn
											.addEventListener(
													'click',
													function(event) {
														event.stopPropagation(); // Prevent click event from propagating to the body
														wrapper.classList
																.add('expanded');
														wrapper
																.querySelector('.short-description').style.display = 'none';
														wrapper
																.querySelector('.full-description').style.display = 'block';
													});
								});

						// Add click event listener to the body to collapse description when clicked outside
						document.body
								.addEventListener(
										'click',
										function(event) {
											descriptionWrappers
													.forEach(function(wrapper) {
														if (!wrapper
																.contains(event.target)) {
															wrapper.classList
																	.remove('expanded');
															wrapper
																	.querySelector('.short-description').style.display = 'block';
															wrapper
																	.querySelector('.full-description').style.display = 'none';
														}
													});
										});
					});
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
			var status = document.getElementById("status").value;
			if (status == "SuccessfullyAdded") {
				swal("Chúc mừng!", "Thêm bài viết thành công", "success");
				status = "";

			}
			if (status == "UnsuccessfullyAdded") {
				swal("Xin lỗi!", "Thêm bài viết thất bại", "error");
				status = "";

			}
			if(status == "SuccessfullyDeleted"){
				swal("Chúc mừng", "Xóa bài viết thành công", "success");
				status = "";
			}
			if(status == "SuccessfullyUpdated"){
				swal("Chúc mừng", "Cập nhật bài viết thành công", "success");
				status = "";
			}
		</script>
<%@include file="/common/script.jsp"%>
</html>