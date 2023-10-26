<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang Chủ</title>
<%@include file="/common/head.jsp"%>
<style>
div.container-fluid {
	padding: 0px;
}
</style>
</head>
<body>
	<%@include file="/common/header.jsp"%>
	<!-- intro -->
	<section>
		<div class="container-fluid">
			<main class="col-lg-12">
				<!-- Carousel wrapper -->
				<div id="carouselBasicExample" class="carousel slide carousel-fade"
					data-mdb-ride="carousel">
					<!-- Indicators -->
					<div class="carousel-indicators">
						<button type="button" data-mdb-target="#carouselBasicExample"
							data-mdb-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-mdb-target="#carouselBasicExample"
							data-mdb-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-mdb-target="#carouselBasicExample"
							data-mdb-slide-to="2" aria-label="Slide 3"></button>
					</div>

					<!-- Inner -->
					<div class="carousel-inner">
						<!-- Single item -->
						<div class="carousel-item active">
							<img
								src="https://cdn.pnj.io/images/promo/187/banner-chung-1972x640-cta.jpg"
								class="d-block w-100" alt="Sunset Over the City" />
						</div>

						<!-- Single item -->
						<div class="carousel-item">
							<img
								src="https://cdn.pnj.io/images/promo/182/ts-y-t9-1200x450CTA__1_.jpg "
								height="494px" class="d-block w-100" alt="Canyon at Nigh" />
						</div>

						<!-- Single item -->
						<div class="carousel-item">
							<img
								src="https://cdn.pnj.io/images/promo/190/halloween-teasing-1972x640CTA.jpg"
								class="d-block w-100" alt="Cliff Above a Stormy Sea" />
						</div>
					</div>
					<!-- Inner -->

					<!-- Controls -->
					<button class="carousel-control-prev" type="button"
						data-mdb-target="#carouselBasicExample" data-mdb-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-mdb-target="#carouselBasicExample" data-mdb-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- Carousel wrapper -->
			</main>
			<!-- row //end -->
		</div>
		<!-- container end.// -->
	</section>
	<!-- intro -->

	<!-- category -->
	<section>
		<div class="container pt-5">
			<nav class="row gy-4 ">
				<c:forEach items="${listOfCates}" var="cate">
					<div class="col">
						<a href="#"
							class="text-center d-flex flex-column justify-content-center">
							<button type="button"
								class="btn btn-outline-secondary mx-auto p-3 mb-2"
								data-mdb-ripple-color="dark">
								<div>${cate.icon}</div>
							</button>
							<div class="text-dark">${cate.name}</div>
						</a>
					</div>
				</c:forEach>
			</nav>
		</div>
	</section>
	<!-- category -->

	<!-- Products -->
	<section>
		<div class="container my-5">
			<header class="mb-4">
				<h3>Sản Phẩm Mới Nhất</h3>
			</header>

			<div class="row">
				<c:forEach items="${listProducts}" var="product">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="card my-2 shadow-sm">
							<a href="detail?id=${product.id}" class="">
								<div class="mask" style="height: 50px;">
									<div
										class="d-flex justify-content-start align-items-start h-100 m-2">
										<h6>
											<span class="badge bg-danger pt-1">New</span>
										</h6>
									</div>
								</div> <img src="${product.thumbnail}" class="card-img-top rounded-2"
								style="aspect-ratio: 1/1" />
							</a>
							<div class="card-body p-0 pt-3 m-2">
								<a href="#!"
									class="btn btn-light border px-2 pt-2 float-end icon-hover"><i
									class="fas fa-heart fa-lg px-1 text-secondary"></i></a>

								<h5 class="card-title currency-style">
									<fmt:formatNumber value="${product.discount}" type="currency"
										pattern="#,##0₫" />
									<del>
										<fmt:formatNumber value="${product.price}" type="currency"
											pattern="#,##0₫" />
									</del>
								</h5>
								<a href="detail?id=${product.id}">
								<p class="card-text mb-0 d-inline-block text-truncate"
									style="max-width: 200px;">${product.title}</p>
								</a>
								<div class="mt-4 text-warning">
									<i class="fas fa-star"></i><span class="fw-bold ms-1">${product.rating}
										(99+)</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</section>
	<!-- Products -->

	<!-- Features -->
	<section>
		<div class="container">
			<div class="card">
				<img height ="400px"
					src="https://cdn.pnj.io/images/promo/182/ts-y-t9-1200x450CTA__1_.jpg">
			</div>
		</div>
	</section>
	<!-- Features -->

	<!-- Recommended -->
	<section>
		<div class="container my-5">
			<header class="mb-4">
				<h3>Sản Phẩm Bán Chạy</h3>
			</header>
			<div class="row">
				<c:forEach items="${listRecommendProducts}" var="product">
					<div class="col-lg-3 col-md-6 col-sm-6">

						<div class="card my-2 shadow-sm ">
							<a href="detail?id=${product.id}" class="">
								<div
									class="d-flex justify-content-start align-items-start h-100 m-2">
									<h6>
										<span class="badge bg-danger pt-1">Hot</span>
									</h6>
								</div> <img src="${product.thumbnail}" class="card-img-top rounded-2"
								style="aspect-ratio: 1/1" />
							</a>
							<div class="card-body p-0 pt-3 m-2">
								<a href="#!"
									class="btn btn-light border px-2 pt-2 float-end icon-hover"><i
									class="fas fa-heart fa-lg px-1 text-secondary"></i></a>
								<h5 class="card-title currency-style">
									<fmt:formatNumber value="${product.discount}" type="currency"
										pattern="#,##0₫" />
									<del>
										<fmt:formatNumber value="${product.price}" type="currency"
											pattern="#,##0₫" />
									</del>
								</h5>
								<a href="detail?id=${product.id}">
								<p class="card-text mb-0 d-inline-block text-truncate"
									style="max-width: 200px;">${product.title}</p>
								</a>
								<div class="mt-4 text-warning">
									<i class="fas fa-star"></i><span class="fw-bold ms-1">${product.rating}
										(99+)</span>
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