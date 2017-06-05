<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage News</title>
	<link href="/resources/CSS/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="/resources/CSS/app.css" rel="stylesheet" type="text/css" />
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<script>
	function popunder() {
		var editor;
		document.getElementById('Save').style.display = "none";
		document.getElementById('Cancel').style.display = "none";
		document.getElementById('textArea').style.display = "none";
	}
	function edit() {
		editor = CKEDITOR.replace('content');
		document.getElementById('Edit').style.display = "none";
		document.getElementById('Save').style.display = "inline";
		document.getElementById('Cancel').style.display = "inline";
	}
	function save() {
		document.getElementById('textArea').value=editor.getData();
		
	}
	function cancel() {
		var editor;
		CKEDITOR.instances['content'].destroy()
		document.getElementById('Edit').style.display = "inline";
		document.getElementById('Save').style.display = "none";
		document.getElementById('Cancel').style.display = "none";
	}
	</script>
</head>
<body onload='popunder()' >
<form method="post" action="/admin/save" enctype="multipart/form-data" id="divdata" '>	
<div class="generic-container">
		<div class="panel panel-default" >
			<div class="panel-heading"><span class="lead">Content</span></div>
			<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-1 control-lable" for="file">Description</label>
							<div class="col-md-7">
								<input type="text" value="${description}" path="description" id="description" name="description" class="form-control input-sm"/>
							</div>
							
						</div>
					</div>
			<div id = "content" name = "content" >${contentValue}</div>
		</div>
		<input type="text" id="textArea" name="textArea">
		<td><a onclick="edit()" id="Edit" class="btn btn-success custom-width">Edit</a></td>
		<input  type="submit" id="Save" value="Save" onclick="save()" class="btn btn-success custom-width">
		<td><a onclick="cancel()" id="Cancel" class="btn btn-success custom-width">Cancel</a></td>
		<div class="well">
	 		Go to <a href="<c:url value='/admin' />">Manage News</a>
	 	</div>

</form>
</body>
</html>