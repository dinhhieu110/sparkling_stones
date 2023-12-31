<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<title>Admin Account</title>
<%@include file="/common/head.jsp"%>
<%
User user = (User) session.getAttribute("user");
if (user == null) {
	response.sendRedirect("/login");
}
%>
<style type="text/css">
.modal {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.4);
	display: none;
	align-items: center;
	justify-content: center;
	z-index: 1000; /* Ensure modal appears on top of other elements */
}

.modal.open {
	display: flex;
}

.modal-container {
	background: #ffffff;
	width: 80%; /* Responsive width */
	max-width: 400px; /* Maximum width for larger screens */
	min-height: 200px;
	position: relative;
	border-radius: 10px;
	animation: modalFadeIn 0.4s ease;
	box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.5);
	/* Add a subtle box shadow for depth */
}

.modal-header {
	background: #3B71CA;
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px;
	color: #fff;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.modal-close {
	position: absolute;
	right: 10px;
	top: 10px;
	color: #fff;
	cursor: pointer;
	opacity: 0.8;
	font-size: 20px;
}

.modal-body {
	padding: 20px;
}

.modal-label {
	font-size: 18px;
	margin-bottom: 10px;
	color: #333;
}

.modal-input {
	border: 1px solid #ccc;
	width: calc(100% - 20px); /* Adjust input width */
	padding: 10px;
	font-size: 16px;
	margin-bottom: 15px;
	border-radius: 5px;
}

#save-profile {
	background: #3B71CA;
	border: none;
	color: #fff;
	width: 100%;
	font-size: 18px;
	text-transform: uppercase;
	padding: 15px;
	cursor: pointer;
	border-radius: 5px;
	transition: background 0.3s ease;
}

#save-profile:hover {
	background: #255cab; /* Darker shade of the button color on hover */
	opacity: 0.9;
}

@
keyframes modalFadeIn {from { opacity:0;
	transform: translateY(-50px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getParameter("status")%>">
	<%@include file="/common/adminheader.jsp"%>

<!-- Heading -->
	<div class="bg-primary">
		<div class="container py-4">
			<!-- Breadcrumb -->
			<nav class="d-flex">
				<h6 class="mb-0">
					<a href="" class="text-white-50">Trang chủ</a> <span
						class="text-white-50 mx-2"> > </span> <a href=""
						class="text-white-50">Hồ sơ</a> <span class="text-white-50 mx-2">
						> </span> <a href="" class="text-white"><u>Tài khoản</u></a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Heading -->

	<!-- content -->
	<section class="py-5 bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-xl-3">
					<nav class="nav flex-lg-column w-100 d-flex nav-pills mb-4">

					</nav>
				</div>
				<main class="col-lg-9 col-xl-9">
					<div class="card p-4 mb-0 shadow-0 border">
						<div class="content-body">
							<div
								class="d-flex align-items-center justify-content-center px-4">
								<div class="me-3">
									<img src="<%=request.getContextPath()%>/assets/img/david.jpg"
										class="rounded-circle" style="height: 60px; width: 60px;" />
								</div>
								<div class="pt-2 ms-3 me-auto">
									<div class="mb-2">
										<h6 class="d-inline mb-0">Full Name:</h6>
										<span class="mx-1">${user.getFirstName()}
											${user.getLastName()}</span>
									</div>
									<div class="mb-2">
										<h6 class="d-inline mb-0">Email:</h6>
										<span class="mx-1">${user.getEmail()}</span>
									</div>

									<div class="mb-2">
										<h6 class="d-inline mb-0">Phone:</h6>
										<span class="mx-1">${user.getPhone()}</span>
									</div>
									<%-- <p class="mb-1">Email: ${profile.getEmail()}</p>
									<p class="mb-0">Phone: ${profile.getPhone()}</p> --%>
								</div>
								<button class="btn btn-primary js-change-profile ms-3">
									Cật nhật thông tin</button>

							</div>
						</div>
						<hr />

						<div class="row g-2 mb-3">
							<div class="col-md-6">
								<div class="border p-3 rounded-3 bg-light">
									<b class="mx-2 text-muted"><i class="fa fa-map-marker-alt"></i></b>
									${user.getAddress()}
								</div>
							</div>

						</div>
					</div>
				</main>

			</div>
			<div class="modal js-modal">
				<div class="modal-container js-modal-container">
					<div class="modal-close js-modal-close">
						<i class="fa-solid fa-xmark"></i>
					</div>
					<header class="modal-header">

						<i class="fa-solid fa-user" style="margin-right: 16px"></i> Change
						Profile
					</header>
					<form action="EditProfile" method="post">
						<div class="modal-body">
							<!-- <label for="email" class="modal-label"> <i
								class="ti-email"></i> Email
							</label> -->
							<input value="${user.getId()}" id="email" type="hidden" readonly
								name="email" class="modal-input"> <label
								for="first-name" class="modal-label"> <i
								class="ti-email"></i> First Name
							</label> <input value="${user.getFirstName()}" id="first-name"
								name="firstName" type="text" class="modal-input"> <label
								for="last-name" class="modal-label"> <i class="ti-email"></i>
								Last Name
							</label> <input value="${user.getLastName()}" id="last-name"
								name="lastName" type="text" class="modal-input"> <label
								for="phone" class="modal-label"> <i class="ti-email"></i>
								Phone
							</label> <input value="${user.getPhone()}" id="phone" type="text"
								name="phone" class="modal-input"
								pattern="(\+84|0)(3[2-9]|5[689]|7[06-9]|8[1-689]|9\d)(\d{7})"
								title="Số điện thoại không hợp lệ" required> <label
								for="address" class="modal-label"> <i class="ti-email"></i>
								Address
							</label> <input value="${user.getAddress()}" id="address" type="text"
								name="address" class="modal-input"> <input type="hidden"
								value="admin" name="role">

							<button id="save-profile" type="submit" value="SAVE">Save</button>
						</div>
					</form>
				</div>
			</div>

		</div>

	</section>

	<!-- content -->
	<script>
		const changeBtns = document.querySelectorAll('.js-change-profile')
		const modal = document.querySelector('.js-modal')
		const modalContainer = document.querySelector('.js-modal-container')
		const modalClose = document.querySelector('.js-modal-close')

		function showChangeProfile() {
			modal.classList.add('open')
		}
		
		function hideChangeProfile() {
			modal.classList.remove('open')
		}
		
		//lặp qua từng thẻ button nghe hành vi click 

		for(const changeBtn of changeBtns) {
			changeBtn.addEventListener('click', showChangeProfile)
		}
		//nghe hành vi click vào button close
		modalClose.addEventListener('click',hideChangeProfile)
		//Nghe hành vi click ngoài khung có thể out 
		/* modal.addEventListener('click',hideChangeProfile) */
		
		/* modalContainer.addEventListener('click',function (event) {
			event.stopPropagation()
		}) */
	</script>

	<%@include file="/common/script.jsp"%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		
		if(status == "SuccessfullyChangePassword"){
			swal("Congrats","Password Updated Successfully","success");
			document.getElementById("status").value = "";
		}
		
		
	</script>
</body>
</html>