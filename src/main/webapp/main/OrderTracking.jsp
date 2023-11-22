<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Order Tracking</title>
<style>

.card {
	margin: auto;
	width: 45%;
	max-width: 600px;
	padding: 4vh 0;
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-top: 3px solid rgb(252, 103, 49);
	border-bottom: 3px solid rgb(252, 103, 49);
	border-left: none;
	border-right: none;
	margin-top: 20px;
}

@media ( max-width :768px) {
	.card {
		width: 90%;
	}
}

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

#progressbar {
	margin-bottom: 3vh;
	overflow: hidden;
	color: rgb(252, 103, 49);
	padding-left: 0px;
	margin-top: 3vh
}

#progressbar li {
	list-style-type: none;
	font-size: x-small;
	width: 25%;
	float: left;
	position: relative;
	font-weight: 400;
	color: rgb(160, 159, 159);
}

#progressbar #step1:before {
	content: "";
	color: rgb(252, 103, 49);
	width: 5px;
	height: 5px;
	margin-left: 0px !important;
	/* padding-left: 11px !important */
}

#progressbar #step2:before {
	content: "";
	color: #fff;
	width: 5px;
	height: 5px;
	margin-left: 32%;
}

#progressbar #step3:before {
	content: "";
	color: #fff;
	width: 5px;
	height: 5px;
	margin-right: 32%;
	/* padding-right: 11px !important */
}

#progressbar #step4:before {
	content: "";
	color: #fff;
	width: 5px;
	height: 5px;
	margin-right: 0px !important;
	/* padding-right: 11px !important */
}

#progressbar li:before {
	line-height: 29px;
	display: block;
	font-size: 12px;
	background: #ddd;
	border-radius: 50%;
	margin: auto;
	z-index: -1;
	margin-bottom: 1vh;
}

#progressbar li:after {
	content: '';
	height: 2px;
	background: #ddd;
	position: absolute;
	left: 0%;
	right: 0%;
	margin-bottom: 2vh;
	top: 1px;
	z-index: 1;
}

.progress-track {
	padding: 0 8%;
}

#progressbar li:nth-child(2):after {
	margin-right: auto;
}

#progressbar li:nth-child(1):after {
	margin: auto;
}

#progressbar li:nth-child(3):after {
	float: left;
	width: 68%;
}

#progressbar li:nth-child(4):after {
	margin-left: auto;
	width: 132%;
}

#progressbar  li.active {
	color: black;
}

#progressbar li.active:before, #progressbar li.active:after {
	background: rgb(252, 103, 49);
}
</style>
<%@include file="/common/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<%@include file="/common/header.jsp"%>

	<div class="card">
		<div class="title fs-1">HÓA ĐƠN ĐẶT HÀNG</div>
		<div class="info">
			<div class="row">
				<div class="col-7">
					<span id="heading">Tên Khách Hàng</span><br> <span id="details">${fullName}</span>
				</div>
				<div class="col-5 pull-right">
					<span id="heading">Đơn hàng số</span><br> <span id="details">${countOrders}</span>
				</div>
			</div>
		</div>
		<div class="pricing">
			<div class="row">
				<div class="col-9">
					<span id="name">Nhẫn kim cương</span>
				</div>
				<div class="col-3">
					<span id="price">100000000</span>
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
		<div class="tracking">
			<div class="title">Tracking Order</div>
		</div>
		<div class="progress-track">
			<ul id="progressbar">
				<li class="step0 active " id="step1">Ordered</li>
				<li class="step0 active text-center" id="step2">Shipped</li>
				<li class="step0 active text-right" id="step3">On the way</li>
				<li class="step0 text-right" id="step4">Delivered</li>
			</ul>
		</div>


		<div class="footer column">
			<button class="btn btn-primary float-end">Tiếp tục mua sắm</button>
		</div>
	</div>

	<%@include file="/common/footer.jsp"%>

	<%@include file="/common/script.jsp"%>
</body>
</html>