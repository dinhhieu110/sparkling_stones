<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<%@include file="/common/head.jsp"%>
<style type="text/css">
.divider:after, .divider:before {
	content: "";
	flex: 1;
	height: 1px;
	background: #eee;
}

.h-custom {
	height: calc(100% - 73px);
}

@media ( max-width : 450px) {
	.h-custom {
		height: 100%;
	}
}
</style>
</head>
<body>

	<input type="hidden" id="status" value="<%= request.getParameter("status")%>">

	<section class="vh-100">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src="https://static.vecteezy.com/system/resources/previews/006/409/447/non_2x/jewelers-maker-jewelry-accessories-such-as-necklaces-earrings-and-bracelets-from-gems-in-flat-style-illustration-for-poster-background-vector.jpg"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<form action="login" method="post">
						<div
							class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
							<p class="lead fw-normal mb-0 me-3">Đăng nhập với</p>
							<button type="button" class="btn btn-primary btn-floating mx-1">
								<i class="fab fa-facebook-f"></i>
							</button>

							<button type="button" class="btn btn-primary btn-floating mx-1">
								<i class="fab fa-twitter"></i>
							</button>

							<button type="button" class="btn btn-primary btn-floating mx-1">
								<i class="fab fa-linkedin-in"></i>
							</button>
						</div>

						<div class="divider d-flex align-items-center my-4">
							<p class="text-center fw-bold mx-3 mb-0">Hoặc</p>
						</div>

						<!-- Email input -->
						<div class="form-outline mb-4">
							<input type="email" id="form3Example3"
								class="form-control form-control-lg"
								placeholder="Nhập địa chỉ email hợp lệ" name="txtEmail"/> <label
								class="form-label" for="form3Example3">Email</label>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-3">
							<input type="password" id="form3Example4"
								class="form-control form-control-lg"
								placeholder="Nhập mật khẩu" name="txtPassword"/> <label class="form-label"
								for="form3Example4">Mật Khẩu</label>
						</div>

						<div class="d-flex justify-content-between align-items-center mb-3">
							<!-- Checkbox -->
							<div class="form-check mb-0">
								<input class="form-check-input me-2" type="checkbox" value=""
									id="form2Example3" name="chkRemember"/> <label class="form-check-label"
									for="form2Example3"> Ghi nhớ đăng nhập </label>
							</div>
							<a href="forgot-password" class="text-body">Quên mật khẩu?</a>
						</div>
						${error}
						<div class="text-center text-lg-start mt-2 pt-2">
							<button type="submit" class="btn btn-primary btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng Nhập</button>
							<p class="small fw-bold mt-2 pt-1 mb-0">
								Chưa có tài khoản? <a href="register" class="link-danger">Đăng kí</a>
							</p>
						</div>

					</form>
				</div>
			</div>
		</div>
		<div
			class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
			<!-- Copyright -->
			<div class="text-white mb-3 mb-md-0">Sparkling Stones © 2023.</div>
			<!-- Copyright -->

			<!-- Right -->
			<div>
				<a href="#!" class="text-white me-4"> <i
					class="fab fa-facebook-f"></i>
				</a> <a href="#!" class="text-white me-4"> <i class="fab fa-twitter"></i>
				</a> <a href="#!" class="text-white me-4"> <i class="fab fa-google"></i>
				</a> <a href="#!" class="text-white"> <i class="fab fa-linkedin-in"></i>
				</a>
			</div>
			<!-- Right -->
		</div>
	</section>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if(status == "SuccessfullyRegister"){
			swal("Chúc Mừng","Đăng kí tài khoản thành công","success");
		}
		if(status == "SuccessfullyResetPassword"){
			swal("Chúc Mừng","Cập nhật mật khẩu thành công","success");
		}
	</script>
	
	
	<%@include file="/common/script.jsp"%>
</body>
</html>