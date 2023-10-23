<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/common/head.jsp"%>
<title>Forgot Password</title>
</head>
<body>
	<%String email = request.getParameter("email") ;%>
	<div class="container d-flex flex-column">
		<div
			class="row align-items-center justify-content-center
      min-vh-100 g-0">
			<div
				class="col-12 col-md-8 col-lg-4 border-top border-3 border-primary">
				<div class="card shadow-sm">
					<div class="card-body">
						<div class="mb-4 text-center">
							<h3></h3>
							<h3 class="mb-1 fw-bold">Change Password</h3>
							${error}
						</div>
						<form action="reset-password" method="post">
							<div class="mb-3">
								<div class="form-group">
									<label for="email" class="form-label fw-bold">Your new
										password</label> <input type="password" class="form-control"
										name="newpass" placeholder="Enter Your New Password" required>
								</div>
								<div class="form-group">
									<label for="email" class="form-label fw-bold">Repeat
										password</label> <input type="password" class="form-control"
										name="cfmnewpass" placeholder="Enter Your New Password Again" required>
								</div>

							</div>
							<div class="mb-3 d-grid">
								<button type="submit" class="btn btn-primary">Confirm</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>