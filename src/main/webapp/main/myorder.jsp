<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<title>Đơn hàng của tôi</title>
<%@include file="/common/head.jsp"%>
</head>
<body>
	<%@include file="/common/header.jsp"%>
	<!-- Heading -->
	<div class="bg-primary">
		<div class="container py-4">
			<!-- Breadcrumb -->
			<nav class="d-flex">
				<h6 class="mb-0">
					<a href="" class="text-white-50">Trang chủ</a> <span
						class="text-white-50 mx-2"> > </span> <a href=""
						class="text-white-50">Hồ sơ</a> <span class="text-white-50 mx-2">
						> </span> <a href="" class="text-white"><u>Đơn Hàng</u></a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Heading -->
	<!-- content -->
	<section class="py-5 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-xl-3">
					<nav class="nav flex-lg-column w-100 d-flex nav-pills mb-4">
						<a class="nav-link my-0 bg-light" href="my-account?acc=user"><p
								class="pb-0 mb-0" style="width: 100px">TRANG CÁ NHÂN</p></a> <a
							class="nav-link my-0 active" href="my-order"><p
								class="pb-0 mb-0" style="width: 100px">Đơn hàng</p></a><a
							class="nav-link my-0 bg-light" href="ChangePassword?role=user"><p
								class="pb-0 mb-0" style="width: 100px">Đổi Mật khẩu</p></a> <a
							class="nav-link my-0 bg-light" href="logout"><p
								class="pb-0 mb-0" style="width: 100px">Đăng xuất</p></a>
					</nav>
				</div>
				<main class="col-lg-9 col-xl-9">
					<div class="card p-4 mb-0 shadow-0 border">
						<!-- Order loading -->
						<h5 id="order" class="mb-3">Đơn hàng của ${userName}</h5>
						<c:forEach items="${listOrders}" var="order">
							<div class="card border border-primary shadow-0">
								<div class="card-body pb-0">
									<header class="d-lg-flex">
										<div class="flex-grow-1">
											<h6 class="mb-0">
												Mã số đơn hàng: ${order.id} <a href="#openModal"
													onclick="viewOrderDetail('${order.id}')"
													class="btn btn-light text-primary" data-toggle="modal"><span><i
														class="fa-solid fa-eye"></i></span></a>
											</h6>

											<span class="text-muted">Ngày đặt hàng:
												${order.order_date}</span>
										</div>
										<div>
											<a href="#" class="btn btn-sm btn-outline-danger disabled">
												<c:out
													value="${order.status == 0?'Chờ xác nhận':'Đã xác nhận'}" />
											</a>
										</div>
									</header>
									<hr />
									<div class="row">
										<div class="col-lg-4">
											<p class="mb-0 text-muted">Liên hệ</p>
											<p class="m-0">
												${order.fullname} <br /> Phone: ${order.phone_number} <br />
												Email: ${order.email}
											</p>
										</div>
										<div class="col-lg-4 border-start">
											<p class="mb-0 text-muted">Địa chỉ giao hàng</p>
											<p class="m-0">${order.address}</p>
										</div>
										<div class="col-lg-4 border-start">
											<p class="mb-0 text-muted">Phương thức thanh toán</p>
											<p class="m-0">
												<span class="text-success"> VN PAY </span> <br /> Phí giao
												hàng: 0₫ <br />
											<div class="card-title currency-style">
												Tổng thanh toán:
												<fmt:formatNumber value="${order.total_money}"
													type="currency" pattern="#,##0₫" />

											</div>
											</p>
										</div>
									</div>
								</div>
							</div>
							</br>
						</c:forEach>
						<!-- Order loading -->
					</div>
				</main>

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
											Cảm ơn <span class="fw-bold">${userName}</span> đã tin tưởng chúng tôi
											!
										</h4>
									</div>
									<div class="col-auto text-center  my-auto pl-0 pt-sm-4">
										<img class="img-fluid my-auto align-items-center mb-0 pt-3"
											src="<%=request.getContextPath()%>/assets/img/logo.png"  width="115"
											height="115">
										<p class="mb-4 pt-0 Glasses text-primary">Trang Sức Cho Mọi Nhà</p>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="row justify-content-between mb-3">
									<div class="col-auto">
										<h6 class="color-1 mb-0 change-color">Đơn hàng của bạn gồm có</h6>
									</div>
								</div>
								<div id="append-code">
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="/common/footer.jsp"%>
	<%@include file="/common/script.jsp"%>

</body>
</html>