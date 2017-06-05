<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:webTemplate>
<body>
	<form method="post" action="/" enctype="multipart/form-data" id="divdata">		
	    <div name="leftPage" id="leftPage" rows="10" cols="80">
	        ${leftPage}
	    </div> 
    </form>
</body>

</t:webTemplate>
