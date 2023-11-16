<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<title>Shop</title>
<%@include file="/common/head.jsp"%>
<style>
/* Toast style*/
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 15px;
	text-align: center;
	z-index: 1;
	font: 18px;
	visibility: hidden;
	color: white;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>

</head>
<body>
	<%@include file="/common/header.jsp"%>

	<!-- Heading -->
	<div class="bg-primary mb-4">
		<div class="container py-4">
			<h3 class="text-white mt-2">Trang Sức</h3>
			<!-- Breadcrumb -->
			<nav class="d-flex mb-2">
				<h6 class="mb-0">
					<a href="home" class="text-white-50">Trang Chủ</a> <span
						class="text-white-50 mx-2"> > </span> <a href="shop"
						class="text-white"><u>Cửa Hàng</u></a>
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
										aria-controls="panelsStayOpen-collapseOne">Danh mục sản phẩm</button>
								</h2>
								<div id="panelsStayOpen-collapseOne"
									class="accordion-collapse collapse show"
									aria-labelledby="headingOne">
									<div class="accordion-body">
										<ul class="list-unstyled">
											<c:forEach items="${listOfCates}" var="cate">
												<li><a href="shop?categoryId=${cate.id}&index=1"
													class="text-dark">${cate.name}</a></li>
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
										aria-controls="panelsStayOpen-collapseThree">Giá sản phẩm</button>
								</h2>
								<div id="panelsStayOpen-collapseThree"
									class="accordion-collapse collapse show"
									aria-labelledby="headingThree">
									<div class="accordion-body">
										<form id="filterForm" action="GetProductByPriceRange"
											method="get">

											<div class="range">
												<input type="range" class="form-range" id="customRange1" />
											</div>
											<div class="row mb-3">
												<div class="col-6">
													<p class="mb-0">Tối thiểu</p>
													<div class="form-outline">
														<input type="number" name="minPrice" id="minPrice"
															class="form-control" value="${minPrice}" /> <label
															class="form-label" for="typeNumber">0₫</label>
													</div>
												</div>
												<div class="col-6">
													<p class="mb-0">Tối đa</p>
													<div class="form-outline">
														<input type="number" name="maxPrice" id="maxPrice"
															class="form-control" value="${maxPrice}" /> <label
															class="form-label" for="typeNumber">350000000₫</label>
													</div>
												</div>
											</div>
											<button type="submit"
												class="btn btn-white w-100 border border-secondary"
												id="applyPriceRangeButton">Áp dụng</button>
										</form>
									</div>
								</div>
							</div>
							<div class="accordion-item">
								<h2 class="accordion-header" id="headingThree">
									<button class="accordion-button text-dark bg-light"
										type="button" data-mdb-toggle="collapse"
										data-mdb-target="#panelsStayOpen-collapseFive"
										aria-expanded="false"
										aria-controls="panelsStayOpen-collapseFive">Đánh giá</button>
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
								<option value="0">Sản phẩm bán chạy</option>
								<option value="1">Sản phẩm mới</option>
							</select>
						</div>
					</header>

					<div class="row">
						<c:forEach items="${listP}" var="p">
							<div class="col-lg-4 col-md-6 col-sm-6 d-flex">
								<div class="card w-100 my-2 shadow-2-strong">
									<a href="detail?id=${p.id}"> <img src="${p.thumbnail}"
										class="card-img-top" />
									</a>
									<div class="card-body d-flex flex-column">
										<h5 class="card-title currency-style">
											<fmt:formatNumber value="${p.discount}" type="currency"
												pattern="#,##0₫" />
											<del>
												<fmt:formatNumber value="${p.price}" type="currency"
													pattern="#,##0₫" />
											</del>
										</h5>
										<a href="detail?id=${p.id}">
											<p class="card-text mb-0 d-inline-block text-truncate"
												style="max-width: 200px;">${p.title}</p>
										</a>
										<div class="mt-4 text-warning">
											<i class="fas fa-star"></i><span class="fw-bold ms-1">${p.rating}
												(99+)</span>
										</div>
										<input type="hidden" id="quantity" value="1" />
										<div
											class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
											<a href="#!" class="btn btn-primary shadow-0 me-1"
												onclick="addToCart(event, '${p.id}')">Thêm vào giỏ hàng</a>
											<a href="#!"
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
					<%
					String from = (String) request.getAttribute("from");
					String categoryId = (String) request.getParameter("categoryId"); // Get categoryId from request parameters
					%>
					<%
					String searchName = (String) request.getAttribute("searchName");
					%>

					<nav aria-label="Page navigation example"
						class="d-flex justify-content-center mt-3">
						<ul class="pagination">
							<li class="page-item ${tag == 1 ? 'disabled' : ''}"><a
								class="page-link" <% if(from=="shop") { %>
								href="shop?categoryId=${categoryId}&index=${(tag-1)}" <%}%>
								<% if(from=="range") { %>
								href="GetProductByPriceRange?minPrice=${minPrice}&maxPrice=${maxPrice}&index=${(tag-1)}"
								<%}%> <% if (from =="search") { %>
								href="search?txt=${searchName}&categoryId=${categoryId}&index=${(tag-1)}"
								<%}%> aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach begin="1" end="${endP}" var="i">
								<li class="page-item ${tag == i ? 'active' : ''}"><c:url
										var="paginationUrl"
										value="${from == 'range' ? 'GetProductByPriceRange' : from}">
										<!-- Add minPrice and maxPrice only if the 'from' is 'range' -->
										<c:if test="${from == 'range'}">
											<c:param name="minPrice" value="${minPrice}" />
											<c:param name="maxPrice" value="${maxPrice}" />
										</c:if>

										<!-- Add categoryId only if it's not empty -->
										<c:choose>
											<c:when test="${not empty categoryId and from != 'range'}">
												<c:param name="categoryId" value="${categoryId}" />
											</c:when>
										</c:choose>

										<c:param name="index" value="${i}" />
									</c:url> <a class="page-link pagination-link" href="${paginationUrl}">${i}</a>
								</li>
							</c:forEach>



							<li class="page-item ${tag == endP ? 'disabled' : ''}"><a
								class="page-link" <% if(from=="shop") { %>
								href="shop?categoryId=${categoryId}&index=${(tag+1)}" <%}%>
								<% if(from=="range") { %>
								href="GetProductByPriceRange?minPrice=${minPrice}&maxPrice=${maxPrice}&index=${(tag+1)}"
								<%}%> <% if (from =="search") { %>
								href="search?txt=${searchName}&categoryId=${categoryId}&index=${(tag+1)}"
								<%}%> aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>

					</nav>
					<!-- Pagination -->


				</div>
			</div>
		</div>
	</section>
	<!-- sidebar + content -->
	<!-- Toast -->
	<div id="toast">This is toast text</div>

	<%@include file="/common/footer.jsp"%>

	<%@include file="/common/script.jsp"%>
