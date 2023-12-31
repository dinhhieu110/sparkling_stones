<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="model.User"%>

<%@include file="/common/head.jsp"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("/login");
}
%>
<title>Change Password</title>
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
							<h3></h3>
							<h3 class="mb-1 fw-bold">Change Password?🔒</h3>

						</div>
						<form action="ChangePassword" method="post">
							<div class="mb-3">
								<input type="hidden" id="email" class="form-control"
									name="email" placeholder="Enter Your Email" required
									value="${user.getEmail()}"> <label for="oldpass"
									class="form-label fw-bold">Old Password</label> <input
									type="password" id="oldpass" class="form-control"
									name="oldpass" placeholder="Enter Your Old PassWord" required>

								<label for="newpass" class="form-label fw-bold">New
									Password</label> <input type="password" id="newpass"
									class="form-control" name="newpass"
									placeholder="Enter Your New PassWord"
									pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
									title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất 1 chữ hoa, 1 chữ thường và 1 ký tự đặc biệt"
									required> <label for="comfirmnewpass"
									class="form-label fw-bold">Comfirm Password</label> <input type="password" id="comfirmnewpass"
									class="form-control" name="comfirmnewpass"
									placeholder="Comfirm PassWord" required>
									<input type="hidden" name= "role" value ="<%=request.getParameter("role")%>">
							</div>
							${error}
							<div class="mb-3 d-grid">
								<button type="submit" class="btn btn-primary">Change
									Password</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
