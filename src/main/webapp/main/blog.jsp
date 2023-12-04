<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bài viết</title>
<%@include file="/common/head.jsp"%>
<style>
div.container-fluid {
	padding: 0px;
}
    /* Blog Section Styling */

    .container.my-5 {
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        overflow: hidden; /* Clear floats inside container */
    }

    .leftcolumn {
        width: 60%;
        float: left;
        padding-right: 20px;
    }

    .rightcolumn {
        width: 40%;
        float: left;
    }

    .card {
        background-color: #ffffff;
        border: 1px solid #e1e1e1;
        border-radius: 8px;
        margin-bottom: 20px;
        padding: 15px;
        transition: transform 0.3s; /* Add smooth transition on hover */
    }

    .card:hover {
        transform: scale(1.02); /* Enlarge card on hover */
    }

    h2, h3, h5 {
        color: #343a40;
    }

    /* Style for images inside the cards */
    .fakeimg img {
        width: 100%;
        height: auto;
        border-radius: 8px;
    }

    /* Style for the about me section */
    .rightcolumn .card:first-child {
        text-align: center;
    }

    /* Style for the popular post section */
    .rightcolumn .card:nth-child(2) {
        text-align: center;
    }

    /* Style for the follow me section */
    .rightcolumn .card:last-child {
        text-align: center;
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
					<a href="" class="text-white-50">Trang chủ</a> <span
						class="text-white-50 mx-2"> > </span> <a href=""
						class="text-white"><u>Bài viết</u></a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Heading -->

	<!-- blog -->
	<section>
		<div class="container my-5">
			<div class="leftcolumn">
				<c:forEach items="${listOfBlogs}" var="blog">
					<div class="card">
					<a href="BlogDetailController?id=${blog.id}" class="">
						<h2 class="blog-title">${blog.tittle}</h2>
						<div class="row m-3">
						<p class="col-6 blog-date text-dark" >
							<fmt:formatDate value="${blog.createdAt}" pattern="dd/MM/yyyy" />
						</p>
								<div class="col-6 text-dark">
									<div class="row">
										<p>
											<span><i class="fa-solid fa-clock"></i> </span>Thời gian đọc:
											10 phút
										</p>
									</div>
								</div>
							</div>
						<img class="blog-thumbnail" alt="image" src="${blog.thumbnail}">
					</a>
					</div>

				</c:forEach>

				

			</div>
			<div class="rightcolumn">
				<div class="card">
					<div class="card-body">
						<h2 class="card-title mb-4" style="color: #666; font-weight: bold;">Gợi ý những bài viết khác</h2>
						<c:forEach items="${otherBlogs}" var="o">
							<div class="d-flex mb-3">
								<a href="BlogDetailController?id=${o.id}" class="me-3"> <img
									src="${o.thumbnail}" style="min-width: 96px; height: 96px;"
									class="img-md img-thumbnail" />
								</a>
								<div class=" text-dark">
									 <strong><a href="BlogDetailController?id=${o.id}"
										class="nav-link mb-1"> ${o.tittle} </a></strong>
									<fmt:formatDate value="${o.createdAt}" pattern="dd/MM/yyyy" />
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- blog -->


	<%@include file="/common/footer.jsp"%>

	<%@include file="/common/script.jsp"%>
</body>

</html>