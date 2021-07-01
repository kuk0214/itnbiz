<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function profileURL(input) {
		if (input.files && input.files[0]) {
	    	var reader = new FileReader();
	    	reader.onload = function(e) {
	    		document.getElementById('img_view').src = e.target.result;
	    	};
	    	reader.readAsDataURL(input.files[0]);
		} 
	}
	
	function crfileURL(input) {
		if (input.files && input.files[0]) {
	    	var reader = new FileReader();
	    	reader.onload = function(e) {
	    		document.getElementById('crfile_img').src = e.target.result;
	    	};
	    	reader.readAsDataURL(input.files[0]);
		} 
	}
	
	function cmpfileURL(input) {
		if (input.files && input.files[0]) {
	    	var reader = new FileReader();
	    	reader.onload = function(e) {
	    		document.getElementById('cmpfile_img').src = e.target.result;
	    		document.getElementById('cmp_reg_image').value = e.target.result;
	    	};
	    	reader.readAsDataURL(input.files[0]);
		} 
	}
	
	function jusoCallBack(addr1, refaddr, addr2, zip) {
		$('#addr1').val(addr1 + ' ' +refaddr);
		$('#addr2').val(addr2);
		$('#zip').val(zip);
	}
	
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
		
		$('#id').blur(function() {
			var idreq = /^(?=.*[a-z])(?=.*[0-9]).{8,15}$/;
			var tid = $('#id').val();
			if(!idreq.test(tid)) {
				alert('영어소문자와 숫자포함, 최소8글자에서 최대 15글자만 가능합니다');
				$('#id').val('');
				return
			}
			
			$.ajax({
				url: '/insa/idCheck.insa',
				type: 'post',
				dataType: 'json',
				data: {
					id: tid
				},
				success: function(obj) {
					if(obj.result == 'OK') {
						alert('사용가능한 아이디 입니다.')
					} else {
						alert('*** 이미 등록된 아이디입니다 ***');
						$('#id').val('')
					}
				},
				error: function() {
					alert('####### 통신 에러 #######')
				}
			});
		});
		
		$('#salary').blur(function() {
			var salary = $('#salary').val();
			salary = salary.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#salary').val(salary);
		});
		
		$('#filebtn').click(function() {
			$('#profile_image').click();
		});
		
		$('#crbtn').click(function() {
			$('#crfile').click();
		});
		
		$('#self_img').click(function() {
			$('#modal01').css('display', 'block');
		});
		
		$('#cmpbtn').click(function() {
			$('#cmpfile').click();
		});
		
		$('#cmp_img').click(function() {
			$('#modal02').css('display', 'block');
		})
		
		$('#saddr').click(function goPopup() { 
			var pop = window.open("/insa/jusoPopup.insa","pop","width=570,height=420, scrollbars=yes, resizable=yes");  
		});
		
		$('#pwd').focus(function() {
			$(this).val('');	
		});
		
		$('#pwd_view').keyup(function() {
			var tpwd = $(this).val();
			var pwd = $('#pwd').val();
			if(tpwd.length == 1) {
				$('#pwd').val(tpwd);				
			} else if(tpwd.length > 1) {
				$('#pwd').val(pwd + tpwd.substring(tpwd.length - 1));
			}
			var reg1 = /^.*[a-zA-Z0-9!@#$%^&*]$/;
			if(!reg1.test(tpwd)) {
				alert('영어 대소문자, 숫자, 특수문자!@#$%^&*만 사용가능합니다.');
				$(this).val('');
				return
			}
			var spwd = tpwd.substring(0, tpwd.length - 1).replace(/[a-zA-Z0-9]/g, '*') + tpwd.substring(tpwd.length - 1);
			if(tpwd.length > 1) {
				$(this).val(spwd);				
			}
			
			$('#pwd_view').blur(function() {
				var tpwd = $(this).val();
				var fpwd = tpwd.replace(/[a-zA-Z0-9]/g, '*')
				$(this).val(fpwd);
			});
		});
		
		$('#repwd_view').keyup(function() {
			var tpwd = $(this).val();
			var repwd = $('#repwd').val();
			if(tpwd.length == 1) {
				$('#repwd').val(tpwd);				
			} else if(tpwd.length > 1) {
				$('#repwd').val(repwd + tpwd.substring(tpwd.length - 1));
			}
			var spwd = tpwd.substring(0, tpwd.length - 1).replace(/[a-zA-Z0-9]/g, '*') + tpwd.substring(tpwd.length - 1);
			if(tpwd.length > 1) {
				$(this).val(spwd);				
			}
			
			$('#repwd_view').blur(function() {
				var pwd = $('#pwd').val();
				var repwd = $('#repwd').val();
				if(!(pwd == repwd)) {
					$('#repwd_view').val('');
					$('#repwd').val('');
					$('#repwd_view').focus();
					return
				}
				var tpwd = $(this).val();
				var fpwd = tpwd.replace(/[a-zA-Z0-9]/g, '*');
				$(this).val(fpwd);
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
					<img class="imgBox300" src="/insa/img/noimage.jpg" id="img_view"><br>
					<input type="file" class="w3-hide" name="profile_image" id="profile_image" onchange="profileURL(this);">
					<input type="button" class="inblock w180 mgt5 mgl60 bgcw" id="filebtn" value="사진올리기">
				</div>
			</div>
			<div class="inblock">
				<div class="mgb10 inblock">
					<div class="inblock">
						<label for="sabun" class="mgr30"">*사번</label>
						<input class="mgr30 w3-right-align" readonly="readonly" value="${sabun}" name="sabun" id="sabun">
					</div>
					<div class="inblock mgr30">
						<label for="name" class="mgr30">*한글성명</label>
						<input name="name" id="name">
					</div>
					<div class="inblock">
						<label for="eng_name" class="mgr30">영문성명</label>
						<input name="eng_name" id="eng_name">
					</div>
				</div>
				<div class="mgb10">
					<label for="id" class="mgr30">*아이디</label>
					<input class="mgr30" name="id" id="id">
					<label for="pwd_view" class="w3-center mgr30 ">*패스워드</label>
					<input class="mgr30" name="pwd_view" id="pwd_view"">
					<input type="hidden" name="pwd" id="pwd">
					<label for="repwd_view" class="w3-center mgr30">*패스워드확인</label>
					<input id="repwd_view">
					<input type="hidden" name="repwd" id="repwd">
				</div>
				<div class="mgb10">
					<label for="phone" class="mgr30">전화번호</label>
					<input class="mgr30" name="phone" id="phone">
					<label for="hp" class="mgr30">*핸드폰번호</label>
					<input class="mgr30" name="hp" id="hp">
					<label for="reg_no" class="mgr30">주민번호</label>
					<input name="reg_no" id="reg_no">
				</div>
				<div class="mgb10">
					<label for="years" class="mgr30">연령</label>
					<input class="mgr30" name="years" id="years">
					<label for="email" class="mgr30">*이메일</label>
					<input class="mgr30 w150" name="email" id="email_id">
					<select class="w180 mgr20" id="email_addr">
						<option value="@naver.com">@naver.com</option>
					</select>
					<label for="join_gbn_code" class="mgr30">직종체크</label>
					<select class="w180 mgr20" name="join_gbn_code" id="join_gbn_code">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="0" end="7">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="sex" class="mgr30">성별</label>
					<select class="w180" name="sex" id="sex">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="8" end="9">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
				</div>
				<div class="mgb10">
					<label for="zip" class="mgr30">주소</label>
					<input type="text" class="w150 mgr40" placeholder="우편번호" name="zip" id="zip">
					<input class="w80 mgr30 bgcw" type="button" id="saddr" value="주소검색">
					<input type="text" class="w480 mgr20" placeholder="주소" name="addr1" id="addr1">
					<input type="text" class="w480" placeholder="세부주소" name="addr2" id="addr2">
				</div>
				<div class="mgb20">
					<label for="pos_gbn_code" class="mbr5 pdr30">직위</label>
					<select name="pos_gbn_code" id="pos_gbn_code">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="10" end="19">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="dept_code" class="pdr30">부서</label>
					<select name="dept_code" id="dept_code">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="20" end="28">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="salary" class="pdr30">연봉</label>
					<input name="salary" id="salary">
				</div>
			</div>
		</div>
		<div>
			<div class="mgl80 mgb20">
					<label for="join_type" class="mbr5 pdr30">입사구분</label>
					<select class="mgr30" name="join_type" id="join_type">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="29" end="30">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="gart_level" class="pdr30">등급</label>
					<select class="mgr30" name="gart_level" id="gart_level">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="31" end="33">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="put_yn" class="pdr30">투입여부</label>
					<select class="mgr30" name="put_yn">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="34" end="35">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="mil_yn" class="pdr30">군필여부</label>
					<select class="mgr30" name="mil_yn" id="mil_yn">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="36" end="37">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
			</div>
			<div class="mgl80 mgb20">
					<label for="mil_type" class="mbr5 pdr30">군별</label>
					<select class="mgr30" name="mil_type" id="mil_type">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="38" end="40">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="mil_level" class="pdr30">계급</label>
					<select class="mgr30" name="mil_level" id="mil_level">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="41" end="44">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="mil_startdate" class="pdr30">입영일자</label>
					<input name="mil_startdate" id="mil_startdate">
					<label for="mil_enddate" class="pdr30">전역일자</label>
					<input name="mil_enddate" id="mil_enddate">
			</div>
			<div class="mgl80 mgb20">
					<label for="kosa_reg_yn" class="mbr5 pdr30">KOSA등록</label>
					<select class="mgr30" name="kosa_reg_yn" id="kosa_reg_yn">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="45" end="46">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="kosa_class_code" class="pdr30">KOSA등급</label>
					<select class="mgr30" name="kosa_class_code" id="kosa_class_code">
						<option></option>
				<c:forEach var="data" items="${LIST}" begin="47" end="50">
						<option value="${data.code}">${data.name}</option>
				</c:forEach>
					</select>
					<label for="join_day" class="pdr30">*입사일자</label>
					<input name="join_day" id="join_day">
					<label for="retire_day" class="pdr30">퇴사일자</label>
					<input name="retire_day" id="retire_day">
			</div>
			<div class="mgl80 mgb20">
					<label for="cmp_reg_no" class="mbr5 pdr30">사업자번호</label>
					<input name="cmp_reg_no" id="cmp_reg_no">
					<label for="crm_name" class="pdr30">업체명</label>
					<input name="crm_name" id="crm_name">
					<label for="cmp_reg_image" class="pdr30">사업자등록증</label>
					<input name="cmp_reg_image" id="cmp_reg_image">
					<input type="button" class="inblock w150 bgcw" value="미리보기" id="cmp_img">
					<input type="button" class="inblock w150 bgcw" value="등록" id="cmpbtn">
					<input type="file" class="w3-hide" id="cmpfile" onchange="cmpfileURL(this);">
			</div>
			<div class="mgl80 mgb20">
					<label for="self_intro" class="mbr5 pdr30">자기소개</label>
					<textarea rows="2" cols="80" name="self_intro" id="self_intro"></textarea>
					<label class="mbr5 pdr30">이력서</label>
					<input id="carrier_image" name="carrier_image" readonly="readonly">
					<input type="button" class="inblock w150 bgcw" value="미리보기" id="self_img">
					<input type="button" class="inblock w150 bgcw" value="파일업로드" id="crbtn">
					<input type="file" class="w3-hide" id="crfile" onchange="crfileURL(this);">
			</div>
		</div>
	</div>
	
	<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
    	<div class="w3-modal-content w3-animate-zoom">
      		<img id="crfile_img" style="width:100%">
    	</div>
  	</div>
  	
  	<div id="modal02" class="w3-modal" onclick="this.style.display='none'">
    	<div class="w3-modal-content w3-animate-zoom">
      		<img id="cmpfile_img" style="width:100%">
    	</div>
  	</div>
</body>
</html>