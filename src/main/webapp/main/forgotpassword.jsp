<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/common/head.jsp"%>
<title>Forgot Password</title>
</head>
<body>
	<div class="container d-flex flex-column">
		<div
			class="row align-items-center justify-content-center
      min-vh-100 g-0">
			<div
				class="col-12 col-md-8 col-lg-4 border-top border-3 border-primary">
				<div class="card shadow-sm">
					<div class="card-body">
						<div class="mb-4 text-center">
							<h3>
							</h3>
							<h3 class="mb-1 fw-bold">Forgot Password?🔒</h3>
							<p class="mb-2">Enter your registered email ID to reset the
								password</p>
						</div>
						<form action="forgot-password" method="post">
							<div class="mb-3">
								<label for="email" class="form-label fw-bold">Email</label> <input
									type="email" id="email" class="form-control" name="email"
									placeholder="Enter Your Email" required>

							</div>
							<div class="mb-3 d-grid">
								<button type="submit" class="btn btn-primary">Reset
									Password</button>
							</div>
							<div class="text-center">${error}</div>
							<span>Already have an account? <a href="main/login.jsp">sign
									in</a></span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>