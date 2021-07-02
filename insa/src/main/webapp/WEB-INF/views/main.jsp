<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리시스템</title>
<link rel="stylesheet" type="text/css" href="/insa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/insa/css/user.css">
<script type="text/javascript" src="/insa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#ibtn').click(function() {
			$(location).attr('href', '/insa/empReg.insa');
		});
		
		$('#selbtn').click(function() {
			$(location).attr('href', '/insa/selemp.insa');
		});
	});
</script>
</head>
<body>
	<div>
		<div>
			<h1>인사관리 시스템</h2>
		</div>
		<div>
			<div>
				<h2>인사정보를 입력하겠습니다.</h2>
				<div class="w3-button" id="ibtn">입력</div>
			</div>
			<div>
				<h2>인사정보를 조회하겠습니다.</h2>
				<div class="w3-button" id="selbtn">조회</div>
			</div>
		</div>
	</div>
</body>
</html>