<%@page import="com.getDoctors.model.skills"%>
<%@page import="com.getDoctors.dao.skilldao"%>
<%@page import="com.getDoctors.model.disease"%>
<%@page import="java.util.List"%>
<%@page import="com.getDoctors.dao.diseasedao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Skills</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="../../assests/css/adminStyle.css">
<link rel="stylesheet" href="../../assests/css/table.css">


</head>
<body>
	<jsp:include page="../../components/sidebar.jsp"></jsp:include>

	<!-- NAVBAR -->
	<section id="content">

		<jsp:include page="../../components/navbar.jsp"></jsp:include>
		<!-- MAIN -->
		<main>
			<h1 class="title">Skills</h1>
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="divider">/</li>
				<li><a href="#" class="active">Skills</a></li>
			</ul>

			<div class="data">
				<div class="content-data">
					<div class="head">
						<h3>All Skill</h3>

					</div>
					<div>

						<table id="customers">
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Action</th>
							</tr>
							<tbody>
								<%
								skilldao ddao = new skilldao();
								int drid = Integer.parseInt(request.getParameter("drid"));
								List<skills> ds = ddao.doctorSkills(drid);

								for (skills dr : ds) {
								%>
								<tr>
									<td><%=dr.getSkill_id()%></td>
									<td><%=dr.getSkill_name()%></td>
									<td>
										<div class="head">


											<div class="menu">
												<i class='bx bx-dots-horizontal-rounded icon'></i>
												<ul class="menu-link">
													<li><a href="edit?id=<c:out value='${user.id}'/>">Edit</a></li>
													<li><a href="delete?id=<c:out value='${user.id}'/>">Delete</a></li>
												</ul>
											</div>
										</div>
									</td>
								</tr>
								<%
								}
								%>

							</tbody>


						</table>
					</div>
				</div>
				<div class="content-data">
					<div class="head">
						<h3>Add Skill</h3>
					</div>

					<% String id = request.getParameter("drid"); %>
					<form action="../../skill?drid=<%=id %>" method="post">
						<div class="form-group" style="display: block;">
							<div style="margin: 10px 0;">
								<label for="diseaseName" class="col-form-label">Enter
									Skill Name</label>
							</div>
							<div style="margin: 10px 0;">
								<input type="text" id="diseaseName" class="form-control"
									placeholder="Enter Skill Name" name="skill">
							</div>
							<div style="margin: 10px 0;">
								<button type="submit" class="btn btn-primary btn-send" style="padding:10px 50px;">
									Add Skill
								</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- NAVBAR -->
	<script type="text/javascript" src="../../assests/js/script.js"></script>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

</body>
</html>