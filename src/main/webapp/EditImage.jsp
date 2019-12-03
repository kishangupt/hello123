<%@page import="imagesbank.ImageBankHandler"%>
<%@page import="imagesbank.ImageBank"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="shared.jsp" />


<%
	short id = Short.parseShort(request.getParameter("id"));
	ImageBank c = new ImageBankHandler().fetchImage(id);

	request.setAttribute("currCat", c);
%>



</head>
<body>

<c:import url="Header.jsp" />

<h1>Add Image To Bank</h1>

<form method="post" action="UploadFile" enctype="multipart/form-data">
	
	<input type="file" name="myfile" class="form-control">
	
	<br>
	<br>
	
	<input type="submit" value="Go" class="btn btn-success"> 
	
</form>

</body>
</html>