<%
//Save---------------------------------
if (request.getParameter("investorName") != null) 
{ 
Investor itemObj = new Investor(); 
String stsMsg = ""; 

//Insert--------------------------
		if (request.getParameter("hidItemIDSave") == "") 
		{ 
			stsMsg = itemObj.insertinvestor(request.getParameter("investorName"), 
			request.getParameter("Mail"), 
			request.getParameter("ProjectCode"), 
			request.getParameter("ProjectName"), 
			request.getParameter("investAmount")); 
		} 
		else//Update----------------------
		{ 
			stsMsg = itemObj.updateInvestor(request.getParameter("hidItemIDSave"), 
			request.getParameter("investorName"), 
			request.getParameter("Mail"), 
			request.getParameter("ProjectCode"), 
			request.getParameter("ProjectName"), 
			request.getParameter("investAmount")); 
		}

	session.setAttribute("statusMsg", stsMsg); 
	
} 
		//Delete-----------------------------
		if (request.getParameter("hidItemIDDelete") != null) 
		{ 
			Investor itemObj = new Investor(); 
			String stsMsg = 
			itemObj.deleteinvestor(request.getParameter("hidItemIDDelete")); 
			session.setAttribute("statusMsg", stsMsg); 
		}

%>
<%@ page import="com.Investor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="Views/bootstrap.min.css">
  <script src="Components/jquery-3.6.0.min.js"></script>
  <script  src="Components/Investors.js"> </script>
</head>
<body>
<div class="container">
<div class="row">
	
	<div class="col-8">
	<form id="formItem" name="formItem" method="post" action="Investors.jsp">
	
			 Investor Name: 
			<input id="investorName" name="investorName" type="text" 
			 class="form-control form-control-sm">
			 
			<br> Mail: 
			<input id="mail" name="mail" type="text" 
			 class="form-control form-control-sm">
			 
			<br> Project Code: 
			<input id="projectCode" name="projectCode" type="text" 
			 class="form-control form-control-sm">
			 
			<br> Project Name: 
			<input id="projectName" name="projectName" type="text" 
			 class="form-control form-control-sm">
			<br>
			
			<br> Invest Amount: 
			<input id="investAmount" name="investAmount" type="text" 
			 class="form-control form-control-sm">
			<br>
			
			<input id="btnSave" name="btnSave" type="button" value="Save" 
			 class="btn btn-primary">
			<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
			</form>
			<div id="alertSuccess" class="alert alert-success">
				<%
					out.print(session.getAttribute("statusMsg"));
				%>
			</div>
			<div id="alertError" class="alert alert-danger"></div>
			
			<br>
			<%
				Investor itemObj = new Investor();
				out.print(itemObj.readInvestor());
			%>
	
		</div>

	</div>

</div>

</body>
</html>