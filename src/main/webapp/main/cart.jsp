<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
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
					<a href="" class="text-white-50">Trang Chủ</a> <span
						class="text-white-50 mx-2"> > </span> <a href=""
						class="text-white"><u>Giỏ hàng</u></a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Heading -->

	<!-- cart + summary -->
	<section class="bg-light my-5">
		<div class="container">
			<div class="row">
				<!-- cart -->
				<div class="col-lg-9">
					<div class="card border shadow-0">
						<div class="m-4">
							<h4 class="card-title mb-4">Giỏ hàng của bạn</h4>
							<div class="row">
								<div class="col-lg-5">
									<div class="me-lg-5">
										<div class="d-flex">
											<img
												src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/11.webp"
												class="border rounded me-3"
												style="width: 96px; height: 96px;" />
											<div class="">
												<a href="#" class="nav-link">Winter jacket for men and
													lady</a>
												<p class="text-muted">Yellow, Jeans</p>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
									<div class="">
										<text class="h6">$1156.00</text>
										<br /> <small class="text-muted text-nowrap"> $460.00
											/ sản phẩm </small>
									</div>
								</div>
								<div
									class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
									<div class="float-md-end">
										<div class="container">
											<div class="row d-flex">
												<button style="width: 10px"
													class="col btn btn-primary border border-secondary px-1"
													type="button" data-action="descrease"
													onClick="changeQuantity(this)" data-mdb-ripple-color="dark">
													<i class="fas fa-minus"></i>
												</button>
												<input type="number" min="0" step="1" id="quantity"
													class="col form-control text-center border border-secondary"
													value="0" aria-label="Example text with button addon" />
												<button style="width: 10px"
													class="col btn btn-primary border border-secondary px-1"
													type="button" data-action="increase"
													onClick="changeQuantity(this)" id="button-addon2"
													data-mdb-ripple-color="dark">
													<i class="fas fa-plus"></i>
												</button>
												<div class="col">
													<a href="#"
														class=" btn btn-light border text-danger icon-hover-danger">
														Xóa</a>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>

							<div class="row gy-3 mb-4">
								<div class="col-lg-5">
									<div class="me-lg-5">
										<div class="d-flex">
											<img
												src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/12.webp"
												class="border rounded me-3"
												style="width: 96px; height: 96px;" />
											<div class="">
												<a href="#" class="nav-link">Mens T-shirt Cotton Base</a>
												<p class="text-muted">Blue, Medium</p>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
									<div class="">
										<select style="width: 100px;" class="form-select me-4">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
										</select>
									</div>
									<div class="">
										<text class="h6">$44.80</text>
										<br /> <small class="text-muted text-nowrap"> $12.20
											/ per item </small>
									</div>
								</div>
								<div
									class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
									<div class="float-md-end">
										<a href="#!"
											class="btn btn-light border px-2 icon-hover-primary"><i
											class="fas fa-heart fa-lg px-1 text-secondary"></i></a> <a
											href="#"
											class="btn btn-light border text-danger icon-hover-danger">
											Remove</a>
									</div>
								</div>
							</div>

							<div class="row gy-3">
								<div class="col-lg-5">
									<div class="me-lg-5">
										<div class="d-flex">
											<img
												src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/13.webp"
												class="border rounded me-3"
												style="width: 96px; height: 96px;" />
											<div class="">
												<a href="#" class="nav-link">Blazer Suit Dress Jacket
													for Men</a>
												<p class="text-muted">XL size, Jeans, Blue</p>
											</div>
										</div>
									</div>
								</div>
								<div
									class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
									<div class="">
										<select style="width: 100px;" class="form-select me-4">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
										</select>
									</div>
									<div class="">
										<text class="h6">$1156.00</text>
										<br /> <small class="text-muted text-nowrap"> $460.00
											/ per item </small>
									</div>
								</div>
								<div
									class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
									<div class="float-md-end">
										<a href="#!"
											class="btn btn-light border px-2 icon-hover-primary"><i
											class="fas fa-heart fa-lg px-1 text-secondary"></i></a> <a
											href="#"
											class="btn btn-light border text-danger icon-hover-danger">
											Remove</a>
									</div>
								</div>
							</div>
						</div>

						<div class="border-top pt-4 mx-4 mb-4">
							<p>
								<i class="fas fa-truck text-muted fa-lg"></i> Miễn phí giao hàng
								trong vòng 1-2 tuần
							</p>
						</div>
					</div>
				</div>
				<!-- cart -->
				<!-- summary -->
				<div class="col-lg-3">
					<div class="card mb-3 border shadow-0">
						<div class="card-body">
							<form>
								<div class="form-group">
									<label class="form-label">Mã giảm giá?</label>
									<div class="input-group">
										<input type="text" class="form-control border" name=""
											placeholder="Coupon code" />
										<button class="btn btn-light border">Áp dụng</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="card shadow-0 border">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<p class="mb-2">Tổng hóa đơn:</p>
								<p class="mb-2">$329.00</p>
							</div>
							<div class="d-flex justify-content-between">
								<p class="mb-2">Giảm giá:</p>
								<p class="mb-2 text-success">-$60.00</p>
							</div>
							<hr />
							<div class="d-flex justify-content-between">
								<p class="mb-2">Tổng hóa đơn:</p>
								<p class="mb-2 fw-bold">$283.00</p>
							</div>

							<div class="mt-3">
								<a href="#" class="btn btn-success w-100 shadow-0 mb-2">
									THANH TOÁN </a> <a href="shop"
									class="btn btn-light w-100 border mt-2"> TIẾP TỤC MUA SẮM </a>
							</div>
						</div>
					</div>
				</div>
				<!-- summary -->
			</div>
		</div>
	</section>
	<!-- cart + summary -->
	<section>
		<div class="container my-5">
			<header class="mb-4">
				<h3>Sản phẩm đề xuất</h3>
			</header>

			<div class="row">
				<c:forEach items="${listP}" var ="p">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card px-4 border shadow-0 mb-4 mb-lg-0">
						<div class="mask px-2" style="height: 50px;">
							<div class="d-flex justify-content-between">
								<h6>
									<span class="badge bg-danger pt-1 mt-3 ms-2">New</span>
								</h6>
								<i
									class=" disabled fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i>
							</div>
						</div>
						<a href="#" class=""> <img
							src="${p.thumbnail}" />
						</a>
						<div class="card-body d-flex flex-column pt-3 border-top">
							<a href="detail?id=${p.id}">
								<p class="card-text mb-0 d-inline-block text-truncate"
									style="max-width: 200px;">${p.title}</p>
								</a>
								<h6 class="card-title currency-style">
									<fmt:formatNumber value="${p.discount}" type="currency"
										pattern="#,##0₫" />
									<del>
										<fmt:formatNumber value="${p.price}" type="currency"
											pattern="#,##0₫" />
									</del>
								</h6>
							<div
								class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
								<a href="#" class="btn btn-outline-primary w-100">Thêm vào
									giỏ hàng</a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>

			</div>
		</div>
	</section>
	<!-- Recommended -->

	<%@include file="/common/footer.jsp"%>

	<%@include file="/common/script.jsp"%>
</body>
</html>