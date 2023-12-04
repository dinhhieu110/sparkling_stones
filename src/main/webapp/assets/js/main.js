window.onload = function () {
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
      if (value > 1) value = +value - 1;
      break;
    case "increase":
      value = +value + 1;
      break;
    default:
      throw Error;
  }

  quantity.value = value;
}

// Toast
function showToast(text) {
  $("#toast").addClass("display");
  $("#toast").text(text);
  setTimeout(() => {
    $("#toast").removeClass("display");
  }, 2000);
}

function addToCart(event, id) {
  event.preventDefault();
  var path = getContextPath();
  var quantity = $("#quantity").val();
  if (quantity == "null") {
    quantity == "1";
  }
  $.ajax({
    url: path + "/add-to-cart",
    data: {
      id: id,
      quantity: quantity,
    },
    type: "get",
    success: function (response) {
      showToast("Item added successfully!");
      const cart = JSON.parse(response);
      $("#cart-quantity").html(cart.size);
    },
    error: function (xhr) {
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
    success: function (response) {
      showToast("Item added successfully!");
      var output = response.split("|||");
      var cart = JSON.parse(output[1]);
      $("#cart").html(output[0]);
      $("#cart-quantity").html(cart.quantity);
      $("#total").html(formatCurrency(cart.total));
      $("#summary").html(formatCurrency(cart.total));
    },
    error: function (xhr) {
      console.log("ERROR Ajax");
    },
  });
}

function deleteBlog(id) {
	const deleteElement3 = document.getElementById("deleteBlogHidden");
	  deleteElement3.value = id;
}

function deleteUser(id) {
  const deleteElement = document.getElementById("deleteHidden");
  deleteElement.value = id;
}

function deleteProduct(id) {
  const deleteElement2 = document.getElementById("deleteProductHidden");
  deleteElement2.value = id;
}

function updateBlog(id) {
	const updateElement = document.getElementById("updateHidden");
	updateElement.value = id;
	var path = getContextPath();
	$("#title").text("Cập Nhật Bài Viết");
	$("#fbtn").text("Cập Nhật");
	$.ajax({
		url: path + "/manage-blog",
		data: {
			id: id,
		},
		type: "get",
		success: function(response) {
			const blog = JSON.parse(response);
		    console.log(blog);
			$("#tittle").val(blog.tittle);
			$("#heading1").val(blog.heading1);
			$("#para1").val(blog.para1);
			$("#heading2").val(blog.heading2);
			$("#para2").val(blog.para2);
			$("#note").val(blog.note);

			$("#fbtn").val("update");
		},
		error: function(xhr) {
			console.log("ERROR Ajax");
		},
	});
}

function updateUser(id) {
  const updateElement = document.getElementById("updateHidden");
  updateElement.value = id;
  var path = getContextPath();
  $("#title").text("Cập Nhật Người Dùng");
  $("#fbtn").text("Cập Nhật");
  $.ajax({
    url: path + "/manage-user",
    data: {
      id: id,
    },
    type: "get",
    success: function (response) {
      const user = JSON.parse(response);
      $("#email").val(user.email);
      $("#email").prop("readonly", true);
      $("#firstName").val(user.firstName);
      $("#lastName").val(user.lastName);
      $("#pass").val("password");
      $("#pass").prop("readonly", true);
      $("#address").val(user.address);
      $("#phone").val(user.phone);
      $('[name="role"]').each(function () {
        if ($(this).val() === user.role) {
          $(this).prop("checked", true);
        } else {
          $(this).prop("checked", false);
        }
      });
      $("#fbtn").val("update");
    },
    error: function (xhr) {
      console.log("ERROR Ajax");
    },
  });
}

function updateProduct(id) {
  const updateElement = document.getElementById("updateHidden");
  updateElement.value = id;
  var path = getContextPath();
  $("#title").text("Cập Nhật Sản Phẩm");
  $("#fbtn").text("Cập Nhật");
  $.ajax({
    url: path + "/manage-product",
    data: {
      id: id,
    },
    type: "get",
    success: function (response) {
      const product = JSON.parse(response);
      $("#category").val(product.category);
      $("#category").prop("disabled", true);
      $("#name").val(product.title);
  	  $("#price").val(product.price);
      $("#discount").val(product.discount);
      $("#description").val(product.description);
      $("#fbtn").val("update");
    },
    error: function (xhr) {
      console.log("ERROR Ajax");
    },
  });
}

function addBlog() {
	$("#title").text("Thêm Bài Viết Mới");
	$("#thumbnail").val("");
	$("#tittle").val("");
	$("#heading1").val("");
	$("#para1").val("");
	$("#heading2").val("");
	$("#para2").val("");
	$("#subthumnial").val("");
	$("#note").val("");

	$("#fbtn").val("add");
	$("#fbtn").text("Thêm");
}

function addUser() {
  $("#title").text("Thêm Người Dùng Mới");
  $("#email").val("");
  $("#email").prop("readonly", false);
  $("#firstName").val("");
  $("#lastName").val("");
  $("#pass").val("");
  $("#pass").prop("readonly", false);
  $("#address").val("");
  $("#phone").val("");
  $('[name="role"]').each(function () {
    $(this).prop("checked", false);
  });
  $('[name="role"]').eq(0).prop("checked", true);
  $("#fbtn").val("add");
  $("#fbtn").text("Thêm");
}

function addProduct() {
  $("#title").text("Thêm Sản phẩm mới");
  $("#category").val("");
  $("#category").prop("disabled", false);
  $("#name").val("");
  $("#price").val("");
  $("#discount").val("");
  $("#thubnail").val("");
  $("#galerry").val("");
  $("#description").val("");
  $("#fbtn").val("add");
  $("#fbtn").text("Thêm");
}

function formatCurrency(amount) {
  // Sử dụng hàm toLocaleString để định dạng số tiền
  return amount.toLocaleString("vi-VN", { style: "currency", currency: "VND" });
}

function formatCurrency(amount) {
    return amount.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
}

function viewOrderDetail(orderId) {
	var path = getContextPath();
	$.ajax({
		url: path + "/my-order",
		data: {
			id: orderId,
		},
		type: "get",
		success: function(response) {
			const orderDetails = JSON.parse(response);
			$("#append-code").html("");
			console.log(orderDetails)
			orderDetails.forEach((detail) => {
				const formattedAmount = formatCurrency(detail.product.discount * detail.quantity); // Format số tiền
				console.log(formattedAmount);
				const appendCode = `
					<div class="row">
									<div class="col">
										<div class="card card-2">
											<div class="card-body">
												<div class="media">
													<div class="sq align-self-center ">
														<img id="thumbnail"
															class="img-fluid  my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0"
															src="${detail.product.thumbnail}" width="135"
															height="135" />
													</div>
													<div class="media-body my-auto text-right">
														<div class="row  my-auto">
															<div class="col-6 m-auto">
																<small>${detail.product.title}</small>
															</div>
															<div class="col-2 my-auto">
																<h6 class="mb-0">SL:${detail.quantity}</h6>
															</div>
															<div class="col-4 my-auto">
																<h6 class="mb-0">${formattedAmount}</h6>
															</div>
														</div>
													</div>
												</div>
												<hr class="my-3 ">
											</div>
										</div>
									</div>
								</div>
				`;		
			$("#append-code").append(appendCode)
			})
		},
		error: function(xhr) {
			console.log("ERROR Ajax");
		},
	});
}

function viewBillDetail(orderId){
	var path = getContextPath();
	$.ajax({
		url: path + "/print-bill",
		data: {
			id: orderId,
		},
		type: "get",
		success: function(response) {
			const details = JSON.parse(response);
			console.log(details);
			$("#append-code").html("");
			details.forEach((detail) => {
				const formattedAmount = formatCurrency(detail.product.discount * detail.quantity); // Format số tiền 
				console.log(formattedAmount); 
				const append = `
				<div class="row">
									<div class="col">
										<div class="card card-2">
											<div class="card-body">
												<div class="media">
													<div class="sq align-self-center ">
														<img id="thumbnail"
															class="img-fluid  my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0"
															src="${detail.product.thumbnail}" width="135"
															height="135" />
													</div>
													<div class="media-body my-auto text-right">
														<div class="row  my-auto">
															<div class="col-6 m-auto">
																<small>${detail.product.title}</small>
															</div>
															<div class="col-2 my-auto">
																<h6 class="mb-0">SL:${detail.quantity}</h6>
															</div>
															<div class="col-4 my-auto">
																<h6 class="mb-0">${formattedAmount}</h6>
															</div>
														</div>
													</div>
												</div>
												<hr class="my-3 ">
											</div>
										</div>
									</div>
								</div>
			`;
			$("#append-code").append(append)
			})
		},
		error: function(xhr) {
			console.log("ERROR Ajax");
		},
	});
}

// Order Management -  Admin
function cancelOrder(orderId){
	const orderIdElement = document.getElementById("orderId");
	orderIdElement.value = orderId;
}


function queryChart(){
	var path = getContextPath();
	$.ajax({
		url: path + "/admin-home",
		data: {
		},
		type: "post",
		success: function(response) {
			const chart = JSON.parse(response);
			myChart.data.labels = Object.keys(chart);
			myChart.data.datasets[0].data = Object.values(chart);
			myChart.update();
		},
		error: function(xhr) {
			console.log("ERROR Ajax");
		},
	});
}