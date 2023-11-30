<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Quản Lí Đơn Hàng</title>
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

table.table tr th:first-child {
	width: 200px;
}

table.table tr th:last-child {
	width: 200px;
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
	max-width: 600px;
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
	<input type="hidden" id="notify"
		value="<%=request.getParameter("notify")%>">
	<main style="margin-top: 58px">
		${error}
		<div class="container pt-4">
			<section class="mb-4">
				<div class="table-responsive">
					<div class="table-wrapper">
						<div class="table-title">
							<div class="row">
								<div class="text-center">
									<h2>
										<b>QUẢN LÍ ĐƠN HÀNG</b>
									</h2>
								</div>
							</div>
						</div>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Mã đơn hàng</th>
									<th>Khách</th>
									<th>Liên hệ</th>
									<th>Địa chỉ</th>
									<th>Ngày đặt</th>
									<th>Giá</th>
									<th>Xem đơn</th>
									<th class="text-center">Trạng thái</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allOrders}" var="o">
									<tr>
										<td>${o.id}</td>
										<td>${o.fullname}</td>
										<td>${o.phone_number}</td>
										<td>${o.address}</td>
										<td>${o.order_date}</td>
										<td class="card-title currency-style"><fmt:formatNumber
												value="${o.total_money}" type="currency" pattern="#,##0₫" />
										</td>
										<td><a href="#openModal"
											onclick="viewOrderDetail('${o.id}')"
											class="btn btn-light text-primary" data-toggle="modal"><span><i
													class="fa-solid fa-eye"></i></span></a></td>
										<c:choose>
											<c:when test="${o.status == 0}">
												<td>
													<div class="row text-center text-sm">
														<form action="manage-order" method="post"
															class="col-5 m-2">
															<input type="hidden" name="orderId" value="${o.id}" /> <input
																type="hidden" name="status" value="1" />
															<button name="action" value="accept" type="submit"
																class="btn btn-primary text-light">
																<span><i class="fa-solid fa-check"></i></span>
															</button>
														</form>
														<a href="#cancelOrderModal"
															class="cancel col-5 btn btn-danger m-2 text-light"
															data-toggle="modal" onclick="cancelOrder('${o.id}')"
															type="submit"> <span><i class="fa-solid fa-x"></i></span>
														</a>
													</div>
												</td>
											</c:when>
											<c:when test="${o.status == 1}">
												<td>
													<button disabled class="col btn btn-warning m-2">
														<span>Đã duyệt</span>
													</button>
												</td>
											</c:when>

											<c:otherwise>
												<td>
													<button disabled class="col btn btn-info m-2">
														<span>Đã từ chối</span>
													</button>
												</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- Pagination -->
						<%
						String from = (String) request.getAttribute("from");
						%>
						<nav aria-label="Page navigation example"
							class="d-flex justify-content-center mt-3">
							<ul class="pagination">
								<!-- First Button -->
								<li class="page-item ${tag == 1 ? 'disabled' : ''}"><a
									class="page-link"
									<c:if test="${from eq 'ManageOrderController'}">
           href="manage-order?index=1"
       </c:if>
									aria-label="First"> <span aria-hidden="true">First</span>
								</a></li>

								<!-- Backward Button -->
								<li class="page-item ${tag == 1 ? 'disabled' : ''}"><a
									class="page-link"
									<c:if test="${from eq 'ManageOrderController'}">
                   href="manage-order?index=${tag - 1}"
               </c:if>
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>

								<!-- Pagination Items -->
								<c:set var="startPage" value="${tag - 2}" />
								<c:choose>
									<c:when test="${startPage < 1}">
										<c:set var="startPage" value="1" />
									</c:when>
									<c:when test="${startPage > endP - 4}">
										<c:set var="startPage" value="${endP - 4}" />
									</c:when>
								</c:choose>
								<c:forEach begin="${startPage}" end="${startPage + 4}" var="i">
									<li class="page-item ${tag == i ? 'active' : ''}"><a
										class="page-link"
										<c:if test="${from eq 'ManageOrderController'}">
                       href="manage-order?index=${i}"
                   </c:if>>${i}</a>
									</li>
								</c:forEach>

								<!-- Forward Button -->
								<li class="page-item ${tag == endP ? 'disabled' : ''}"><a
									class="page-link"
									<c:if test="${from eq 'ManageOrderController'}">
                   href="manage-order?index=${tag + 1}"
               </c:if>
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>


								<!-- Last Button -->
								<li class="page-item ${tag == endP ? 'disabled' : ''}"><a
									class="page-link"
									<c:if test="${from eq 'ManageOrderController'}">
           href="manage-order?index=${endP}"
       </c:if>
									aria-label="Last"> <span aria-hidden="true">Last</span>
								</a></li>



							</ul>
						</nav>

						<!-- Pagination -->
					</div>
				</div>

				<!-- Cancel Modal HTML -->
				<div id="cancelOrderModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="manage-order" method="post">
								<div class="modal-header">
									<h4 class="modal-title">Từ chối đơn hàng</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<p>Bạn có chắc chắn muốn từ chối đơn hàng này không?</p>
									<p class="text-warning">
										<small>Hành động này không thể quay lại.</small>
									</p>
								</div>
								<input type="hidden" name="status" value="2" /> <input
									type="hidden" name="orderId" id="orderId" value=" " />
								<div class="modal-footer">
									<input type="button" class="btn btn-light" data-dismiss="modal"
										value="Hủy">
									<button type="submit" class="btn btn-danger" name="action"
										value="cancel">Từ chối</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- View OrderDetail Modal HTML -->
				<div id="openModal" class="modal fade">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="container-fluid my-5  d-flex  justify-content-center">
								<div class="card card-1">
									<div class="card-header bg-white">
										<div
											class="media flex-sm-row flex-column-reverse justify-content-between  ">
											<div class="col my-auto">
												<h4 class="mb-0">
													Xin chào <span class="fw-bold">Admin</span> 
													
												</h4>
											</div>
											<div class="col-auto text-center  my-auto pl-0 pt-sm-4">
												<img class="img-fluid my-auto align-items-center mb-0 pt-3"
													src="<%=request.getContextPath()%>/assets/img/logo.png"
													width="115" height="115">
												<p class="mb-4 pt-0 Glasses text-primary">Trang Sức Cho
													Mọi Nhà</p>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div class="row justify-content-between mb-3">
											<div class="col-auto">
												<h6 class="color-1 mb-0 change-color">Đơn hàng này
													gồm có</h6>
											</div>
										</div>
										<div id="append-code"></div>
									</div>
								</div>
							</div>
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
	/* function setProductIdToDelete(id) {
		var deleteForm = document.getElementById('deleteForm');
		deleteForm.action = 'DeleteProductController?pid=' + id;
	} */

	var notify = document.getElementById("notify").value;
	switch (notify) {
	case "CancelSuccessfully":
		swal("Hoàn thành!", "Đã từ chối đơn hàng thành công", "success");
		notify = "";
		break;
	case "AcceptSuccessfully":
		swal("Chúc mừng!", "Phê duyệt đơn hàng thành công", "success");
		notify = "";
		break;
	case "SuccessfullyUpdated":
		swal("Congrats", "Product Updated Successfully", "success");
		notify = "";
		break;
	default:
		break;
	}
</script>
<%@include file="/common/script.jsp"%>

</html>