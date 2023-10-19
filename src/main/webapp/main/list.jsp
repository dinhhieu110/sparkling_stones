<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<title>Shop</title>
<%@include file="/common/head.jsp"%>
</head>
<body>
	<%@include file="/common/header.jsp"%>

	<!-- Heading -->
	<div class="bg-primary mb-4">
		<div class="container py-4">
			<h3 class="text-white mt-2">Jewelry</h3>
			<!-- Breadcrumb -->
			<nav class="d-flex mb-2">
				<h6 class="mb-0">
					<a href="home" class="text-white-50">Home</a> <span
						class="text-white-50 mx-2"> > </span> <a href="shop"
						class="text-white"><u>Shop</u></a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Heading -->

	<!-- sidebar + content -->
	<section class="">
		<div class="container">
			<div class="row">
				<!-- sidebar -->
				<div class="col-lg-3">
					<!-- Toggle button -->
					<button class="btn btn-outline-secondary mb-3 w-100 d-lg-none"
						type="button" data-mdb-toggle="collapse"
						data-mdb-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span>Show filter</span>
					</button>
					<!-- Collapsible wrapper -->
					<div class="collapse card d-lg-block mb-5"
						id="navbarSupportedContent">
						<div class="accordion" id="accordionPanelsStayOpenExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingOne">
									<button class="accordion-button text-dark bg-light"
										type="button" data-mdb-toggle="collapse"
										data-mdb-target="#panelsStayOpen-collapseOne"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseOne">Categories</button>
								</h2>
								<div id="panelsStayOpen-collapseOne"
									class="accordion-collapse collapse show"
									aria-labelledby="headingOne">
									<div class="accordion-body">
										<ul class="list-unstyled">
											<c:forEach items="${listOfCates}" var="cate">
												<li><a href="#" class="text-dark">${cate.name}</a></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button text-dark bg-light"
										type="button" data-mdb-toggle="collapse"
										data-mdb-target="#panelsStayOpen-collapseThree"
										aria-expanded="false"
										aria-controls="panelsStayOpen-collapseThree">Price</button>
								</h2>
								<div id="panelsStayOpen-collapseThree"
									class="accordion-collapse collapse show"
									aria-labelledby="headingThree">
									<div class="accordion-body">
										<div class="range">
											<input type="range" class="form-range" id="customRange1" />
										</div>
										<div class="row mb-3">
											<div class="col-6">
												<p class="mb-0">Min</p>
												<div class="form-outline">
													<input type="number" id="typeNumber" class="form-control" />
													<label class="form-label" for="typeNumber">0₫</label>
												</div>
											</div>
											<div class="col-6">
												<p class="mb-0">Max</p>
												<div class="form-outline">
													<input type="number" id="typeNumber" class="form-control" />
													<label class="form-label" for="typeNumber">350000000₫</label>

												</div>
											</div>
										</div>
										<button type="button"
											class="btn btn-white w-100 border border-secondary">apply</button>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button text-dark bg-light"
										type="button" data-mdb-toggle="collapse"
										data-mdb-target="#panelsStayOpen-collapseFive"
										aria-expanded="false"
										aria-controls="panelsStayOpen-collapseFive">Ratings</button>
								</h2>
								<div id="panelsStayOpen-collapseFive"
									class="accordion-collapse collapse show"
									aria-labelledby="headingThree">
									<div class="accordion-body">
										<!-- Default checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault" checked /> <label
												class="form-check-label" for="flexCheckDefault"> <i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i> <i
												class="fas fa-star text-warning"></i>
											</label>
										</div>
										<!-- Default checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault" checked /> <label
												class="form-check-label" for="flexCheckDefault"> <i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i> <i
												class="fas fa-star text-secondary"></i>
											</label>
										</div>
										<!-- Default checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault" checked /> <label
												class="form-check-label" for="flexCheckDefault"> <i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-secondary"></i> <i
												class="fas fa-star text-secondary"></i>
											</label>
										</div>
										<!-- Default checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="flexCheckDefault" checked /> <label
												class="form-check-label" for="flexCheckDefault"> <i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-warning"></i><i
												class="fas fa-star text-secondary"></i><i
												class="fas fa-star text-secondary"></i> <i
												class="fas fa-star text-secondary"></i>
											</label>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- sidebar -->
				<!-- content -->
				<div class="col-lg-9">
					<header
						class="d-sm-flex align-items-center border-bottom mb-4 pb-3">
						<strong class="d-block py-2"><c:out
								value="${listP.size()} Items found" /> </strong>
						<div class="ms-auto">
							<select class="form-select d-inline-block w-auto border pt-1">
								<option value="0">Best match</option>
								<option value="1">Recommended</option>
								<option value="2">High rated</option>
								<option value="3">Randomly</option>
							</select>
						</div>
					</header>

					<div class="row">
						<c:forEach items="${listP}" var="p">

							<div class="col-lg-4 col-md-6 col-sm-6 d-flex">
								<div class="card w-100 my-2 shadow-2-strong">
									<img src="${p.thumbnail}" class="card-img-top" />
									<div class="card-body d-flex flex-column">
										<h5 class="card-title currency-style">
											<fmt:formatNumber value="${p.discount}" type="currency"
												pattern="#,##0₫" />
											<del>
												<fmt:formatNumber value="${p.price}" type="currency"
													pattern="#,##0₫" />
											</del>
										</h5>
										<p class="card-text mb-0 d-inline-block text-truncate"
											style="max-width: 200px;">${p.title}</p>
										<div class="mt-4 text-warning">
											<i class="fas fa-star"></i><span class="fw-bold ms-1">${p.rating}
												(99+)</span>
										</div>
										<div
											class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
											<a href="#!" class="btn btn-primary shadow-0 me-1">Add to
												cart</a> <a href="#!"
												class="btn btn-light border icon-hover px-2 pt-2"><i
												class="fas fa-heart fa-lg text-secondary px-1"></i></a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<hr />

					<!-- Pagination -->
					<nav aria-label="Page navigation example"
						class="d-flex justify-content-center mt-3">
						<ul class="pagination">
							<li class="page-item ${tag == 1 ?"disabled":" "}""><a
								class="page-link" href="shop?index=${(tag-1)}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach begin="1" end="${endP}" var="i">
								<li class="page-item ${tag == i ?"active":" "}"><a
									class="page-link" href="shop?index=${i}">${i}</a></li>
							</c:forEach>
							<li class="page-item ${tag == endP ?"disabled":" "}""><a
								class="page-link" href="shop?index=${(tag + 1)}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
					<!-- Pagination -->
				</div>
			</div>
		</div>
	</section>
	<!-- sidebar + content -->

	<%@include file="/common/footer.jsp"%>

	<%@include file="/common/script.jsp"%>
</body>
</html>