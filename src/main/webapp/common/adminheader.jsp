<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--Main Navigation-->
<style>
@media ( min-width : 991.98px) {
	main {
		padding-left: 240px;
	}
}

/* Sidebar */
.sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	padding: 58px 0 0; /* Height of navbar */
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 5%), 0 2px 10px 0 rgb(0 0 0/ 5%);
	width: 240px;
	z-index: 600;
}

@media ( max-width : 991.98px) {
	.sidebar {
		width: 100%;
	}
}

.sidebar .active {
	border-radius: 5px;
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 16%), 0 2px 10px 0 rgb(0 0 0/ 12%);
}

.sidebar-sticky {
	position: relative;
	top: 0;
	height: calc(100vh - 48px);
	padding-top: 0.5rem;
	overflow-x: hidden;
	overflow-y: auto;
	/* Scrollable contents if viewport is shorter than content. */
}
</style>
<header>
	<!-- Sidebar -->
	<nav id="sidebarMenu"
		class="collapse d-lg-block sidebar collapse bg-white">
		<div class="position-sticky">
			<div class="list-group list-group-flush mx-3 mt-4">
				<a href= "admin-home"
					class="list-group-item list-group-item-action py-2 ripple"
					aria-current="true"> <i
					class="fas fa-tachometer-alt fa-fw me-3"></i><span>Thông số chung</span>
				</a> <a href="manage-user"
					class="list-group-item list-group-item-action py-2 ripple"><i
					class="fas fa-users fa-fw me-3"></i><span>Người dùng </span> </a> <a
					href="ManageProductController" class="list-group-item list-group-item-action py-2 ripple">
					<i class="fab fa-product-hunt fa-fw me-3"></i><span>Sản phẩm</span>
				</a> <a href="#"
					class="list-group-item list-group-item-action py- ripple"><i
					class="fas fa-comments fa-fw me-3"></i><span>Đánh giá</span></a> <a
					href="#" class="list-group-item list-group-item-action py-2 ripple"><i
					class="fas fa-chart-bar fa-fw me-3"></i><span>Đơn hàng</span></a> <a
					href="#" class="list-group-item list-group-item-action py-2 ripple"><i
					class="fas fa-chart-pie fa-fw me-3"></i><span>Danh mục</span></a><a
					href="#" class="list-group-item list-group-item-action py-2 ripple"><i
					class="fas fa-calendar fa-fw me-3"></i><span>Lịch</span></a> <a
					href="#" class="list-group-item list-group-item-action py-2 ripple"><i
					class="fas fa-chart-bar fa-fw me-3"></i><span>Thống Kê</span></a>
			</div>
		</div>
	</nav>
	<!-- Sidebar -->

	<!-- Navbar -->
	<nav id="main-navbar"
		class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#sidebarMenu"
				aria-controls="sidebarMenu" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Brand -->
			<a class="navbar-brand" href="admin-home"> <img
				src="<%=request.getContextPath()%>/assets/img/logo.png" height="45"
				alt="" loading="lazy" />
			</a>
			<!-- Search form -->
			<form class="d-none d-md-flex input-group w-auto my-auto">
				<input autocomplete="off" type="search" class="form-control rounded"
					placeholder='Tìm kiếm dữ liệu' style="min-width: 225px" /> <span
					class="input-group-text border-0"><i class="fas fa-search"></i></span>
			</form>

			<!-- Right links -->
			<ul class="navbar-nav ms-auto d-flex flex-row">
				<!-- Notification dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow" href="#"
					id="navbarDropdownMenuLink" role="button"
					data-mdb-toggle="dropdown" aria-expanded="false"> <i
						class="fas fa-bell"></i> <span
						class="badge rounded-pill badge-notification bg-danger">3</span>
				</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">3 Users added successfully</a></li>
						<li><a class="dropdown-item" href="#">17 Products added successfully</a></li>
						<li><a class="dropdown-item" href="#">1 Admin added successfully</a></li>
					</ul></li>

				<!-- Icon -->
				<li class="nav-item"><a class="nav-link me-3 me-lg-0" href="#">
						<i class="fas fa-fill-drip"></i>
				</a></li>
				<!-- Icon -->
				<li class="nav-item me-3 me-lg-0"><a class="nav-link" href="#">
						<i class="fab fa-github"></i>
				</a></li>

				<!-- Avatar -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle hidden-arrow d-flex align-items-center"
					href="#" id="navbarDropdownMenuLink" role="button"
					data-mdb-toggle="dropdown" aria-expanded="false"> <img
						src="<%=request.getContextPath()%>/assets/img/david.jpg"
						class="rounded-circle" height="30" width="25" alt=""
						loading="lazy" />
				</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="EditProfile?acc=admin">Thông tin</a></li>
						<li><a class="dropdown-item" href="ChangePassword?role=admin">Đổi mật khẩu</a></li>
						<li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- Container wrapper -->
	</nav>
	<!-- Navbar -->
</header>