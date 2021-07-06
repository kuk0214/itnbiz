<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원리스트</title>
<link rel="stylesheet" type="text/css" href="/insa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/insa/css/user.css">
<script type="text/javascript" src="/insa/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function() {

		$('#rbtn').click(function() {
			
		});
		
		$('#pbtn').click(function() {
			$(location).attr('href', '/insa/main.insa');
		});
		
		$('#hbtn').click(function() {
			$(location).attr('href', '/insa/main.insa');
		});
		
		$('#ibtn').click(function() {
			$(location).attr('href', '/insa/empreg.insa');
		});
		
		$('#selbtn').click(function() {
			$(location).attr('href', '/insa/insaListForm.insa');
		});
	
		$.datepicker.setDefaults({
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			dateFormat: 'yy-mm-dd',
			showMonthAfterYear: true,
			showOn: "both",
			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			buttonImageOnly: true,
			changeMonth: true,
			changeYear: true
		});
		
		$('#join_day').datepicker();
		$('#retire_day').datepicker();
		
		$("img.ui-datepicker-trigger").attr("style","margin-right:55px; cursor:pointer;");
	});
</script>
</head>
<body>
	<div class="w3-margin-top w3-border-bottom pdb10">
		<span class="mgl30" id="hbtn">It & Biz</span>
		<span class="w3-right mgr30" id="selbtn">조회하기</span>
		<span class="w3-right mgr30" id="ibtn">입력하기</span>
	</div>
	<div class="mgt40 mgb20">
		<span class="mgl60 ft20">직원 리스트</span>
	</div>
	<div class="mgl110 mgb40">
		<div class="w3-col">
			<label class="mgr55"">사번</label>
			<input type="text" class="mgr55 mgb10 w3-right-align" name="sabun" id="sabun">
			<label for="name" class="mgr55">성명</label>
			<input type="text" class="mgr55" name="name" id="name">
			<label for="join_type" class="mgr55">입사구분</label>
			<select class="mgr55" name="join_type" id="join_type">
				<option></option>
			</select>
			<label for="put_yn" class="mgr55">투입여부</label>
			<select class="mgr55" name="put_yn">
				<option></option>
			</select><br>
			<label for="pos_gbn_code" class="mgr55">직위</label>
			<select class="mgr40" name="pos_gbn_code" id="pos_gbn_code">
				<option></option>
			</select>
			<label for="join_day" class="mgr55">입사일자</label>
			<input type="text" class="mgr5 w250" name="join_day" id="join_day" readonly="readonly">
			<label for="retire_day" class="mgr55">퇴사일자</label>
			<input type="text" class="mgr5 w250" name="retire_day" id="retire_day" readonly="readonly">
			<label for="join_gbn_code" class="mgr55">직종체크</label>
			<select class="mgr55" name="join_gbn_code" id="join_gbn_code">
				<option></option>
			</select><br>
		</div>
		<div class="w3-right mgt40 mgr40">
			<div class="w3-third w3-button w3-black" id="sbtn">검색</div>
			<div class="w3-third w3-button w3-black" id="rbtn">초기화</div>
			<div class="w3-third w3-button w3-black" id="pbtn">이전</div>
		</div>
	</div>
	<div class="w3-col mgt40 w3-center w3-border w99per">
		<span class="w3-col w210 h40 pdt10 w3-border-right">사번</span>
		<span class="w3-col w210 h40 pdt10 w3-border-right">성명</span>
		<span class="w3-col w210 h40 pdt10 w3-border-right">주민번호</span>
		<span class="w3-col w210 h40 pdt10 w3-border-right">핸드폰번호</span>
		<span class="w3-col w210 h40 pdt10 w3-border-right" >직위</span>
		<span class="w3-col w210 h40 pdt10 w3-border-right">입사일자</span>
		<span class="w3-col w210 h40 pdt10 w3-border-right">퇴사일자</span>
		<span class="w3-col w210 h40 pdt10 w3-border-right">투입여부</span>
		<span class="w3-col w210 h40 pdt10">연봉</span>
	</div>
	<div class="w3-col w3-center w3-border w99per">
		<div class="h40 pdt10">검색된 데이터가 없습니다.</div>
	</div>
</body>
</html>