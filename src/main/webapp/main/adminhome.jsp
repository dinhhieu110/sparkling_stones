<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang chủ Admin</title>
<%@include file="/common/head.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
<style>
body {
	background-color: #fbfbfb;
}
</style>
</head>
<body>

	<!--Main Navigation-->
	<%@include file="/common/adminheader.jsp"%>
	<!--Main layout-->
	<main style="margin-top: 58px">
		<div class="container pt-4">
			<!-- Section: Main chart -->
			<section class="mb-4">
				<div class="card">
					<div class="card-header py-3">
						<h5 class="mb-0 text-center">
							<strong>DOANH SỐ BÁN HÀNG</strong>
						</h5>
					</div>
					<div class="card-body">
						<div class="chartjs-size-monitor">
							<div class="chartjs-size-monitor-expand">
								<div class=""></div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class=""></div>
							</div>
						</div>
						<canvas class="my-4 w-100 chartjs-render-monitor" id="myChart"
							height="216" width="466"
							style="display: block; width: 233px; height: 108px;"></canvas>
					</div>
				</div>
			</section>
			<!-- Section: Main chart -->

			<!--Section: Sales Performance KPIs-->
			<section class="mb-4">
				<div class="card">
					<div class="card-header text-center py-3">
						<h5 class="mb-0 text-center">
							<strong>HIỆU SUẤT BÁN HÀNG KPIs</strong>
						</h5>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">Lượt xem chi tiết sản phẩm</th>
										<th scope="col">Mua hàng độc lập</th>
										<th scope="col">Số lượng</th>
										<th scope="col">Doanh thu sản phẩm</th>
										<th scope="col">Giá trung bình</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Giá trị</th>
										<td>18,492</td>
										<td>228</td>
										<td>350</td>
										<td>$4,787.64</td>
										<td>$13.68</td>
									</tr>
									<tr>
										<th scope="row">Tỉ lệ thay đổi</th>
										<td><span class="text-danger"> <i
												class="fas fa-caret-down me-1"></i><span>-48.8%%</span>
										</span></td>
										<td><span class="text-success"> <i
												class="fas fa-caret-up me-1"></i><span>14.0%</span>
										</span></td>
										<td><span class="text-success"> <i
												class="fas fa-caret-up me-1"></i><span>46.4%</span>
										</span></td>
										<td><span class="text-success"> <i
												class="fas fa-caret-up me-1"></i><span>29.6%</span>
										</span></td>
										<td><span class="text-danger"> <i
												class="fas fa-caret-down me-1"></i><span>-11.5%</span>
										</span></td>
									</tr>
									<tr>
										<th scope="row">Thay đổi tuyệt đối</th>
										<td><span class="text-danger"> <i
												class="fas fa-caret-down me-1"></i><span>-17,654</span>
										</span></td>
										<td><span class="text-success"> <i
												class="fas fa-caret-up me-1"></i><span>28</span>
										</span></td>
										<td><span class="text-success"> <i
												class="fas fa-caret-up me-1"></i><span>111</span>
										</span></td>
										<td><span class="text-success"> <i
												class="fas fa-caret-up me-1"></i><span>$1,092.72</span>
										</span></td>
										<td><span class="text-danger"> <i
												class="fas fa-caret-down me-1"></i><span>$-1.78</span>
										</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
			<!--Section: Sales Performance KPIs-->

			<!--Section: Minimal statistics cards-->
			<section>
				<div class="row">
					<div class="col-xl-3 col-sm-6 col-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between px-md-1">
									<div>
										<h4 class="text-success">${totalUser}</h4>
										<p class="text-success mb-0">Total Users</p>
									</div>
									<div class="align-self-center">
										<i class="far fa-user text-success fa-3x"></i>
									</div>
								</div>
								<div class="px-md-1">
									<div class="progress mt-3 mb-1 rounded" style="height: 7px">
										<div class="progress-bar bg-info" role="progressbar"
											style="width: 80%" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between px-md-1">
									<div>
										<h4 class="text-info">${totalProduct}</h4>
										<p class="mb-0">Total Products</p>
									</div>
									<div class=" fs-2 align-self-center">
										<i class="fa fa-diamond"  text-success fa-3x aria-hidden="true"></i>
									</div>
								</div>
								<div class="px-md-1">
									<div class="progress mt-3 mb-1 rounded" style="height: 7px">
										<div class="progress-bar bg-info" role="progressbar"
											style="width: 80%" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between px-md-1">
									<div>
										<h4 class="text-warning">156</h4>
										<p class="mb-0">Current Comments</p>
									</div>
									<div class="align-self-center">
										<i class="far fa-comments text-warning fa-3x"></i>
									</div>
								</div>
								<div class="px-md-1">
									<div class="progress mt-3 mb-1 rounded" style="height: 7px">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 35%" aria-valuenow="35" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between px-md-1">
									<div>
										<h4 class="text-danger">423</h4>
										<p class="mb-0">Total Visits</p>
									</div>
									<div class="align-self-center">
										<i class="fas fa-map-signs text-danger fa-3x"></i>
									</div>
								</div>
								<div class="px-md-1">
									<div class="progress mt-3 mb-1 rounded" style="height: 7px">
										<div class="progress-bar bg-danger" role="progressbar"
											style="width: 40%" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-3 col-sm-6 col-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between px-md-1">
									<div class="align-self-center">
									<i class="fa-solid fa-money-bill text-info fa-3x"></i>
									</div>
									<div class="text-end">
										<h4>6,605,031,126₫</h4>
										<p class="mb-0">Capital</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between px-md-1">
									<div class="align-self-center">
										<i class="far fa-comment-alt text-warning fa-3x"></i>
									</div>
									<div class="text-end">
										<h4>34</h4>
										<p class="mb-0">New Comments</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between px-md-1">
									<div class="align-self-center">
										<i class="fas fa-chart-line text-success fa-3x"></i>
									</div>
									<div class="text-end">
										<h4>74.89 %</h4>
										<p class="mb-0">Sale Rate</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 col-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between px-md-1">
									<div class="align-self-center">
										<i class="fas fa-map-marker-alt text-danger fa-3x"></i>
									</div>
									<div class="text-end">
										<h4>423</h4>
										<p class="mb-0">Total Visits</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</section>
			<!--Section: Minimal statistics cards-->

			<!--Section: Statistics with subtitles-->
			<section>
				<div class="row">
					<div class="col-xl-6 col-md-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between p-md-1">
									<div class="d-flex flex-row">
										<div class="align-self-center">
										<i class="far fa-user text-info fa-3x me-4"></i>
										</div>
										<div>
											<h4>Tổng số người dùng</h4>
											<p class="mb-0">Current Users</p>
										</div>
									</div>
									<div class="align-self-center">
										<h2 class="h1 mb-0">${totalUser}</h2>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-md-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between p-md-1">
									<div class="d-flex flex-row">
										<div class="align-self-center">
										<i class="fa-solid fa-money-bill text-warning fa-3x me-4"></i>
										</div>
										<div>
											<h4>Tổng tài sản</h4>
											<p class="mb-0">Total Asset</p>
										</div>
									</div>
									<div class="align-self-center">
										<h4 class="card-title currency-style m-4"><fmt:formatNumber
												value="${totalSpend}" type="currency" pattern="#,##0₫"/></h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-6 col-md-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between p-md-1">
									<div class="d-flex flex-row">
										<div class="align-self-center">
											<h4 class="card-title currency-style m-4"><fmt:formatNumber
												value="${income}" type="currency" pattern="#,##0₫"/></h4>
										</div>
										<div>
											<h4>Tổng thu nhập</h4>
											<p class="mb-0">Total Income</p>
										</div>
									</div>
									<div class="align-self-center">
										<i class="far fa-heart text-danger fa-3x"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-md-12 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="d-flex justify-content-between p-md-1">
									<div class="d-flex flex-row">
										<div class="align-self-center">
											<h4 class="card-title currency-style m-4"><fmt:formatNumber
												value="${income *(10/100)}" type="currency" pattern="#,##0₫"/></h4>
										</div>
										<div>
											<h4>Total Cost</h4>
											<p class="mb-0">Cost amount</p>
										</div>
									</div>
									<div class="align-self-center">
										<i class="fas fa-wallet text-success fa-3x"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--Section: Statistics with subtitles-->
		</div>
	</main>
	<!--Main layout-->
	<%@include file="/common/script.jsp"%>
	<script>
		// Graph
		var ctx = document.getElementById("myChart");

		var myChart = new Chart(ctx, {
			type : "line",
			data : {
				labels : [],
				datasets : [ {
					data : [],
					lineTension : 0,
					backgroundColor : "transparent",
					borderColor : "#007bff",
					borderWidth : 4,
					pointBackgroundColor : "#007bff",
				}, ],
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : false,
						},
					}, ],
				},
				legend : {
					display : false,
				},
			},
		});
		queryChart();
	</script>
</body>
</html>