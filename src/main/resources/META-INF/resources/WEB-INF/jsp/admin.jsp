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
<body onload="load()">
<form method="POST" action="${baseURL}/admin?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" id="divdata">	
<div class="generic-container">
		<div class="panel panel-default" >
			  <!-- Default panel contents -->
		  	<div class="panel-heading"><span class="lead">List of Documents </span></div>
		  	<div class="form-group col-md-12">
			<label class="col-md-1 control-lable" for="file">CATEGORY</label>
			<input type="hidden" id="textArea" name="textArea" value="${textArea}">
			<div class="col-md-3">
				<select id="category" name = "category" var ="category" class="form-control input-sm" >
					<option hide>--Select a Category--</option> 
					<option value="HOME">HOME</option>
					<option value="ICSSE">ICSSE</option>
					<option value="HCMUTE">HCMUTE</option>
					<option value="COMMITTEES">COMMITTEES</option>
					<option value="CALL FOR PAPERS">CALL FOR PAPERS</option>
					<option value="SUBMISSION">SUBMISSION</option>
					<option value="REGISTRATION">REGISTRATION</option>
					<option value="KEYNOTE SPEAKERS">KEYNOTE SPEAKERS</option>
					<option value="PROGRAM">PROGRAM</option>
					<option value="VENUE & HOTEL">VENUE & HOTEL</option>
					<option value="CONTACT">CONTACT</option>
					<option value="important_deadlines">IMPORTANT_DEADLINES</option>
					<option value="special_session">SPECIAL_SESSION</option>
					<option value="key_links">KEY_LINKS</option>
					
				</select>
				
			</div>
				<input type = "submit" value="Search" class="btn btn-success custom-width">
				<td><a onclick="goAddPage()" class="btn btn-success custom-width">Add News</a></td>			
			</div>
		  	
		  	<div class="tablecontainer">
				<table class="table table-hover">
		    		<thead>
			      		<tr>
			      			<th>Id</th>
					        <th>Title</th>
					        <th>Category</th>
					        <th>Date</th>
					        <th>Status</th>
					        <th width="100"></th>
					        <th width="100"></th>
					        <th width="100"></th>
						</tr>
			    	</thead>
		    		<tbody>
					<c:forEach items="${documents}" var="doc" varStatus="counter">
						<tr>
							<td>${doc.id}</td>
							<td>${doc.description}</td>
							<td>${doc.category}</td>
							<td>${doc.datetime}</td>
							<td>${doc.status}</td>
							
							<td><a href="<c:url value='/admin/view-document-${doc.id}' />" class="btn btn-success custom-width">view</a></td>
							
							<td><a href="<c:url value='/admin/show-${doc.id}' />" class="btn btn-success custom-width">show</a></td>
							<td><a href="<c:url value='/admin/delete-document-${doc.id}' />" class="btn btn-danger custom-width">delete</a></td>
						</tr>
					</c:forEach>
		    		</tbody>
		    	</table>
		    </div>
		</div>
		</form>
<form method="POST" action="${baseURL}/admin/edit?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" id="divdata">
		<div class="panel panel-default">
			
			<div class="panel-heading"><span class="lead">Upload News</span></div>
			<div class="uploadcontainer">
				<form enctype="multipart/form-data" class="form-horizontal">
			
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">Upload a document</label>
							<div class="col-md-7">
								<input type="file"  onchange='openFile(event)' path="file" id="file" class="form-control input-sm"/>
								<div class="has-error">
									<errors path="file" class="help-inline"/>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">Description</label>
							<div class="col-md-7">
								<input type="text" path="description" id="description" name="description" class="form-control input-sm"/>
							</div>
							
						</div>
					</div>
			
					<div class="row">
						<textArea id="body" style="display:none;" name="body">
	 					</textArea>
						<div class="form-actions floatRight">
							<input type="submit" value="Upload" class="btn btn-primary btn-sm">
						</div>
					</div>
	
				</form>
				</div>
		</div>
		<div class="well">
	 		Go to <a href="<c:url value='/admin/user_list' />">Manage user</a>
	 	</div>
	 	<div class="well">
	 		Go to <a href="<c:url value='/' />">Home</a>
	 	</div>
   	</div>
</form>
</body>
</html>