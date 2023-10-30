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
        success: function (response) {
            console.log("OK")
        },
        error: function (xhr) {
            console.log("ERROR Ajax");
        },
    });
}