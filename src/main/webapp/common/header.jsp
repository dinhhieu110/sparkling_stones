<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
  .nav-link {
    transition: 0.4s;
  }
  .nav-link:hover {
    transition: 0.4s;
    background-color: rgba(0, 122, 255, 0.3);
  }

  .my-li {
    margin: 0px 30px;
  }
  ul, li{
  	list-style-type: none;
  }
</style>
<div id="preloader"></div>
<header>
  <!-- Jumbotron -->
  <div class="p-3 text-center bg-white border-bottom">
    <div class="container">
      <div class="row align-items-center gy-3">
        <!-- Left elements -->
        <div class="col-lg-2 col-sm-4 col-4">
          <a href="" class="float-start">
            <img src="<%=request.getContextPath()%>/assets/img/logo.png" />
          </a>
        </div>
        <!-- Left elements -->

        <!-- Center elements -->
        <div class="order-lg-last col-lg-5 col-sm-8 col-8">
          <div class="d-flex float-end">
           <a
              href="cart"
              class="rounded border-bottom py-1 px-3 nav-link d-flex align-items-center"
            >
              <i class="fas fa-shopping-cart m-1 me-md-2"></i>
              <p class="d-none d-md-block mb-0">Giỏ Hàng</p>
            </a>
            <c:if test="${user == null}">
              <a
                href="login"
                class="me-1 border-bottom rounded py-1 px-3 nav-link d-flex align-items-center"
              >
                <i class="fas fa-user-alt m-1 me-md-2"></i>
                <p class="d-none d-md-block mb-0">Tài Khoản Của Tôi</p>
              </a>
            </c:if>
            <c:if test="${user != null}">
            <li>
              <a
                href="my-account"
                class=" dropdown-toggle hidden-arrow me-1 border-bottom rounded py-1 px-3 nav-link d-flex align-items-center"
                id="navbarDropdownMenuLink"
                role="button"
                data-mdb-toggle="dropdown"
                aria-expanded="false"
              >
                <i class="fas fa-user-alt m-1 me-md-2"></i>
                <p class="d-none d-md-block mb-0">
                  ${user.firstName} ${user.lastName}
                </p>
              </a>
              <ul
              class="dropdown-menu dropdown-menu-end"
              aria-labelledby="navbarDropdownMenuLink"
              >
            	<li><a class="dropdown-item" href="EditProfile?acc=user">Thông tin</a></li>
            	<li><a class="dropdown-item" href="ChangePassword">Đổi mật khẩu</a></li>
            	<li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
          	</ul>
          	</li>
            </c:if>
          </div>
        </div>
        <!-- Center elements -->

        <!-- Right elements -->
        <form action="search" method="get" class="col-lg-5 col-md-12 col-12">
          <div class="input-group float-center">
            <div class="form-outline">
              <input type="search" id="form1" class="form-control" name="txt" />
              <label class="form-label" for="form1">Tìm Kiếm</label>
            </div>
            <button type="submit" class="btn btn-primary shadow-0">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </form>
        <!-- Right elements -->
      </div>
    </div>
  </div>
  <!-- Jumbotron -->

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-white">
    <!-- Container wrapper -->
    <div class="container-fluid">
      <!-- Toggle button -->
      <button
        class="navbar-toggler border py-2 text-dark"
        type="button"
        data-mdb-toggle="collapse"
        data-mdb-target="#navbarLeftAlignExample"
        aria-controls="navbarLeftAlignExample"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <i class="fas fa-bars"></i>
      </button>

      <!-- Collapsible wrapper -->
      <div
        class="collapse navbar-collapse justify-content-around"
        id="navbarLeftAlignExample"
      >
        <!-- Left links -->
        <ul class="navbar-nav mb-2 mb-lg-0">
          <li class="nav-item">
            <a
              class="nav-link rounded text-dark"
              aria-current="page"
              href="home"
              >Trang Chủ</a
            >
          </li>
          <li class="nav-item my-li">
            <a class="nav-link rounded text-dark" href="shop">Cửa Hàng</a>
          </li>
          <li class="nav-item my-li">
            <a class="nav-link rounded text-dark" href="#">Thương Hiệu</a>
          </li>
          <li class="nav-item my-li">
            <a class="nav-link rounded text-dark" href="#">Quà Tặng</a>
          </li>
          <li class="nav-item my-li">
            <a class="nav-link rounded text-dark" href="#">Bài Viết</a>
          </li>
          <li class="nav-item my-li">
            <a class="nav-link rounded text-dark" href="#">Khuyến Mãi</a>
          </li>
          <!-- Navbar dropdown -->
          <li class="nav-item dropdown my-li">
            <a
              class="nav-link rounded dropdown-toggle text-dark"
              href="#"
              id="navbarDropdown"
              role="button"
              data-mdb-toggle="dropdown"
              aria-expanded="false"
            >
              Khác
            </a>
            <!-- Dropdown menu -->
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><hr class="dropdown-divider" /></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
        </ul>
        <!-- Left links -->
      </div>
    </div>
    <!-- Container wrapper -->
  </nav>
  <!-- Navbar -->
</header>