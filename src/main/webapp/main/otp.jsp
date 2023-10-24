<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/common/head.jsp"%>
<title>OTP Verification</title>
<style>
.height-100 {
	height: 100vh
}

.card {
	width: 400px;
	border: none;
	height: 300px;
	box-shadow: 0px 5px 20px 0px #3b71ca;
	z-index: 1;
	display: flex;
	justify-content: center;
	align-items: center
}

.card h6 {
	color: #3b71ca;
	font-size: 20px
}

.inputs input {
	width: 40px;
	height: 40px
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0
}

.card-2 {
	background-color: #fff;
	padding: 10px;
	width: 350px;
	height: 100px;
	bottom: -50px;
	left: 20px;
	position: absolute;
	border-radius: 5px
}

.card-2 .content {
	margin-top: 50px
}

.card-2 .content a {
	color: #3b71ca
}

.form-control:focus {
	box-shadow: none;
	border: 2px solid #3b71ca
}

.validate {
	border-radius: 20px;
	height: 40px;
	background-color: #3b71ca;
	border: 1px solid #3b71ca;
	width: 140px
}
</style>
</head>
<body>
	<div
		class="container height-100 d-flex justify-content-center align-items-center">
		<div class="position-relative">
			<div class="card p-2 text-center">
				<h6>
					Please enter the one time password <br> to verify your account
				</h6>
				<div>
					<span>A code has been sent to your email</span>
				</div>
				<form action="verify-otp" method="post">
					<input type="hidden" value="${param.otpTask}" name="otpTask">
					<div id="otp"
					class="inputs d-flex flex-row justify-content-center mt-2">
					<input class="m-2 text-center form-control rounded" type="number"
						id="first" maxlength="1" name="number" required/> <input
						class="m-2 text-center form-control rounded" type="number"
						id="second" maxlength="1" name="number" required/> <input
						class="m-2 text-center form-control rounded" type="number"
						id="third" maxlength="1" name="number" required/> <input
						class="m-2 text-center form-control rounded" type="number"
						id="fourth" maxlength="1" name="number" required/> <input
						class="m-2 text-center form-control rounded" type="number"
						id="fifth" maxlength="1" name="number" required/> <input
						class="m-2 text-center form-control rounded" type="number"
						id="sixth" maxlength="1" name="number" required/>
				</div>
				
				<div class="my-4">
					<button class="btn btn-danger px-4 validate">Validate</button>
				</div>
				
				${error}
				
				</form>
			</div>
		</div>
	</div>
	<%@include file="/common/script.jsp"%>
	<script>
		document.addEventListener("DOMContentLoaded", function(event) {

			function OTPInput() {
				const inputs = document.querySelectorAll('#otp > *[id]');
				for (let i = 0; i < inputs.length; i++) {
					inputs[i].addEventListener('keydown',
							function(event) {
								if (event.key === "Backspace") {
									inputs[i].value = '';
									if (i !== 0)
										inputs[i - 1].focus();
								} else {
									if (i === inputs.length - 1
											&& inputs[i].value !== '') {
										return true;
									} else if (event.keyCode > 47
											&& event.keyCode < 58) {
										inputs[i].value = event.key;
										if (i !== inputs.length - 1)
											inputs[i + 1].focus();
										event.preventDefault();
									} else if (event.keyCode > 64
											&& event.keyCode < 91) {
										inputs[i].value = String
												.fromCharCode(event.keyCode);
										if (i !== inputs.length - 1)
											inputs[i + 1].focus();
										event.preventDefault();
									}
								}
							});
				}
			}
			OTPInput();
		});
	</script>
</body>
</html>