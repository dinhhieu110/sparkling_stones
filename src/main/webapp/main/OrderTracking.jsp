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
<title>Hóa Đơn Đặt Hàng</title>
<style>

.title {
	color: #3b71ca;
	font-weight: 600;
	margin-bottom: 2vh;
	padding: 0 8%;
	font-size: initial;
}

#details {
	font-weight: 400;
}

.info {
	padding: 5% 8%;
}

.info .col-5 {
	padding: 0;
}

#heading {
	color: grey;
	line-height: 6vh;
}

.pricing {
	background-color: #ddd3;
	padding: 2vh 8%;
	font-weight: 400;
	line-height: 2.5;
}

.pricing .col-3 {
	padding: 0;
}

.total {
	padding: 2vh 8%;
	color: #3b71ca;
	font-weight: bold;
}

.total .col-3 {
	padding: 0;
}

.footer {
	padding: 0 8%;
	font-size: x-small;
	color: black;
}

.footer img {
	height: 5vh;
	opacity: 0.2;
}

.footer a {
	color: rgb(252, 103, 49);
}

.footer .col-10, .col-2 {
	display: flex;
	padding: 3vh 0 0;
	align-items: center;
}

.footer .row {
	margin: 0;
}
</style>
<%@include file="/common/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	<div class="card mx-auto" style="width: 45%; max-width: 600px; padding: 4vh 0; box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19); border-top: 3px solid rgb(252, 103, 49); border-bottom: 3px solid rgb(252, 103, 49); border-left: none; border-right: none; margin-top: 20px;">
		<div class="title fs-1 text-center">HÓA ĐƠN ĐẶT HÀNG</div>
		<div class="info">
			<div class="row">
				<div class="col-5">
					<span id="heading" class="fw-bold">Tên Khách Hàng</span><br> 
				</div>
				<div class="col-7 pull-right">
					<span id="heading">${user.lastName} ${user.firstName}</span><br>
				</div>
			</div>
			<div class="row">
				<div class="col-5">
					<span id="heading" class="fw-bold">Đơn hàng số</span><br> 
				</div>
				<div class="col-7 pull-right">
					<span id="heading">${countOrders}</span><br>
				</div>
			</div>
			<div class="row">
				<div class="col-5">
					<span id="heading" class="fw-bold">Email</span><br> 
				</div>
				<div class="col-7 pull-right">
					<span id="heading">${order.email}</span><br>
				</div>
			</div>
			<div class="row">
				<div class="col-5">
					<span id="heading" class="fw-bold">Số điện thoại</span><br> 
				</div>
				<div class="col-7 pull-right">
					<span id="heading">${order.phone_number}</span><br>
				</div>
			</div>
			<div class="row">
				<div class="col-5">
					<span id="heading" class="fw-bold">Địa chỉ giao hàng</span><br> 
				</div>
				<div class="col-7 pull-right">
					<span id="heading">${order.address}</span><br>
				</div>
			</div>
			<div class="row">
				<div class="col-5">
					<span id="heading" class="fw-bold">Ngày đặt hàng</span><br> 
				</div>
				<div class="col-7 pull-right">
					<span id="heading">${order.order_date}</span><br>
				</div>
			</div>
			<div class="row">
				<div class="col-5">
					<span id="heading" class="fw-bold">Tổng hóa đơn</span><br> 
				</div>
				<div class="col-7 pull-right">
					<span id="heading" class="card-title currency-style fw-bold text-danger"> <fmt:formatNumber
							value="${order.total_money}" type="currency" pattern="#,##0₫" />
					</span><br>
				</div>
			</div>
			
		</div>
		<div class="pricing">
			<div class="row">
				<div class="col-5">
					<span id="name" class="fw-bold">Chi tiết đơn hàng</span>
				</div>
				<div class="col-7">
					<span id="price"><a href="#openModal"
						onclick="viewBillDetail('${order.id}')"
						class="btn btn-light text-primary" data-toggle="modal">Xem <span><i
								class="fa-solid fa-eye"></i></span></a></span>
				</div>
			</div>

		</div>
		<div class="total">
			<div class="row">
				<div class="col-9"></div>
				<div class="col-3">
					<big>${amount}</big>
				</div>
			</div>
		</div>
				<div class="footer column">
			<a href="" class="btn btn-primary text-light float-end">Tiếp tục mua sắm</a>
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
	<%@include file="/common/footer.jsp"%>

	<%@include file="/common/script.jsp"%>
</body>
</html>