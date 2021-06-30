<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리시스템</title>
<link rel="stylesheet" type="text/css" href="/insa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/insa/css/user.css">
<script type="text/javascript" src="/insa/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function() {
		$('#rbtn').click(function() {
			document.location.reload();
		});
		
		$('#rbtn').click(function() {
			
		});
		
		$('#hbtn').click(function() {
			$(location).attr('href', '/insa/main.insa');
		});
		
		$('#ibtn').click(function() {
			$(location).attr('href', '/insa/empreg.insa');
		});
		
		$('#selbtn').click(function() {
			$(location).attr('href', '/insa/selemp.insa');
		});
		
		$('#reg_no').blur(function() {
			var today = new Date();
			var full_year = today.getFullYear() + "";
			var now_year = Number(full_year.substring(2,4));
			var year = Number($('#reg_no').val().substring(0,2));
			if(year > now_year) {
				age = now_year + 101 - year;
				$('#years').val(age);
			} else {
				age = now_year - year + 1;
				$('#years').val(age);
			}
		});
		
		$.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd',
			showMonthAfterYear: true,
			showOn: "both",
			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			buttonImageOnly: true
		});
		
		$('#mil_startdate').datepicker();
		$('#mil_enddate').datepicker();
		$('#join_day').datepicker();
		$('#retire_day').datepicker();
		
		$('#mil_enddate').blur(function() {
			alert('전역일 끝');
		});
		
		$('#sbtn').click(function() {
			var tsabun = $('#sabun').val();
			var tid = $('#id').val();
			var tpwd = $('#pwd').val();
			var tname = $('#name').val();
			var thp = $('#thp').val();
			var temail = $('#email_id').val() + $('#email_addr').val();
			var tjoin_day = $('#join_day').val();
			
			$.ajax({
				url: '/insa/empregProc.mentor',
				type: 'post',
				dataType: 'json',
				data: {
					sabun: tsabun,
					id: tid,
					pwd: tpwd,
					name: tname,
					hp: thp,
					email: temail,
					join_day: tjoin_day
				},
				success: function(obj) {
					if(obj.result == 'OK') {
						alert('등록에 성공했습니다.')
					} else {
						alert('*** 등록에에 실패했습니다! ***');
					}
				},
				error: function() {
					alert('####### 통신 에러 #######')
				}
			});
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
	<div class="w3-margin-top w3-margin-bottom">
		<span class="mgl40 ft20">직원 상세 정보</span>
		<div class="inblock w3-right mgr40">
			<div class="w3-third w3-button w3-black" id="sbtn">저장</div>
			<div class="w3-third w3-button w3-black" id="rbtn">신규</div>
			<div class="w3-third w3-button w3-black" id="pbtn">이전</div>
		</div>
	</div>
	<div>
		<div>
			<div class="inblock">
				<div class="mgl40 mgr40 pdAll40">
					<img class="w300" src="/insa/img/noimage.jpg" name="profile_image">
					<div class="w3-center w3-border w150 mgl20">사진 올리기</div>
				</div>
			</div>
			<div class="inblock">
				<div class="mgb10 inblock">
					<div class="inblock">
						<label class="mgr30" style="width: 150px;">*사번</label>
						<input class="mgr30 w3-right-align" readonly="readonly" value="${sabun}" name="sabun" id="sabun">
					</div>
					<div class="inblock mgr30">
						<label class="w150 mgr30">*한글성명</label>
						<input name="name" id="name">
					</div>
					<div class="inblock">
						<label class="w150 mgr30">영문성명</label>
						<input name="eng_name">
					</div>
				</div>
				<div class="flotr mgb10">
					<label class="w3-center mgr30">*아이디</label>
					<input class="mgr30" name="id" id="id">
					<label class="w3-center mgr30 ">*패스워드</label>
					<input class="mgr30" name="pwd" id="pwd"">
					<label class="w3-center mgr30">*패스워드확인</label>
					<input id="repwd">
				</div>
				<div class="mgb10">
					<label class="w250 mgr30">전화번호</label>
					<input class="mgr30" name="phone">
					<label class="w250 mgr30">*핸드폰번호</label>
					<input class="mgr30" name="hp" id="hp">
					<label class="w250 mgr30">주민번호</label>
					<input name="reg_no" id="reg_no">
				</div>
				<div class="mgb10">
					<label class="w250 mgr30">연령</label>
					<input class="mgr30" name="years" id="years">
					<label class="w250 mgr30">*이메일</label>
					<input class="mgr30 w150" name="email" id="email_id">
					<select class="w180 mgr20" id="email_addr">
						<option value="@naver.com">@naver.com</option>
					</select>
					<label class="w180 mgr30">직종체크</label>
					<select class="w180 mgr20" name="join_gbn_code">
						<option></option>
					</select>
					<label class="w180 mgr30">성별</label>
					<select class="w180" name="sex">
						<option></option>
					</select>
				</div>
				<div class="mgb10">
					<label class="w250 mbr5 pdr30">주소</label>
					<input class="w250" placeholder="우편번호" name="zip">
					<div class="w3-button w3-border">주소검색</div>
					<input class="mgr30" placeholder="주소" name="addr1">
					<input placeholder="세부주소" name="add2">
				</div>
				<div class="mgb20">
					<label class="w250 mbr5 pdr30">직위</label>
					<select name="pos_gbn_code">
						<option></option>
					</select>
					<label class="w250 pdr30">부서</label>
					<select name="dept_code">
						<option></option>
					</select>
					<label class="w250 pdr30">연봉</label>
					<input name="salaly">
				</div>
			</div>
		</div>
		<div>
			<div class="mgl80 mgb20">
					<label class="w250 mbr5 pdr30">입사구분</label>
					<select class="mgr30" name="join_type">
						<option></option>
					</select>
					<label class="w250 pdr30">등급</label>
					<select class="mgr30" name="gart_level">
						<option></option>
					</select>
					<label class="w250 pdr30">투입여부</label>
					<select class="mgr30" name="put_yn">
						<option></option>
					</select>
					<label class="w250 pdr30">군필여부</label>
					<select class="mgr30" name="mil_yn">
						<option></option>
					</select>
			</div>
			<div class="mgl80 mgb20">
					<label class="w250 mbr5 pdr30">군별</label>
					<select class="mgr30" name="mil_type">
						<option></option>
					</select>
					<label class="w250 pdr30">계급</label>
					<select class="mgr30" name="mil_level">
						<option></option>
					</select>
					<label class="w250 pdr30">입영일자</label>
					<input name="mil_startdate" id="mil_startdate">
					<label class="w250 pdr30">전역일자</label>
					<input name="mil_enddate" id="mil_enddate">
			</div>
			<div class="mgl80 mgb20">
					<label class="w250 mbr5 pdr30">KOSA등록</label>
					<select class="mgr30" name="kosa_reg_yn">
						<option></option> 
					</select>
					<label class="w250 pdr30">KOSA등급</label>
					<select class="mgr30" name="kosa_class_code">
						<option></option>
					</select>
					<label class="w250 pdr30">*입사일자</label>
					<input name="join_day" id="join_day">
					<label class="w250 pdr30">퇴사일자</label>
					<input name="retire_day" id="retire_day">
			</div>
			<div class="mgl80 mgb20">
					<label class="w250 mbr5 pdr30">사업자번호</label>
					<input name="cmp_reg_no">
					<label class="w250 pdr30">업체명</label>
					<input name="crm_name">
					<label class="w250 pdr30">사업자등록증</label>
					<input name="cmp_reg_image">
					<div class="inblock">미리보기</div>
					<div class="inblock">등록</div>
			</div>
			<div class="mgl80 mgb20">
					<label class="w250 mbr5 pdr30">자기소개</label>
					<textarea rows="2" cols="80" name="self_intro"></textarea>
					<label class="w250 mbr5 pdr30">이력서</label>
					<input name="carrier_image">
					<div class="inblock">미리보기</div>
					<div class="inblock">파일업로드</div>
			</div>
		</div>
	</div>
</body>
</html>