<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
										<th scope="col">Product Detail Views</th>
										<th scope="col">Unique Purchases</th>
										<th scope="col">Quantity</th>
										<th scope="col">Product Revenue</th>
										<th scope="col">Avg. Price</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Value</th>
										<td>18,492</td>
										<td>228</td>
										<td>350</td>
										<td>$4,787.64</td>
										<td>$13.68</td>
									</tr>
									<tr>
										<th scope="row">Percentage change</th>
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
										<th scope="row">Absolute change</th>
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
									<div class="align-self-center">
										<i class="fas fa-pencil-alt text-info fa-3x"></i>
									</div>
									<div class="text-end">
										<h3>278</h3>
										<p class="mb-0">New Posts</p>
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
										<h3>156</h3>
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
										<h3>64.89 %</h3>
										<p class="mb-0">Bounce Rate</p>
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
										<h3>423</h3>
										<p class="mb-0">Total Visits</p>
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
									<div>
										<h3 class="text-danger">278</h3>
										<p class="mb-0">New Projects</p>
									</div>
									<div class="align-self-center">
										<i class="fas fa-rocket text-danger fa-3x"></i>
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
										<h3 class="text-success">156</h3>
										<p class="mb-0">New Clients</p>
									</div>
									<div class="align-self-center">
										<i class="far fa-user text-success fa-3x"></i>
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
										<h3 class="text-warning">64.89 %</h3>
										<p class="mb-0">Conversion Rate</p>
									</div>
									<div class="align-self-center">
										<i class="fas fa-chart-pie text-warning fa-3x"></i>
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
										<h3 class="text-info">423</h3>
										<p class="mb-0">Support Tickets</p>
									</div>
									<div class="align-self-center">
										<i class="far fa-life-ring text-info fa-3x"></i>
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
									<div>
										<h3 class="text-info">278</h3>
										<p class="mb-0">New Posts</p>
									</div>
									<div class="align-self-center">
										<i class="fas fa-book-open text-info fa-3x"></i>
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
										<h3 class="text-warning">156</h3>
										<p class="mb-0">New Comments</p>
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
										<h3 class="text-success">64.89 %</h3>
										<p class="mb-0">Bounce Rate</p>
									</div>
									<div class="align-self-center">
										<i class="fas fa-mug-hot text-success fa-3x"></i>
									</div>
								</div>
								<div class="px-md-1">
									<div class="progress mt-3 mb-1 rounded" style="height: 7px">
										<div class="progress-bar bg-success" role="progressbar"
											style="width: 60%" aria-valuenow="60" aria-valuemin="0"
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
										<h3 class="text-danger">423</h3>
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
											<i class="fas fa-pencil-alt text-info fa-3x me-4"></i>
										</div>
										<div>
											<h4>Total Posts</h4>
											<p class="mb-0">Monthly blog posts</p>
										</div>
									</div>
									<div class="align-self-center">
										<h2 class="h1 mb-0">18,000</h2>
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
											<i class="far fa-comment-alt text-warning fa-3x me-4"></i>
										</div>
										<div>
											<h4>Total Comments</h4>
											<p class="mb-0">Monthly blog posts</p>
										</div>
									</div>
									<div class="align-self-center">
										<h2 class="h1 mb-0">84,695</h2>
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
											<h2 class="h1 mb-0 me-4">$76,456.00</h2>
										</div>
										<div>
											<h4>Total Sales</h4>
											<p class="mb-0">Monthly Sales Amount</p>
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
											<h2 class="h1 mb-0 me-4">$36,000.00</h2>
										</div>
										<div>
											<h4>Total Cost</h4>
											<p class="mb-0">Monthly Cost</p>
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
	<script>
		// Graph
		var ctx = document.getElementById("myChart");

		var myChart = new Chart(ctx, {
			type : "line",
			data : {
				labels : [ "Sunday", "Monday", "Tuesday", "Wednesday",
						"Thursday", "Friday", "Saturday", ],
				datasets : [ {
					data : [ 15339, 21345, 18483, 24003, 23489, 24092, 12034 ],
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
	</script>
		<%@include file="/common/script.jsp"%>
</body>
</html>