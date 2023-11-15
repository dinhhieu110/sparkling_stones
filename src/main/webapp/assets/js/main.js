window.onload = function() {
	var preloader = document.getElementById("preloader");
	if (preloader != null) {
		preloader.style.display = "none";
	}
};

function getContextPath() {
	// Lấy đường dẫn trang hiện tại
	var pathName = window.location.pathname;

	// Tìm vị trí của contextPath trong đường dẫn
	var contextPathIndex = pathName.indexOf("/", 1); // Bỏ qua dấu "/" đầu tiên

	if (contextPathIndex !== -1) {
		// Trích xuất contextPath
		var contextPath = pathName.substr(0, contextPathIndex);
		return contextPath;
	} else {
		// Nếu không tìm thấy contextPath, trả về chuỗi rỗng
		return "";
	}
}

function changeQuantity(target) {
	var quantity = document.getElementById("quantity");
	var action = target.getAttribute("data-action");

	var value = quantity.value;
	switch (action) {
		case "descrease":
			if (value > 1)
				value = +value - 1;
			break;
		case "increase":
			value = +value + 1;
			break;
		default:
			throw Error;
	}

	quantity.value = value;
}

function addToCart(event, id) {
	event.preventDefault();
	var path = getContextPath();

	$.ajax({
		url: path + "/add-to-cart",
		data: {
			id: id,
			quantity: $('#quantity').val(),
		},
		type: "get",
		success: function(response) {
			console.log("OK")
		},
		error: function(xhr) {
			console.log("ERROR Ajax");
		},
	});
}

function updateCart(event, id, action) {
	event.preventDefault();
	var path = getContextPath();
	var overlayDiv = $("<div>").addClass("overlay-loader");
	var spinnerDiv = $("<div>").addClass("spinner-border text-primary");
	$("#cart").append(overlayDiv.append(spinnerDiv));

	$.ajax({
		url: path + "/add-to-cart",
		data: {
			id: id,
			action: action,
		},
		type: "post",
		success: function(response) {
			$('#cart').html(response);
		},
		error: function(xhr) {
			console.log("ERROR Ajax");
		},
	});
}

function deleteUser(id) {
	const deleteElement = document.getElementById("deleteHidden");
	deleteElement.value = id;
}

function deleteProduct(id) {
	const deleteElement2 = document.getElementById("deleteProductHidden");
	deleteElement2.value = id;
}

function updateUser(id) {
	const updateElement = document.getElementById("updateHidden");
	updateElement.value = id;
	var path = getContextPath();
	$('#title').text("Cập Nhật Người Dùng");
	$('#fbtn').text("Cập Nhật");
	$.ajax({
		url: path + "/manage-user",
		data: {
			id: id,
		},
		type: "get",
		success: function(response) {
			const user = JSON.parse(response);
			$('#email').val(user.email);
			$('#email').prop("readonly", true);
			$('#firstName').val(user.firstName);
			$('#lastName').val(user.lastName);
			$('#pass').val("password");
			$('#pass').prop("readonly", true);
			$('#address').val(user.address);
			$('#phone').val(user.phone);
			$('[name="role"]').each(function() {
				if ($(this).val() === user.role) {
					$(this).prop("checked", true);
				} else {
					$(this).prop("checked", false);
				}
			});
			$('#fbtn').val("update");



		},
		error: function(xhr) {
			console.log("ERROR Ajax");
		},
	});
}

function addUser() {
	$('#title').text("Thêm Người Dùng Mới")
	$('#email').val("");
	$('#email').prop("readonly", false);
	$('#firstName').val("");
	$('#lastName').val("");
	$('#pass').val("");
	$('#pass').prop("readonly", false);
	$('#address').val("");
	$('#phone').val("");
	$('[name="role"]').each(function() {
		$(this).prop("checked", false);
	});
	$('[name="role"]').eq(0).prop("checked", true);
	$('#fbtn').val("add");
	$('#fbtn').text("Thêm");


}


