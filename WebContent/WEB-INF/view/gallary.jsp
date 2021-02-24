<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<input type="file" value="galary" onclick="window.location.href='upload_gallary';return true;">


	<!-- Display image on browse
	<form id="form1" runat="server">
	        <input type='file' id="imgInp" />
	        <img id="blah" src="#" alt="your image" />
	    </form>
	
	<script type="text/javascript">
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	        reader.onload = function (e) {
	            $('#blah').attr('src', e.target.result);
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	$("#imgInp").change(function(){
	    readURL(this);
	});
	
	</script>
-->

	
</body>
</html>