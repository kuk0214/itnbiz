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
			$('#sabun').attr('value', '');
			$('#name').attr('value', '');
			$('#join_type option:selected').removeAttr('selected');
			$('#put_yn option:selected').removeAttr('selected');
			$('#pos_gbn_code option:selected').removeAttr('selected');
			$('#join_day').attr('value', '');
			$('#retire_day').attr('value', '');
			$('#join_gbn_code option:selected').removeAttr('selected');
		});
		
		$('#hbtn').click(function() {
			$(location).attr('href', '/insa/main.insa');
		});
		
		$('#ibtn').click(function() {
			$(location).attr('href', '/insa/empReg.insa');
		});
		
		$('#selbtn').click(function() {
			$(location).attr('href', '/insa/insaListForm.insa');
		});
	
		$.datepicker.setDefaults({
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			dateFormat: 'yy-mm-dd',
			showMonthAfterYear: true,
			showOn: "button",
			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			buttonImageOnly: true,
			changeMonth: true,
			changeYear: true
		});
		
		$('#join_day').datepicker();
		$('#retire_day').datepicker();
		
		$("img.ui-datepicker-trigger").attr("style","margin-right:55px; cursor:pointer;");
		
		$('.pbtn').click(function(){
			var pno = $(this).html();
			
			if(pno == 'pre'){
				pno = '${PAGE.startPage - 1}';
			} else if(pno == 'next'){
				pno = '${PAGE.endPage + 1}';
			}
			
			var sabun = $('#sabun').val();
			var name = $('#name').val();
			var join_type = $('#join_type').val();
			var put_yn = $('#put_yn');
			var pos_gbn = $('#pos_gbn_code').val();
			var join_day = $('#join_day').val();
			var retire_day = $('#retire_day').val();
			var join_gbn = $('#join_gbn_code').val();
			
			if(!sabun) {
				$('#sabun').prop('disabled', true);
			}
			
			if(!name) {
				$('#name').prop('disabled', true);
			}
			
			if(!join_type) {
				$('#join_type').prop('disabled', true);
			}
			
			if(!put_yn) {
				$('#put_yn').prop('disabled', true);
			}
			
			if(!pos_gbn) {
				$('#pos_gbn_code').prop('disabled', true);
			}
			
			if(!join_day) {
				$('#join_day').prop('disabled', true);
			}
			
			if(!retire_day) {
				$('#retire_day').prop('disabled', true);
			}
			
			if(!join_gbn) {
				$('#join_gbn_code').prop('disabled', true);
			}
			
			$('#nowPage').val(pno);
			$('#frm').submit();
		});
		
		$('#sbtn').click(function() {
			var sabun = $('#sabun').val();
			var name = $('#name').val();
			var join_type = $('#join_type').val();
			var put_yn = $('#put_yn').val();
			var pos_gbn = $('#pos_gbn_code').val();
			var join_day = $('#join_day').val();
			var retire_day = $('#retire_day').val();
			var join_gbn = $('#join_gbn_code').val();
			
			
			if(!sabun) {
				$('#sabun').prop('disabled', true);
			}
			
			if(!name) {
				$('#name').prop('disabled', true);
			}
			
			if(!join_type || join_type == "(선택)") {
				$('#join_type').prop('disabled', true);
			}
			
			if(!put_yn || put_yn == "(선택)") {
				$('#put_yn').prop('disabled', true);
			}
			
			if(!pos_gbn || pos_gbn == "(선택)") {
				$('#pos_gbn_code').prop('disabled', true);
			}
			
			if(!join_day) {
				$('#join_day').prop('disabled', true);
			}
			
			if(!retire_day) {
				$('#retire_day').prop('disabled', true);
			}
			
			if(!join_gbn || join_gbn == "(선택)") {
				$('#join_gbn_code').prop('disabled', true);
			}
			
			$('#frm').submit();
			
		});
		
		$('.detail').click(function() {
			var sabun = $(this).children(':first').html();
			$('#name').prop('disabled', true);
			$('#join_type').prop('disabled', true);
			$('#put_yn').prop('disabled', true);
			$('#pos_gbn_code').prop('disabled', true);
			$('#join_day').prop('disabled', true);
			$('#retire_day').prop('disabled', true);
			$('#join_gbn_code').prop('disabled', true);
			$('#sabun').val(sabun);
			$('#frm').attr('action', '/insa/insaDetail.insa');
			$('#frm').submit()
		});
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
	<form method="POST" action="/insa/insaListForm.insa" name="frm" id="frm" class="mgl110 mgb40">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<div class="w3-col">
			<label class="mgr55">사번</label>
			<input type="text" class="mgr55 mgb10 w3-right-align" name="sabun" id="sabun" 
					value="<c:if test="${DATA.sabun ne 0}">${DATA.sabun}</c:if>">
			<label for="name" class="mgr55">성명</label>
			<input type="text" class="mgr55" name="name" id="name" value="${DATA.name}">
			<label for="join_type" class="mgr55">입사구분</label>
			<select class="mgr55" name="join_type" id="join_type">
				<option>(선택)</option>
		<c:forEach var="data" items="${LIST3}">
				<option value="${data.code}" <c:if test="${DATA.join_type eq data.code}">selected="selected"</c:if>>${data.name}</option>
		</c:forEach>
			</select>
			<label for="put_yn" class="mgr55">투입여부</label>
			<select class="mgr55" name="put_yn" id="put_yn">
				<option>(선택)</option>
		<c:forEach var="data" items="${LIST4}">
				<option value="${data.code}" <c:if test="${DATA.put_yn eq data.code}">selected="selected"</c:if>>${data.name}</option>
		</c:forEach>
			</select><br>
			<label for="pos_gbn_code" class="mgr55">직위</label>
			<select class="mgr40" name="pos_gbn_code" id="pos_gbn_code">
				<option>(선택)</option>
		<c:forEach var="data" items="${LIST2}">
				<option value="${data.code}" <c:if test="${DATA.pos_gbn_code eq data.code}">selected</c:if>>${data.name}</option>
		</c:forEach>
			</select>
			<label for="join_day" class="mgr55">입사일자</label>
			<input type="text" class="mgr5 w250" name="join_day" id="join_day" value="${DATA.join_day}">
			<label for="retire_day" class="mgr55">퇴사일자</label>
			<input type="text" class="mgr5 w250" name="retire_day" id="retire_day" value="${DATA.retire_day}">
			<label for="join_gbn_code" class="mgr55">직종체크</label>
			<select class="mgr55" name="join_gbn_code" id="join_gbn_code">
				<option>(선택)</option>
		<c:forEach var="data" items="${LIST1}">
				<option value="${data.code}" <c:if test="${DATA.join_gbn_code eq data.code}">selected</c:if>>${data.name}</option>
		</c:forEach>
			</select><br>
		</div>
		<div class="w3-right mgt40 mgr40">
			<div class="w3-third w3-button w3-black" id="sbtn">검색</div>
			<input type="reset" class="w3-third w3-button w3-black" id="rbtn">
			<input type="button" class="w3-third w3-button w3-black" value="이전" onclick="history.back()">
		</div>
	</form>
	<div class="w3-col mgt40 w3-center w99per">
		<span class="w3-col w210 h40 bgcg pdt10 w3-border-top w3-border-right w3-border-left">사번</span>
		<span class="w3-col w210 h40 bgcg pdt10 w3-border-top w3-border-right">성명</span>
		<span class="w3-col w210 h40 bgcg pdt10 w3-border-top w3-border-right">주민번호</span>
		<span class="w3-col w210 h40 bgcg pdt10 w3-border-top w3-border-right">핸드폰번호</span>
		<span class="w3-col w210 h40 bgcg pdt10 w3-border-top w3-border-right" >직위</span>
		<span class="w3-col w210 h40 bgcg pdt10 w3-border-top w3-border-right">입사일자</span>
		<span class="w3-col w210 h40 bgcg pdt10 w3-border-top w3-border-right">퇴사일자</span>
		<span class="w3-col w210 h40 bgcg pdt10 w3-border-top w3-border-right">투입여부</span>
		<span class="w3-col w210 h40 bgcg pdt10 w3-border-top w3-border-right sal">연봉(만원)</span>
	</div>
	<div class="w3-col w3-center w99per ">
	<c:forEach var="data" items="${LIST}">
		<div class="detail">
			<span class="w3-col w210 h40 pdAll10 w3-border-left w3-border-right w3-border-bottom">${data.sabun}</span>
			<span class="w3-col w210 h40 pdAll10 w3-border-right w3-border-bottom ">${data.name}</span>
			<span class="w3-col w210 h40 pdAll10 w3-border-right w3-border-bottom ">${data.reg_no}</span>
			<span class="w3-col w210 h40 pdAll10 w3-border-right w3-border-bottom ">${data.hp}</span>
			<span class="w3-col w210 h40 pdAll10 w3-border-right w3-border-bottom " >${data.pos_gbn_code}</span>
			<span class="w3-col w210 h40 pdAll10 w3-border-right w3-border-bottom ">${data.join_day}</span>
			<span class="w3-col w210 h40 pdAll10 w3-border-right w3-border-bottom ">${data.retire_day}</span>
			<span class="w3-col w210 h40 pdAll10 w3-border-right w3-border-bottom ">${data.put_yn}</span>
			<span class="w3-col w210 h40 pdAll10 w3-border-right w3-border-bottom "><c:if test="${data.salary ne 0}">${data.salary}</c:if></span>
		</div>
	</c:forEach>
	<c:if test="${empty LIST}">
		<div class="h40 pdt10">검색된 데이터가 없습니다.</div>
	</c:if>
			<!-- 페이징 처리 -->
		<div class="w3-center w3-margin-bottom mgt40">
			<div class="w3-bar w3-border w3-round w3-margin-top">
	<c:if test="${PAGE.startPage == 1}">
				<span class="w3-bar-item w3-grey">pre</span>
	</c:if>
	<c:if test="${PAGE.startPage != 1}">
				<span class="w3-bar-item w3-button w3-hover-lime pbtn">pre</span>
	</c:if>
<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
	<c:if test="${PAGE.nowPage == page}">
				<span class="w3-bar-item w3-button w3-hover-lime w3-green pbtn">${page}</span>
	</c:if>
	<c:if test="${PAGE.nowPage != page}">
				<span class="w3-bar-item w3-button w3-hover-lime pbtn">${page}</span>
	</c:if>
</c:forEach>
	<c:if test="${PAGE.endPage == PAGE.totalPage}">
				<span class="w3-bar-item w3-grey">next</span>
	</c:if>
	<c:if test="${PAGE.endPage != PAGE.totalPage}">
				<span class="w3-bar-item w3-button w3-hover-lime pbtn">next</span>
	</c:if>
			</div>
		</div>
	</div>
</body>
</html>