</body>



<!-- Thêm sự kiện cho nút phân trang theo categoryId -->
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var categoryId = "${param.categoryId}";

		var categoryPaginationLinks = document
				.querySelectorAll(".category-pagination-link");
		categoryPaginationLinks.forEach(function(link) {
			link.addEventListener("click", function(event) {
				event.preventDefault();
				var index = this.innerText;
				redirectToCategoryServlet(categoryId, index);
			});
		});

		function redirectToCategoryServlet(categoryId, index) {
			var servletURL = "shop?categoryId=" + categoryId + "&index="
					+ index;
			window.location.href = servletURL;
		}

		// Add the new function for filtering by price range
		var applyPriceRangeButton = document
				.getElementById("applyPriceRangeButton");
		if (applyPriceRangeButton) {
			applyPriceRangeButton.addEventListener("click", function(event) {
				event.preventDefault();
				filterByPriceRange();
			});
		}

		function filterByPriceRange() {
			var minPrice = document.getElementById("minPrice").value;
			var maxPrice = document.getElementById("maxPrice").value;
			var index = 1; // Set your default index here or get it from somewhere else

			var servletURL = "GetProductByPriceRange?minPrice=" + minPrice
					+ "&maxPrice=" + maxPrice + "&index=" + index;
			window.location.href = servletURL;
		}
	});
</script>
</html>