window.onload = function() {
	var preloader = document.getElementById("preloader");
	if (preloader != null) {
		preloader.style.display = "none";
	}
};

function changeQuantity(target) {
	var quantity = document.getElementById("quantity");
	var action = target.getAttribute("data-action");

	var value = quantity.value;
	switch (action) {
		case "descrease":
			if (value > 0)
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