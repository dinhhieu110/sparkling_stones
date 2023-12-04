<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>${product.title}|SparklingStones</title>
<%@include file="/common/head.jsp"%>
<style>
.swiper-slide {
	height: 100%;
}

.swiper-slide>div {
	padding-bottom: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: 100%;
	background-color: transparent;
	border: 1px solid #ccc;
	border-radius: 8px;
}

.swiper-slide-thumb-active {
	overflow: hidden;
}

.swiper-slide-thumb-active::before {
	content: "";
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: 1;
	background-color: rgba(0, 0, 0, 0.25);
}

/* Toast style*/
#toast{
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 15px;
	text-align: center;
	z-index: 1;
	font: 18px;
	visibility: hidden;
	color: white;
}

#toast.display{
	visibility: visible;
	animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {
	from {
		bottom: 0;
		opacity: 0;
	}
	to {
		bottom: 30px;
		opacity: 1;
	}
}
@keyframes fadeOut {
	from{
		bottom: 30px;
		opacity: 1;
	}
	to {
		bottom: 0;
		opacity: 0;
	}
}
</style>
</head>
<body>
	<%@include file="/common/header.jsp"%>
	<!-- Heading -->
	<div class="bg-primary">
		<div class="container py-4">
			<!-- Breadcrumb -->
			<nav class="d-flex">
				<h6 class="mb-0">
					<a href="" class="text-white-50">Trang Chủ</a> <span
						class="text-white-50 mx-2"> > </span> <a href="list"
						class="text-white-50">Thư Viện</a> <span
						class="text-white-50 mx-2"> > </span> <a href=""
						class="text-white">${product.title}</a>
				</h6>
			</nav>
			<!-- Breadcrumb -->
		</div>
	</div>
	<!-- Heading -->

	<!-- content -->
	<section class="py-5">
		<div class="container">
			<div class="row gx-5">
				<aside class="col-lg-6">
					<div class="swiper mySwiper2">
						<div class="swiper-wrapper" style="height: 100%">
							<div class="swiper-slide">
								<div style="background-image: url('${product.thumbnail}')"></div>
							</div>
							<c:forEach items="${product.gallery.array}" var="image">
								<div class="swiper-slide">
									<div style="background-image: url('${image}')"></div>
								</div>
							</c:forEach>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
					<div class="swiper mySwiper mt-2">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div style="background-image: url('${product.thumbnail}')"></div>
							</div>
							<c:forEach items="${product.gallery.array}" var="image">
								<div class="swiper-slide">
									<div style="background-image: url('${image}')"></div>
								</div>
							</c:forEach>
						</div>
					</div>

				</aside>
				<main class="col-lg-6">
					<div class="ps-lg-3">
						<h4 class="title text-dark">${product.title}</h4>
						<div class="d-flex flex-row my-3">
							<div class="text-warning mb-1 me-2">
								<c:if test="${product.rating > 0}">
									<c:forEach begin="1" end="5" varStatus="star">
										<c:choose>
											<c:when test="${product.rating >= star.count}">
												<i class="fas fa-star"></i>
											</c:when>
											<c:when
												test="${product.rating < star.count and product.rating > star.count - 1}">
												<i class="fas fa-star-half-alt"></i>
											</c:when>
											<c:otherwise>
												<i class="far fa-star"></i>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
								<span class="ms-1">${product.rating > 0 ? product.rating : "Chưa có đánh giá nào"}</span>
							</div>
							<span class="text-muted"><i
								class="fas fa-shopping-basket fa-sm mx-1"></i>154 orders</span> <span
								class="text-success ms-2">In stock</span>
						</div>

						<div class="mb-3">
							<span class="h5"><fmt:formatNumber type="currency"
									value="${product.discount}" pattern="#,###₫" /></span> <span
								class="text-muted">/sản phẩm</span>
						</div>

						<p>${product.description}</p>

						<div class="row">
							<dt class="col-3">Trọng lượng</dt>
							<dd class="col-9">14.35 phân</dd>

							<dt class="col-3">Loại đá chính</dt>
							<dd class="col-9">Đính đá Topaz</dd>

							<dt class="col-3">Loại đá phụ</dt>
							<dd class="col-9">Không gắn đá</dd>

							<dt class="col-3">Thương Hiệu</dt>
							<dd class="col-9">TDH</dd>
						</div>

						<hr />

						<div class="row mb-4">
							<!-- col.// -->
							<div class="col-md-4 col-6 mb-3">
								<label class="mb-2 d-block">Quantity</label>
								<div class="input-group mb-3" style="width: 170px;">
									<button class="btn btn-white border border-secondary px-3"
										type="button" data-action="descrease"
										onClick="changeQuantity(this)" data-mdb-ripple-color="dark">
										<i class="fas fa-minus"></i>
									</button>
									<input type="number" min="1" step="1" id="quantity"
										class="form-control text-center border border-secondary"
										value="1" aria-label="Example text with button addon" />
									<button class="btn btn-white border border-secondary px-3"
										type="button" data-action="increase"
										onClick="changeQuantity(this)" id="button-addon2"
										data-mdb-ripple-color="dark">
										<i class="fas fa-plus"></i>
									</button>
								</div>
							</div>
						</div>
						<!--  <a href="#" class="btn btn-warning shadow-0"> MUA NGAY </a> -->
						<a href="#!" class="btn btn-primary shadow-0" onclick="addToCart(event, '${product.id}')"> 
							<i class="me-1 fa fa-shopping-basket"></i> THÊM VÀO GIỎ HÀNG
						</a> 
					</div>
				</main>
			</div>
		</div>
	</section>
	<!-- content -->

	<section class="bg-light border-top py-4">
		<div class="container">
			<div class="row gx-4">
				<div class="col-lg-8 mb-4">
					<div class="border rounded-2 px-3 py-2 bg-white">
						<!-- Pills navs -->
						<ul class="nav nav-pills nav-justified mb-3" id="ex1"
							role="tablist">
							<li class="nav-item d-flex" role="presentation"><a
								class="nav-link d-flex align-items-center justify-content-center w-100 active"
								id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1"
								role="tab" aria-controls="ex1-pills-1" aria-selected="true">ĐẶC
									TẢ</a></li>	
							<li class="nav-item d-flex" role="presentation"><a
								class="nav-link d-flex align-items-center justify-content-center w-100"
								id="ex1-tab-3" data-mdb-toggle="pill" href="#ex1-pills-3"
								role="tab" aria-controls="ex1-pills-3" aria-selected="false">DỊCH
									VỤ SAU MUA </a></li>
							<li class="nav-item d-flex" role="presentation"><a
								class="nav-link d-flex align-items-center justify-content-center w-100"
								id="ex1-tab-4" data-mdb-toggle="pill" href="#ex1-pills-4"
								role="tab" aria-controls="ex1-pills-4" aria-selected="false">CÂU
									HỎI THƯỜNG GẶP </a></li>
							<li class="nav-item d-flex" role="presentation"><a
								class="nav-link d-flex align-items-center justify-content-center w-100"
								id="ex1-tab-2" data-mdb-toggle="pill" href="#ex1-pills-2"
								role="tab" aria-controls="ex1-pills-2" aria-selected="false">ĐÁNH
									GIÁ </a></li>
						</ul>
						<!-- Pills navs -->

						<!-- Pills content -->
						<div class="tab-content" id="ex1-content">
							<div class="tab-pane fade show active" id="ex1-pills-1"
								role="tabpanel" aria-labelledby="ex1-tab-1">
								<p>Hãy khám phá và để những thiết kế rực rỡ đầy màu sắc của
									truyền cảm hứng cho bạn kể câu chuyện mang đậm chất riêng của
									mình một cách đầy thú vị. Sở hữu thiết kế độc đáo với những
									điểm nhấn đá đầy màu sắc lấp lánh, chiếc nhẫn bạc STYLE By PNJ
									sẽ tôn lên vẻ đẹp cá tính và tinh tế của nàng xinh.</p>
								<div class="row mb-2">
									<div class="col-12 col-md-6">
										<ul class="list-unstyled mb-0">
											<li><i class="fas fa-check text-success me-2"></i>Những
												điểm nhấn sẽ được tạo ra</li>
											<li><i class="fas fa-check text-success me-2"></i>Xây
												dựng nên vẻ đẹp của bạn</li>
											<li><i class="fas fa-check text-success me-2"></i>Tỏa
												sáng ở mọi góc cạnh</li>
											<li><i class="fas fa-check text-success me-2"></i>Không
												thể nhầm lẫn với mạ vàng thông thường</li>
										</ul>
									</div>
									<div class="col-12 col-md-6 mb-0">
										<ul class="list-unstyled">
											<li><i class="fas fa-check text-success me-2"></i>Dễ
												dàng phối đồ</li>
											<li><i class="fas fa-check text-success me-2"></i>Đại
												diện cho sự hiện đại</li>
											<li><i class="fas fa-check text-success me-2"></i>Điểm
												nhấn cho sự sang trọng</li>
										</ul>
									</div>
								</div>
								<!-- 
								<dt class="col-3">Trọng lượng</dt>
							<dd class="col-9">14.35 phân</dd>

							<dt class="col-3">Loại đá chính</dt>
							<dd class="col-9">Không gắn đá</dd>

							<dt class="col-3">Loại đá phụ</dt>
							<dd class="col-9">Không gắn đá</dd>

							<dt class="col-3">Thương Hiệu</dt>
							<dd class="col-9">TDH</dd>
								 -->
								<table class="table border mt-3 mb-2">
									<tr>
										<th class="py-2">Trọng lượng:</th>
										<td class="py-2">14.35 phân</td>
									</tr>
									<tr>
										<th class="py-2">Loại đá chính:</th>
										<td class="py-2">Đính đá Topaz </td>
									</tr>
									<tr>
										<th class="py-2">Loại đá phụ</th>
										<td class="py-2">Không gắn đá</td>
									</tr>
									<tr>
										<th class="py-2">Thương hiệu</th>
										<td class="py-2">TDH</td>
									</tr>
									<tr>
										<th class="py-2">Nguyên liệu</th>
										<td class="py-2">Vàng, Kim cương</td>
									</tr>
								</table>
							</div>
							<div class="tab-pane fade mb-2" id="ex1-pills-2" role="tabpanel"
								aria-labelledby="ex1-tab-2">
								<h4>VIẾT BÌNH LUẬN CỦA BẠN</h4>
								<div class="form-outline mb-4">
									<textarea class="form-control" id="form4Example3" rows="2"></textarea>
									<label class="form-label" for="form4Example3">Bình luận</label>
								</div>
								<h4>ĐÁNH GIÁ TỪ NGƯỜI DÙNG</h4>
								<c:if test="${reviews.size() > 0}">
									<c:forEach items="${reviews}" var="review">
										<div class="card mb-3">
											<div class="card-body">
												<h5 class="card-title">${review.name}
													<span class="text-muted mini-text"><fmt:formatDate
															value="${review.createdAt}" pattern="yyyy-MM-dd HH:mm" /></span>
												</h5>
												<p class="card-subtitle text-warning">
													<c:forEach begin="1" end="${review.rating}">
														<i class="fas fa-star"></i>
													</c:forEach>
													<c:forEach begin="${review.rating + 1}" end="5">
														<i class="far fa-star"></i>
													</c:forEach>
												</p>
												<p class="card-text">${review.comment}</p>
												<c:if test="${review.response != null}">
													<div class="response-box">
														<p class="fw-bold">Response from Sparkling Stones</p>
														<p class="mb-0">${review.response}</p>
													</div>
												</c:if>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${reviews.size() == 0}">Hiện tại, chưa có đánh giá nào cho sản phẩm này</c:if>
							</div>
							<div class="tab-pane fade mb-2" id="ex1-pills-3" role="tabpanel"
								aria-labelledby="ex1-tab-3">
								<div class="row mb-2">
									<div class="col-12 col-md-6">
										<ul class="list-unstyled mb-0">
											<li><i class="fas fa-check text-success me-2"></i>Chỉ
												bảo hành các sản phẩm thuộc hệ thống cửa hàng kênh lẻ và
												online của Sparkling Stones. ​</li>
											<li><i class="fas fa-check text-success me-2"></i>Chế độ
												bảo hành sản phẩm có thể thay đổi theo chính sách</li>
											<li><i class="fas fa-check text-success me-2"></i>Bảo
												hành miễn phí 3 tháng</li>
										</ul>
									</div>
									<div class="col-12 col-md-6 mb-0">
										<ul class="list-unstyled">

											<li><i class="fas fa-check text-success me-2"></i>Siêu
												âm trọn đời bằng máy chuyên dụng</li>
											<li><i class="fas fa-check text-success me-2"></i>Thay
												miễn phí đá CZ ​</li>
											<li><i class="fas fa-check text-success me-2"></i>Thay
												miễn phí đá tổng hợp ​</li>
											<li><i class="fas fa-check text-success me-2"></i>Siêu
												âm trọn đời bằng máy chuyên dụng</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="tab-pane fade mb-2" id="ex1-pills-4" role="tabpanel"
								aria-labelledby="ex1-tab-4">
								<h4>Mua Online có ưu đãi gì đặc biệt cho tôi?</h4>
								<p style="font-weight: 300">
									Sparkling Stones mang đến nhiều trải nghiệm mua sắm hiện đại khi mua Online:
									<br> - Ưu đãi độc quyền Online với hình thức thanh toán đa
									dạng. <br> - Đặt giữ hàng Online, nhận tại cửa hàng. <br>
									- Miễn phí giao hàng từ 1-7 ngày trên toàn quốc và giao hàng
									trong 3 giờ tại một số khu vực trung tâm với các sản phẩm có
									gắn nhãn <br> - Trả góp 0% lãi suất với đơn hàng từ 3
									triệu. <br>
								</p>
								<h4>Sparkling Stones có thu mua lại trang sức không?</h4>
								<p style="font-weight: 300">Sparkling Stones có dịch vụ thu đổi trang sức
									Sparkling Stones tại hệ thống cửa hàng trên toàn quốc.</p>
								<h4>Nếu đặt mua Online mà sản phẩm không đeo vừa thì có
									được đổi không?</h4>
								<p style="font-weight: 300">Sparkling Stones có chính sách thu đổi trang
									sức vàng trong vòng 48 giờ, đổi ni/ size trang sức bạc trong
									vòng 72 giờ. Quý khách sẽ được áp dụng đổi trên hệ thống Sparkling Stones
									toàn quốc.</p>
							</div>
						</div>
						<!-- Pills content -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="px-0 border rounded-2 shadow-0">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Những sản phẩm mới khác</h5>
								<c:forEach items="${otherP}" var ="o">
								<div class="d-flex mb-3">
									<a href="detail?id=${o.id}" class="me-3"> <img
										src="${o.thumbnail}"
										style="min-width: 96px; height: 96px;"
										class="img-md img-thumbnail" />
									</a>
									<div class="info">
										<a href="detail?id=${o.id}" class="nav-link mb-1"> ${o.title}
										</a> <strong class="text-dark"><fmt:formatNumber value="${o.discount}" type="currency"
										pattern="#,##0₫" /></strong>
									</div>
								</div>
								</c:forEach>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Toast -->
	<div id="toast">This is toast text</div>
	<%@include file="/common/footer.jsp"%>

	<%@include file="/common/script.jsp"%>

	<script>
		var swiper = new Swiper(".mySwiper", {
			loop : true,
			spaceBetween : 10,
			slidesPerView : 4,
			freeMode : true,
			watchSlidesProgress : true,
		});
		var swiper2 = new Swiper(".mySwiper2", {
			loop : true,
			spaceBetween : 10,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
			thumbs : {
				swiper : swiper,
			},
		});
	</script>
</body>
</html>