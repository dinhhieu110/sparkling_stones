<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<%@include file="/common/head.jsp"%>
</head>
<body>
	<%@include file="/common/header.jsp"%>
	<!-- intro -->
	<section class="pt-3">
		<div class="container">
			<div class="row gx-3">
				<main class="col-lg-9">
					<div class="card-banner p-5 bg-primary rounded-5"
						style="height: 350px;">
						<div style="max-width: 500px;">
							<h2 class="text-white">
								Great products with <br /> best deals
							</h2>
							<p class="text-white">No matter how far along you are in your
								sophistication as an amateur astronomer, there is always one.</p>
							<a href="#" class="btn btn-light shadow-0 text-primary"> View
								more </a>
						</div>
					</div>
				</main>
				<aside class="col-lg-3">
					<div class="card-banner h-100 rounded-5"
						style="background-color: #f87217;">
						<div class="card-body text-center pb-5">
							<h5 class="pt-5 text-white">Amazing Gifts</h5>
							<p class="text-white">No matter how far along you are in your
								sophistication</p>
							<a href="#" class="btn btn-outline-light"> View more </a>
						</div>
					</div>
				</aside>
			</div>
			<!-- row //end -->
		</div>
		<!-- container end.// -->
	</section>
	<!-- intro -->

	<!-- category -->
	<section>
		<div class="container pt-5">
			<nav class="row gy-4 ">
					<c:forEach items = "${listOfCates}" var ="cate">
						<div class="col">
							<a href="#"
								class="text-center d-flex flex-column justify-content-center">
								<button type="button"
									class="btn btn-outline-secondary mx-auto p-3 mb-2"
									data-mdb-ripple-color="dark">
									<div >${cate.icon}</div>
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
				<h3>New products</h3>
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
								<p class="card-text mb-0 d-inline-block text-truncate" style="max-width: 200px;">${product.title}</p>
								<div class="mt-4">
									<i class="fas fa-star text-warning"	><span class="font-roboto">${product.rating}
										(99+) </span> </i>
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
			<div class="card p-4 bg-primary">
				<div class="row align-items-center">
					<div class="col">
						<h4 class="mb-0 text-white">Best products and brands in store</h4>
						<p class="mb-0 text-white-50">Trendy products and text to
							build on the card title</p>
					</div>
					<div class="col-auto">
						<a class="btn btn-white text-primary shadow-0" href="#">Discover</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Features -->

	<!-- Recommended -->
	<section>
		<div class="container my-5">
			<header class="mb-4">
				<h3>Recommended</h3>
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
							<div class="card-body p-0 pt-3 m-2" >
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
								</h5>
								<p class="card-text mb-0 d-inline-block text-truncate" style="max-width: 200px;">${product.title}</p>
								<div class="mt-4"	>
										<i class="fas fa-star text-warning"	><span class="font-roboto">${product.rating}
										(99+) </span> </i>
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