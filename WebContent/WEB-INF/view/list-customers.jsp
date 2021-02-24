<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>

<html>
<head>
	<title>list of customers</title>
	<!-- reference css -->
	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />
		  	
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Ishita's CRM Project			</h2>
		</div>
	</div>
	<div id="container">
		<div id="content">
			<!-- Addng button for adding customers -->
			<input type="button" value= "Add Customer"
			       onclick="window.location.href='showFormForAdd';return false;"
			       class="add-button"
			/>
		
			<!-- Upload/ Download Images -->
			<input type="button" value= "Upload Images"
			       onclick="window.location.href='to_gallary';return false;"
			       class="image-button"
			/>
			
		<!-- html table -->
		<table>
			<tr> 
				<th>First Name</th>
				<th>Last Name</th>
				<th>email</th>
				<th>Action</th>
			</tr>
			<!-- loop over and print customers -->
			<c:forEach var="tempCustomer" items = "${customers}">
			
				<!-- construct update link with customer id -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name="customerId" value="${tempCustomer.id}"/>
				</c:url>
				
				<!-- construct delete link with customer id -->
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${tempCustomer.id}"/>
				</c:url>
				
				<tr>				    
					<td> ${tempCustomer.firstName} </td>
					<td> ${tempCustomer.lastName} </td>
					<td> ${tempCustomer.email} </td>
					<td> 
						<!-- display table link -->
						<a href="${updateLink}">Update</a>
						|
						<a href="${deleteLink}"
							onclick="if(!(confirm('Arey you sure you want to delete this entry??'))) return false">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</body>
</html>