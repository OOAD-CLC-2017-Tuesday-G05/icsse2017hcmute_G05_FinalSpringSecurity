<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage News</title>
	<link href="/resources/CSS/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="/resources/CSS/app.css" rel="stylesheet" type="text/css" />
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<script>

	function goAddPage() {
		window.location.href="/admin/add-"+document.getElementById("category").value.toLowerCase();
	}
	function load() {
		document.getElementById("category").value = document.getElementById("textArea").value
	}
	
	</script>
	<script type="text/javascript">
		var openFile = function(event) {
			if (CKEDITOR.instances['body']) {
				CKEDITOR.instances['body'].destroy();	
			}
		    var input = event.target;
			var body = document.getElementById('body');
			body.value = "";
		    var reader = new FileReader();
		    reader.onload = function(){
		      var text = reader.result;
		      body.value = reader.result;
		    };
		    reader.readAsText(input.files[0]);
		    CKEDITOR.replace('body');
	  	};
	  	
	</script>	
</head>
<body>
<form method="POST" action="${baseURL}/admin/edit?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" id="divdata">
<div class="generic-container">
		<div class="panel panel-default" >
			  <!-- Default panel contents -->
		  	<div class="panel-heading"><span class="lead">List of Users </span></div>
		  	<div class="tablecontainer">
				<table class="table table-hover">
		    		<thead>
			      		<tr>
			      			<th>Id</th>
					        <th>Email</th>
					        <th>Admin</th>
					        <th width="100"></th>
					        <th width="100"></th>
					        <th width="100"></th>
					        
						</tr>
			    	</thead>
		    		<tbody>
					<c:forEach items="${users}" var="user" varStatus="counter">
						<tr>
							<td>${user.id}</td>
							<td>${user.email}</td>
							<td>${user.admin}</td>
							<td><a href="<c:url value='/admin/user_list/setrole-${user.id}' />" class="btn btn-success custom-width">admin</a></td>
							<td><a href="<c:url value='/admin/user_list/deleterole-${user.id}' />" class="btn btn-danger custom-width">delete role</a></td>
							<td><a href="<c:url value='/admin/user_list/deleteuser-${user.id}' />" class="btn btn-danger custom-width">delete user</a></td>
						</tr>
					</c:forEach>
		    		</tbody>
		    	</table>
		    </div>
		</div>
	 	<div class="well">
	 		Go to <a href="<c:url value='/admin' />">Manage News</a>
	 	</div>
   	</div>
</form>
</body>
</html>