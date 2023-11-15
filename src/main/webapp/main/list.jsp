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
#toast{
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

#toast.display{
	visibility: visible;
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {
	from {
		bottom: 0;
		opacity: 0;
	}
	to {
		bottom: 30px;
		opacity: 1;
	}
}
@keyframes fadeOut {
	from{
		bottom: 30px;
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
										aria-controls="panelsStayOpen-collapseThree">Price</button>
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
													<p class="mb-0">Min</p>
													<div class="form-outline">
														<input type="number" name="minPrice" id="minPrice"
															class="form-control" value="${minPrice}" /> <label
															class="form-label" for="typeNumber">0₫</label>
													</div>
												</div>
												<div class="col-6">
													<p class="mb-0">Max</p>
													<div class="form-outline">
														<input type="number" name="maxPrice" id="maxPrice"
															class="form-control" value="${maxPrice}" /> <label
															class="form-label" for="typeNumber">350000000₫</label>
													</div>
												</div>

											</div>
											<button type="submit"
												class="btn btn-white w-100 border border-secondary"
												id="applyPriceRangeButton">apply</button>
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
											<a href="#!" class="btn btn-primary shadow-0 me-1" onclick="addToCart(event, '${p.id}')">Thêm vào giỏ hàng</a> <a href="#!"
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
								<% if(from=="range") { %> href="GetProductByPriceRange?minPrice=${minPrice}&maxPrice=${maxPrice}&index=${(tag-1)}" <%}%>
								<% if (from =="search") { %>
								href="search?txt=${searchName}&categoryId=${categoryId}&index=${(tag-1)}"
								<%}%> aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach begin="1" end="${endP}" var="i">
								<li class="page-item ${tag == i ? 'active' : ''}"><c:url
										var="paginationUrl" value="shop">
										<c:param name="categoryId"
											value="${not empty categoryId ? categoryId : ''}" />
										<c:param name="index" value="${i}" />
									</c:url> <a class="page-link pagination-link" href="${paginationUrl}">${i}</a>
								</li>
							</c:forEach>


							<li class="page-item ${tag == endP ? 'disabled' : ''}"><a
								class="page-link" <% if(from=="shop") { %>
								href="shop?categoryId=${categoryId}&index=${(tag+1)}" <%}%>
								<% if(from=="range") { %> href="GetProductByPriceRange?minPrice=${minPrice}&maxPrice=${maxPrice}&index=${(tag+1)}" <%}%>
								<% if (from =="search") { %>
								href="search?txt=${searchName}&categoryId=${categoryId}&index=${(tag+1)}"
								<%}%> aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
						<!-- <ul class="pagination" id="priceRangePagination">
							Pagination links will be added here dynamically
						</ul> -->
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

<!-- Lưu giữ categoryId -->
<!-- <script>
	var categoryId = "${param.categoryId}";
</script>
 -->
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
	});
</script>

<!-- Thêm vào script để hiển thị giá trị ban đầu và xử lý sự kiện khi form được submit -->
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var minPriceValue = $
		{
			minPrice
		}
		;
		var maxPriceValue = $
		{
			maxPrice
		}
		;

		document.getElementById("minPrice").value = minPriceValue;
		document.getElementById("maxPrice").value = maxPriceValue;

		// Bắt sự kiện submit form
		document.getElementById("filterForm").addEventListener(
				"submit",
				function(event) {
					event.preventDefault();

					// Lấy giá trị từ form và gửi đến servlet
					var minPrice = document.getElementById("minPrice").value;
					var maxPrice = document.getElementById("maxPrice").value;

					window.location.href = "GetProductByPriceRange?minPrice="
							+ minPrice + "&maxPrice=" + maxPrice;
				});
	});
</script>




<!-- <script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    function redirectToServlet(categoryId, tag) {
        var minPrice = document.getElementById("minPrice").value;
        var maxPrice = document.getElementById("maxPrice").value;

        if (isNaN(minPrice) || isNaN(maxPrice)) {
            alert("Please enter valid values for the price range.");
            return;
        }

        minPrice = parseInt(minPrice);
        maxPrice = parseInt(maxPrice);

        if (minPrice < 0 || maxPrice < 0 || minPrice > maxPrice) {
            alert("Please enter a valid price range.");
            return;
        }

        var servletURL = "${pageContext.request.contextPath}/GetProductByPriceRange?minPrice=" + minPrice + "&maxPrice=" + maxPrice + "&categoryId=" + categoryId + "&index=" + tag;

        window.location.href = servletURL;
    }

    var applyButton = document.getElementById("applyButton");
    applyButton.addEventListener("click", function() {
        var categoryId = "${param.categoryId}";
        var tag = 1; // Set the default tag value
        redirectToServlet(categoryId, tag);
    });

    var paginationLinks = document.querySelectorAll(".pagination-link");
    paginationLinks.forEach(function(link) {
        link.addEventListener("click", function(event) {
            event.preventDefault();
            var tag = this.innerText;
            var categoryId = "${param.categoryId}";
            redirectToServlet(categoryId, tag);
        });
    });
});

</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var categoryId = "${param.categoryId}";
        var tag = "${tag}"; // Set the initial tag value
        var paginationLinks = document.querySelectorAll(".pagination-link");
        paginationLinks.forEach(function(link) {
            link.addEventListener("click", function(event) {
                event.preventDefault();
                var index = this.innerText;
                redirectToServlet(categoryId, index);
            });
        });
    });
</script> -->

</html>