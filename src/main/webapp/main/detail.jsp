<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>${product.title}|SparklingStones</title>
<%@include file="/common/head.jsp"%>
<style>
.swiper-slide {
	height: 100%;
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
</style>
</head>
<body>
	<%@include file="/common/header.jsp"%>

	<!-- Heading -->
	<div class="bg-primary">
		<div class="container py-4">
			<!-- Breadcrumb -->
			<nav class="d-flex">
				<h6 class="mb-0">
					<a href="" class="text-white-50">Home</a> <span
						class="text-white-50 mx-2"> > </span> <a href="list"
						class="text-white-50">Library</a> <span class="text-white-50 mx-2">
						> </span> <a href="" class="text-white">${product.title}</a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Heading -->

	<!-- content -->
	<section class="py-5">
		<div class="container">
			<div class="row gx-5">
				<aside class="col-lg-6">
					<div class="swiper mySwiper2">
						<div class="swiper-wrapper" style="height: 100%">
							<div class="swiper-slide">
								<div style="background-image: url('${product.thumbnail}')"></div>
							</div>
							<c:forEach items="${product.gallery.array}" var="image">
								<div class="swiper-slide">
									<div style="background-image: url('${image}')"></div>
								</div>
							</c:forEach>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
					<div class="swiper mySwiper mt-2">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div style="background-image: url('${product.thumbnail}')"></div>
							</div>
							<c:forEach items="${product.gallery.array}" var="image">
								<div class="swiper-slide">
									<div style="background-image: url('${image}')"></div>
								</div>
							</c:forEach>
						</div>
					</div>

				</aside>
				<main class="col-lg-6">
					<div class="ps-lg-3">
						<h4 class="title text-dark">${product.title}</h4>
						<div class="d-flex flex-row my-3">
							<div class="text-warning mb-1 me-2">
								<c:if test="${product.rating > 0}">
									<c:forEach begin="1" end="5" varStatus="star">
										<c:choose>
											<c:when test="${product.rating >= star.count}">
												<i class="fas fa-star"></i>
											</c:when>
											<c:when
												test="${product.rating < star.count and product.rating > star.count - 1}">
												<i class="fas fa-star-half-alt"></i>
											</c:when>
											<c:otherwise>
												<i class="far fa-star"></i>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
								<span class="ms-1">${product.rating > 0 ? product.rating : "No reviews yet"}</span>
							</div>
							<span class="text-muted"><i
								class="fas fa-shopping-basket fa-sm mx-1"></i>154 orders</span> <span
								class="text-success ms-2">In stock</span>
						</div>

						<div class="mb-3">
							<span class="h5"><fmt:formatNumber type="currency"
									value="${product.discount}" pattern="#,###₫" /></span> <span
								class="text-muted">/per box</span>
						</div>

						<p>${product.description}</p>

						<div class="row">
							<dt class="col-3">Type:</dt>
							<dd class="col-9">Regular</dd>

							<dt class="col-3">Color</dt>
							<dd class="col-9">Brown</dd>

							<dt class="col-3">Material</dt>
							<dd class="col-9">Cotton, Jeans</dd>

							<dt class="col-3">Brand</dt>
							<dd class="col-9">Reebook</dd>
						</div>

						<hr />

						<div class="row mb-4">
							<div class="col-md-4 col-6">
								<label class="mb-2">Size</label> <select
									class="form-select border border-secondary"
									style="height: 35px;">
									<option>Small</option>
									<option>Medium</option>
									<option>Large</option>
								</select>
							</div>
							<!-- col.// -->
							<div class="col-md-4 col-6 mb-3">
								<label class="mb-2 d-block">Quantity</label>
								<div class="input-group mb-3" style="width: 170px;">
									<button class="btn btn-white border border-secondary px-3"
										type="button" data-action="descrease"
										onClick="changeQuantity(this)" data-mdb-ripple-color="dark">
										<i class="fas fa-minus"></i>
									</button>
									<input type="number" min="0" step="1" id="quantity"
										class="form-control text-center border border-secondary"
										value="0" aria-label="Example text with button addon" />
									<button class="btn btn-white border border-secondary px-3"
										type="button" data-action="increase"
										onClick="changeQuantity(this)" id="button-addon2"
										data-mdb-ripple-color="dark">
										<i class="fas fa-plus"></i>
									</button>
								</div>
							</div>
						</div>
						<a href="#" class="btn btn-warning shadow-0"> Buy now </a> <a
							href="#" class="btn btn-primary shadow-0"> <i
							class="me-1 fa fa-shopping-basket"></i> Add to cart
						</a> <a href="#"
							class="btn btn-light border border-secondary py-2 icon-hover px-3">
							<i class="me-1 fa fa-heart fa-lg"></i> Save
						</a>
					</div>
				</main>
			</div>
		</div>
	</section>
	<!-- content -->

	<section class="bg-light border-top py-4">
		<div class="container">
			<div class="row gx-4">
				<div class="col-lg-8 mb-4">
					<div class="border rounded-2 px-3 py-2 bg-white">
						<!-- Pills navs -->
						<ul class="nav nav-pills nav-justified mb-3" id="ex1"
							role="tablist">
							<li class="nav-item d-flex" role="presentation"><a
								class="nav-link d-flex align-items-center justify-content-center w-100 active"
								id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1"
								role="tab" aria-controls="ex1-pills-1" aria-selected="true">Specification</a>
							</li>
							<li class="nav-item d-flex" role="presentation"><a
								class="nav-link d-flex align-items-center justify-content-center w-100"
								id="ex1-tab-2" data-mdb-toggle="pill" href="#ex1-pills-2"
								role="tab" aria-controls="ex1-pills-2" aria-selected="false">Reviews
							</a></li>
							<li class="nav-item d-flex" role="presentation"><a
								class="nav-link d-flex align-items-center justify-content-center w-100"
								id="ex1-tab-3" data-mdb-toggle="pill" href="#ex1-pills-3"
								role="tab" aria-controls="ex1-pills-3" aria-selected="false">Shipping
									info</a></li>
							<li class="nav-item d-flex" role="presentation"><a
								class="nav-link d-flex align-items-center justify-content-center w-100"
								id="ex1-tab-4" data-mdb-toggle="pill" href="#ex1-pills-4"
								role="tab" aria-controls="ex1-pills-4" aria-selected="false">Seller
									profile</a></li>
						</ul>
						<!-- Pills navs -->

						<!-- Pills content -->
						<div class="tab-content" id="ex1-content">
							<div class="tab-pane fade show active" id="ex1-pills-1"
								role="tabpanel" aria-labelledby="ex1-tab-1">
								<p>With supporting text below as a natural lead-in to
									additional content. Lorem ipsum dolor sit amet, consectetur
									adipisicing elit, sed do eiusmod tempor incididunt ut labore et
									dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
									exercitation ullamco laboris nisi ut aliquip ex ea commodo
									consequat. Duis aute irure dolor in reprehenderit in voluptate
									velit esse cillum dolore eu fugiat nulla pariatur.</p>
								<div class="row mb-2">
									<div class="col-12 col-md-6">
										<ul class="list-unstyled mb-0">
											<li><i class="fas fa-check text-success me-2"></i>Some
												great feature name here</li>
											<li><i class="fas fa-check text-success me-2"></i>Lorem
												ipsum dolor sit amet, consectetur</li>
											<li><i class="fas fa-check text-success me-2"></i>Duis
												aute irure dolor in reprehenderit</li>
											<li><i class="fas fa-check text-success me-2"></i>Optical
												heart sensor</li>
										</ul>
									</div>
									<div class="col-12 col-md-6 mb-0">
										<ul class="list-unstyled">
											<li><i class="fas fa-check text-success me-2"></i>Easy
												fast and ver good</li>
											<li><i class="fas fa-check text-success me-2"></i>Some
												great feature name here</li>
											<li><i class="fas fa-check text-success me-2"></i>Modern
												style and design</li>
										</ul>
									</div>
								</div>
								<table class="table border mt-3 mb-2">
									<tr>
										<th class="py-2">Display:</th>
										<td class="py-2">13.3-inch LED-backlit display with IPS</td>
									</tr>
									<tr>
										<th class="py-2">Processor capacity:</th>
										<td class="py-2">2.3GHz dual-core Intel Core i5</td>
									</tr>
									<tr>
										<th class="py-2">Camera quality:</th>
										<td class="py-2">720p FaceTime HD camera</td>
									</tr>
									<tr>
										<th class="py-2">Memory</th>
										<td class="py-2">8 GB RAM or 16 GB RAM</td>
									</tr>
									<tr>
										<th class="py-2">Graphics</th>
										<td class="py-2">Intel Iris Plus Graphics 640</td>
									</tr>
								</table>
							</div>
							<div class="tab-pane fade mb-2" id="ex1-pills-2" role="tabpanel"
								aria-labelledby="ex1-tab-2">
								<h4>Write your comment</h4>
								<div class="form-outline mb-4">
									<textarea class="form-control" id="form4Example3" rows="2"></textarea>
									<label class="form-label" for="form4Example3">Comment</label>
								</div>
								<h4>Review from users</h4>
								<c:if test="${reviews.size() > 0}">
									<c:forEach items="${reviews}" var="review">
										<div class="card mb-3">
											<div class="card-body">
												<h5 class="card-title">${review.name}
													<span class="text-muted mini-text"><fmt:formatDate
															value="${review.createdAt}" pattern="yyyy-MM-dd HH:mm" /></span>
												</h5>
												<p class="card-subtitle text-warning">
													<c:forEach begin="1" end="${review.rating}">
														<i class="fas fa-star"></i>
													</c:forEach>
													<c:forEach begin="${review.rating + 1}" end="5">
														<i class="far fa-star"></i>
													</c:forEach>
												</p>
												<p class="card-text">${review.comment}</p>
												<c:if test="${review.response != null}">
													<div class="response-box">
														<p class="fw-bold">Respone from Sparkling Stones</p>
														<p class="mb-0">${review.response}</p>
													</div>
												</c:if>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${reviews.size() == 0}">No reviews yet</c:if>
							</div>
							<div class="tab-pane fade mb-2" id="ex1-pills-3" role="tabpanel"
								aria-labelledby="ex1-tab-3">
								Another tab content or sample information now <br /> Dolor sit
								amet, consectetur adipisicing elit, sed do eiusmod tempor
								incididunt ut labore et dolore magna aliqua. Ut enim ad minim
								veniam, quis nostrud exercitation ullamco laboris nisi ut
								aliquip ex ea commodo consequat. Duis aute irure dolor in
								reprehenderit in voluptate velit esse cillum dolore eu fugiat
								nulla pariatur. Excepteur sint occaecat cupidatat non proident,
								sunt in culpa qui officia deserunt mollit anim id est laborum.
							</div>
							<div class="tab-pane fade mb-2" id="ex1-pills-4" role="tabpanel"
								aria-labelledby="ex1-tab-4">
								Some other tab content or sample information now <br /> Lorem
								ipsum dolor sit amet, consectetur adipisicing elit, sed do
								eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
								enim ad minim veniam, quis nostrud exercitation ullamco laboris
								nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
								in reprehenderit in voluptate velit esse cillum dolore eu fugiat
								nulla pariatur. Excepteur sint occaecat cupidatat non proident,
								sunt in culpa qui officia deserunt mollit anim id est laborum.
							</div>
						</div>
						<!-- Pills content -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="px-0 border rounded-2 shadow-0">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Similar items</h5>
								<div class="d-flex mb-3">
									<a href="#" class="me-3"> <img
										src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/8.webp"
										style="min-width: 96px; height: 96px;"
										class="img-md img-thumbnail" />
									</a>
									<div class="info">
										<a href="#" class="nav-link mb-1"> Rucksack Backpack Large
											<br /> Line Mounts
										</a> <strong class="text-dark"> $38.90</strong>
									</div>
								</div>

								<div class="d-flex mb-3">
									<a href="#" class="me-3"> <img
										src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/9.webp"
										style="min-width: 96px; height: 96px;"
										class="img-md img-thumbnail" />
									</a>
									<div class="info">
										<a href="#" class="nav-link mb-1"> Summer New Men's Denim
											<br /> Jeans Shorts
										</a> <strong class="text-dark"> $29.50</strong>
									</div>
								</div>

								<div class="d-flex mb-3">
									<a href="#" class="me-3"> <img
										src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/10.webp"
										style="min-width: 96px; height: 96px;"
										class="img-md img-thumbnail" />
									</a>
									<div class="info">
										<a href="#" class="nav-link mb-1"> T-shirts with multiple
											colors, for men and lady </a> <strong class="text-dark">
											$120.00</strong>
									</div>
								</div>

								<div class="d-flex">
									<a href="#" class="me-3"> <img
										src="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/11.webp"
										style="min-width: 96px; height: 96px;"
										class="img-md img-thumbnail" />
									</a>
									<div class="info">
										<a href="#" class="nav-link mb-1"> Blazer Suit Dress
											Jacket for Men, Blue color </a> <strong class="text-dark">
											$339.90</strong>
									</div>
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

	<script>
		var swiper = new Swiper(".mySwiper", {
			loop : true,
			spaceBetween : 10,
			slidesPerView : 4,
			freeMode : true,
			watchSlidesProgress : true,
		});
		var swiper2 = new Swiper(".mySwiper2", {
			loop : true,
			spaceBetween : 10,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
			thumbs : {
				swiper : swiper,
			},
		});
	</script>
</body>
</html>