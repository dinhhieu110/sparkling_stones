<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<%@include file="/common/head.jsp"%>
<style>
body {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
	<!-- Section: Design Block -->
	<section class="text-center text-lg-start">
		<style>
.cascading-right {
	margin-right: -50px;
}

@media ( max-width : 991.98px) {
	.cascading-right {
		margin-right: 0;
	}
}
</style>

		<!-- Jumbotron -->
		<div class="container py-4">
			<div class="row g-0 align-items-center">
				<div class="col-lg-6 mb-5 mb-lg-0">
					<div class="card cascading-right"
						style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
						<div class="card-body p-5 shadow-5 text-center">
							<h2 class="fw-bold mb-5">Đăng Kí</h2>
							<form action="register" method="post">
								<!-- 2 column grid layout with text inputs for the first and last names -->
								<div class="row">
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="text" id="form3Example1" class="form-control"
												name="txtFirstName" /> <label class="form-label"
												for="form3Example1">Tên</label>
										</div>
									</div>
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="text" id="form3Example2" class="form-control"
												name="txtLastName" /> <label class="form-label"
												for="form3Example2">Họ</label>
										</div>
									</div>
								</div>

								<!-- Email input -->
								<div class="form-outline mb-4">
									<input type="email" id="form3Example3" class="form-control"
										name="txtEmail" /> <label class="form-label"
										for="form3Example3">Địa chỉ email</label>
								</div>

								<!-- Password input -->
								<div class="form-outline mb-4">
									<input type="password" id="form3Example4" class="form-control"
										name="txtPassword" /> <label class="form-label"
										for="form3Example4">Mật Khẩu</label>
								</div>

								<!-- Confirm Password input -->
								<div class="form-outline mb-4">
									<input type="password" id="form3Example5" class="form-control"
										name="txtCfmPassword" /> <label class="form-label"
										for="form3Example5">Xác nhận mật khẩu</label>
								</div>

								${error}

								<!-- Submit button -->
								<button type="submit" class="btn btn-primary btn-block mb-4">
									Đăng kí</button>

								<p class="small fw-bold mt-2 pt-1 mb-4">
									Bạn đã có tài khoản? <a href="login"
										class="link-danger">Đăng nhập</a>
								</p>

								<!-- Register buttons -->
								<div class="text-center">
									<p>hoặc đăng nhập bằng</p>
									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="fab fa-facebook-f"></i>
									</button>

									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="fab fa-google"></i>
									</button>

									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="fab fa-twitter"></i>
									</button>

									<button type="button" class="btn btn-link btn-floating mx-1">
										<i class="fab fa-github"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="col-lg-6 mb-5 mb-lg-0">
					<img
						src="https://img.freepik.com/free-vector/handmade-jewelry-abstract-concept-illustration-self-made-jewelry-designer-startup-handmade-product-book-online-handcrafted-buying-artisan-goods-custom-order_335657-149.jpg"
						class="w-100 rounded-4 shadow-4" alt="" />
				</div>
			</div>
		</div>
		<!-- Jumbotron -->
	</section>
	<!-- Section: Design Block -->

	<%@include file="/common/script.jsp"%>
</body>
</html>