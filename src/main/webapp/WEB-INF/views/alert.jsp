<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>     
</head>
<body>
<script type="text/javascript">
		var msg = "${msg}";
		var url = "${url}";
		//alert(msg);
		Swal.fire({
			  title: msg,
			  icon: 'warning',
			  confirmButtonColor: '#3085d6',
			  confirmButtonText: '확인',
			}).then((result) => {
			  if (result.value) {
	              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
				  location.href = url;
			  }
			})
		
</script>
</body>
</html>