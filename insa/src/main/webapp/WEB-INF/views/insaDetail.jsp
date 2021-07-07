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
	    	};
	    	reader.readAsDataURL(input.files[0]);
		} 
	}
	
	function jusoCallBack(addr1, refaddr, addr2, zip) {
		$('#addr1').val(addr1 + ' ' +refaddr);
		$('#addr2').val(addr2);
		$('#zip').val(zip);
	}
	
	function autoHypenTel(str) {
		  str = str.replace(/[^0-9]/g, '');
		  var tmp = '';

		  if (str.substring(0, 2) == 02) {
		    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
		    if (str.length < 3) {
		      return str;
		    } else if (str.length < 6) {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2);
		      return tmp;
		    } else if (str.length < 10) {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2, 3);
		      tmp += '-';
		      tmp += str.substr(5);
		      return tmp;
		    } else {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2, 4);
		      tmp += '-';
		      tmp += str.substr(6, 4);
		      return tmp;
		    }
		  } else {
		    // 핸드폰 및 다른 지역 전화번호 일 경우
		    if (str.length < 4) {
		      return str;
		    } else if (str.length < 7) {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3);
		      return tmp;
		    } else if (str.length < 11) {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3, 3);
		      tmp += '-';
		      tmp += str.substr(6);
		      return tmp;
		    } else {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3, 4);
		      tmp += '-';
		      tmp += str.substr(7);
		      return tmp;
		    }
		  }

		  return str;
		}
	
	$(document).ready(function() {
		var fileTarget1 = $('#crfile'); 
		
		fileTarget1.on('change', function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name; } 
			else {
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
			} 
			$('#carrier_image_name').val(filename);
		});
		
		var fileTarget2 = $('#cmpfile');
		
		fileTarget2.on('change', function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name; } 
			else {
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
			} 
			$('#cmp_reg_image_name').val(filename);
		});

		$('#rbtn').click(function() {
			document.location.reload();
		});
		
		$('#pbtn').click(function() {
			$(location).attr('href', '/insa/main.insa');
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
			showOn: "both",
			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			buttonImageOnly: true,
			changeMonth: true,
			changeYear: true
		});
		
		$('#mil_startdate').datepicker();
		$('#mil_enddate').datepicker();
		$('#join_day').datepicker();
		$('#retire_day').datepicker();
		
		$('#id').blur(function() {
			var idreq = /^(?=.*[a-z])(?=.*[0-9]).{7,15}$/;
			var tid = $('#id').val();
			if(tid != "" && !idreq.test(tid)) {
				alert('영어소문자와 숫자포함, 최소8글자에서 최대 15글자만 가능합니다');
				setTimeout(function() { 
					$('#id').focus(); 
				}, 10)
				return
			}
			if(!tid) {
				return
			}
			var tsabun = $('#sabun').val();

			$.ajax({
				url: '/insa/idCheck.insa',
				type: 'post',
				dataType: 'json',
				data: {
					id: tid,
					sabun: tsabun
				},
				success: function(obj) {
					if(obj.result == 'OK') {
						if(tid != "") {
							alert('사용가능한 아이디 입니다.');							
						}
					} else if(obj.result == 'NO') {
						alert('*** 이미 사용중인 아이디입니다 ***');
						$('#id').val('');
					}
				},
				error: function() {
					alert('####### 통신 에러 #######')
				}
			});
		});
		
		$('#salary').keyup(function() {
			var salary = $('#salary').val();
			var tsalary = $('#salary').val().replaceAll(',', '');
			var salary_reg = /^[0-9]*$/;
			if(salary != "" && !salary_reg.test(tsalary)) {
				alert('숫자만 입력하세요');
			} else {
				if(salary.length == 4) {
					salary = salary.replace(/\B(?=(\d{3})+(?!\d))/g, ",");				
				} else if(salary.length == 8) {
					salary = salary.replace(/\B(?=(\d{3})+(?!\d))/g, ",");	
				}
				$('#salary').val(salary);				
			}
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
		
		$('#pwd_view').keyup(function() {
			var tpwd = $(this).val();
			var pwd = $('#pwd').val();
			if(tpwd.length == 1) {
				$('#pwd').val(tpwd);				
			} else if(tpwd.length > 1) {
				$('#pwd').val(pwd + tpwd.substring(tpwd.length - 1));
			}
			var reg1 = /^[a-zA-Z0-9!@#$%^&*]*$/;
			if(!reg1.test(tpwd)) {
				alert('영어 대소문자, 숫자, 특수문자!@#$%^&*만 사용가능합니다.');
				setTimeout(function() { 
					$('#pwd_view').focus(); 
				}, 10)
				return
			}
			var spwd = tpwd.substring(0, tpwd.length - 1).replace(/[a-zA-Z0-9!@#$%^&*]/g, '*') + tpwd.substring(tpwd.length - 1);
			if(tpwd.length > 1) {
				$(this).val(spwd);				
			}
			
		});
		
		$('#pwd_view').blur(function() {
			var tpwd = $(this).val();
			var fpwd = tpwd.replace(/[a-zA-Z0-9]/g, '*')
			var pwd = $('#pwd').val();
			var pwd_reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,15}$/;
			if(pwd != "" && !pwd_reg.test(pwd)) {
				alert('영어 대소문자, 숫자, 특수문자!@#$%^&*중 하나 포함 최소 8글자 최대 15글자만 됩니다.');
				$('#pwd_view').val('');
				$('#pwd').val('');
				setTimeout(function() { 
					$('#pwd_view').focus(); 
				}, 10);
				return 
			}
			var tpwd = $(this).val();
			var fpwd = tpwd.replace(/[a-zA-Z0-9!@#$%^&*]/g, '*');
			$(this).val(fpwd);
		});
		
		$('#repwd_view').keyup(function() {
			var tpwd = $(this).val();
			var repwd = $('#repwd').val();
			if(tpwd.length == 1) {
				$('#repwd').val(tpwd);				
			} else if(tpwd.length > 1) {
				$('#repwd').val(repwd + tpwd.substring(tpwd.length - 1));
			}
			var spwd = tpwd.substring(0, tpwd.length - 1).replace(/[a-zA-Z0-9!@#$%^&*]/g, '*') + tpwd.substring(tpwd.length - 1);
			if(tpwd.length > 1) {
				$(this).val(spwd);				
			}
			
		});
		$('#repwd_view').blur(function() {
			var pwd = $('#pwd').val();
			var repwd = $('#repwd').val().trim();
			if(repwd) {
				if(!(pwd == repwd)) {
					alert('비밀번호가 일치하지 않습니다.')
					$('#repwd_view').val('');
					$('#repwd').val('');
					setTimeout(function() { 
						$('#repwd_view').focus(); 
					}, 10);
					return
				}
			}
			var tpwd = $(this).val();
			var fpwd = tpwd.replace(/[a-zA-Z0-9!@#$%^&*]/g, '*');
			$(this).val(fpwd);
		});
		
		$('#reg_no_view').keyup(function() {
			var treg_no = $(this).val();
			var reg_no = $('#reg_no').val();
			if(treg_no.length == 1) {
				$('#reg_no').val(treg_no);				
			} else if(treg_no.length > 1) {
				$('#reg_no').val(reg_no + treg_no.substring(treg_no.length - 1));
			}
			var sreg_no = treg_no.substring(0, treg_no.length - 1).replace(/[a-zA-Z0-9]/g, '*') + treg_no.substring(treg_no.length - 1);
			if(treg_no.length > 1) {
				$(this).val(sreg_no);				
			}
		});
		
		$('#reg_no_view').blur(function() {
			var treg_no = $(this).val();
			var freg_no = treg_no.replace(/[0-9]/g, '*')
			var reg_no = $('#reg_no').val();
			var reg_no_reg = /^[0-9]{13}$/;
			if(treg_no != "" && !reg_no_reg.test(reg_no)) {
				alert('13자리 숫자를 입력해주세요');
				setTimeout(function() { 
					$('#reg_no_view').val('');
					$('#reg_no_view').focus(); 
				}, 10)
			}
			$(this).val(freg_no);
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
		
		$('#email_addr').change(function() {
			$('#email').val('');
			var email_id = $('#email_id').val()
			var email_addr = $(this).val()
			$('#email').val(email_id + email_addr);
		});
		
		$('#mil_yn').change(function() {
			var mil = $('#mil_yn').val();
			if(mil == 002) {
				$('.mil').css('display', 'none');
			} else {
				$('.mil').css('display', 'inline-block');
			}
		});
		
		$("img.ui-datepicker-trigger").attr("style","margin-left:5px; cursor:pointer;");
		
		$('#mil_enddate').change(function() {
			var mil_start = $('#mil_startdate').val().replaceAll('-', '');
			var mil_end = $(this).val().replaceAll('-', '');
			if(mil_start > mil_end) {
				alert('전역일이 입대일보다 전입니다.');
				setTimeout(function() { 
					$('#mil_enddate').focus(); 
				}, 10)
				return
			}
		});
		
		$('#name').blur(function() {
			var name = $('#name').val();
			var name_reg = /^[가-힣]{2,}$/;
			if(name != "" && !name_reg.test(name)) {
				alert('최소2글자, 한글만 사용 가능합니다');
				setTimeout(function() { 
					$('#name').focus(); 
				}, 10);
				return 
			}
		});
		
		$('#eng_name').blur(function() {
			var eng_name = $('#eng_name').val();
			var eng_name_reg = /^[a-zA-Z]*$/;
			if(eng_name != "" && !(eng_name_reg.test(eng_name))) {
				alert('영어 대소문자만 사용 가능합니다.');
				setTimeout(function() { 
					$('#eng_name').focus(); 
				}, 10);
				return 
			} 
		});
		
		$('#phone').focus(function() {
			var phone = $('#phone').val()
			$('#phone').val(phone.replaceAll('-', ''));
		});
		
		$('#phone').blur(function() {
			var phone = $('#phone').val();
			var phone_reg = /^[0-9]{9,11}$/;
			if(phone != "" && !phone_reg.test(phone)) {
				alert('- 없이 숫자만 입력해야합니다.');
				setTimeout(function() { 
					$('#phone').focus(); 
				}, 10)
			} else {
				$('#phone').val(autoHypenTel(phone));
			}
		});
		
		$('#hp').focus(function() {
			var hp = $('#hp').val()
			$('#hp').val(hp.replaceAll('-', ''));
		});
		
		$('#hp').blur(function() {
			var hp = $('#hp').val();
			var hp_reg = /^[0-9]{11}$/;
			if(hp != "" && !hp_reg.test(hp)) {
				alert('- 없이 11자리 숫자를 입력하세요.');
				setTimeout(function() { 
					$('#hp').focus(); 
				}, 10)
			} else {
				$('#hp').val(autoHypenTel(hp));
			}
		});
		
		$('#years').blur(function() {
			var years = $('#years').val();
			var years_reg = /^[0-9]*$/;
			if(years != "" && !years_reg.test(years)) {
				alert('숫자만 입력하세요.');
				setTimeout(function() { 
					$('#years').focus(); 
				}, 10)
			}
		});
		
		$('#email_id').blur(function() {
			var email = $('#email_id').val();
			var email_reg = /^[a-zA-Z0-9]*$/;
			if(email != "" && !email_reg.test(email)) {
				alert('영어대소문자, 숫자만 입력하세요');
				setTimeout(function() { 
					$('#email_id').focus(); 
				}, 10)
			}
		});
		
		$('#zip').blur(function() {
			var zip = $('#zip').val();
			var zip_reg = /^[0-9]{5}$/;
			if(zip != "" && !zip_reg.test(zip)) {}
			alert('숫자만 입력하세요');
			setTimeout(function() { 
				$('#zip').focus(); 
			}, 10)
		});
		
		$('#cmp_reg_no').focus(function() {
			var cmp_no = $('#cmp_reg_no').val().replaceAll('-', '');
			$('#cmp_reg_no').val(cmp_no);
		});
		
		$('#cmp_reg_no').blur(function() {
			var cmp_no = $('#cmp_reg_no').val();
			var cmp_no_reg = /^[0-9]{10}$/;
			if(cmp_no != "" && !(cmp_no_reg.test(cmp_no))) {
				alert('- 없이 10자리 숫자를 입력하세요');
			} else {
				var tmp = "";
				tmp += cmp_no.substr(0, 2);
				tmp += '-';
				tmp += cmp_no.substr(2, 3);
				tmp += '-';
				tmp += cmp_no.substr(5);
				$('#cmp_reg_no').val(tmp);
			}
		});
		
		$('#sbtn').click(function() {
			var salary = $('#salary').val();
			var zip = $('#zip').val();
			var years = $('#years').val();
			var retire_day = $('#retire_day').val();
			var sabun = $('#sabun').val();
			var name = $('#name').val();
			var id = $('#id').val();
			var pwd = $('#pwd').val();
			var hp = $('#hp').val();
			var email = $('#email').val();
			var join_day = $('#join_day').val();
			var pr_image = $('#profile_image').val();
			var cmp_image = $('#cmpfile').val();
			var cr_image = $('#crfile').val();
			
			if(!(name && id && pwd && hp && email && join_day)) {
				alert('필수 입력 내용을 확인하세요');
				return
			}
			
			if(!salary) {
				$('#salary').prop('disabled', true);
			} else {
				$('#salary').val(salary.replaceAll(',', ''));
			}
			
			if(!zip) {
				$('#zip').prop('disabled', true);
			}
			
			if(!years) {
				$('#years').prop('disabled', true);
			}
			
			if(!retire_day) {
				$('#retire_day').prop('disabled', true);
			}
			
			if(!pr_image) {
				$('#profile_image').prop('disabled', true);
			}
			
			if(!cmp_image) {
				$('#cmpfile').prop('disabled', true);
				$('#cmp_image_name').prop('disabled', true);
			}
			
			if(!cr_image) {
				$('#crfile').prop('disabled', true);
				$('#carrier_image_name').prop('disabled', true);
			}
			
			var data = new FormData($('#frm')[0]);
			$.ajax({ 
				url: '/insa/empRegProc.insa',
				data: data, 
				processData: false, 
				contentType: false,
				type: 'POST', 
				success: function(data) { 
					if(data.result == "IN") {
						alert("등록 완료");
					} else if(data.result == "UP") {
						alert("저장 완료");
					} else {
						alert("실패");
					}
				},
				error: function() {
					alert('####### 통신 에러 #######');
				}
			});
			
			if(salary.length == 4) {
				salary = salary.replace(/\B(?=(\d{3})+(?!\d))/g, ",");				
			} else if(salary.length == 8) {
				salary = salary.replace(/\B(?=(\d{3})+(?!\d))/g, ",");	
			}
			$('#salary').val(salary);
			$('#salary').prop('disabled', false);
			$('#zip').prop('disabled', false);
			$('#years').prop('disabled', false);
			$('#retire_day').prop('disabled', false);
			$('#profile_image').prop('disabled', false);
			$('#cmpfile').prop('disabled', false);
			$('#cmp_image_name').prop('disabled', false);
			$('#crfile').prop('disabled', false);
			$('#carrier_image_name').prop('disabled', false);
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
			<div class="w3-third w3-button w3-black" id="ebtn">수정</div>
			<div class="w3-third w3-button w3-black" id="dbtn">삭제</div>
			<input type="button" class="w3-third w3-button w3-black" value="이전" onclick="history.back()">
		</div>
	</div>
	<form method="POST" name="frm" id="frm" enctype="multipart/form-data">
		<div>
			<div class="inblock">
				<div class="mgl40 mgr40 pdAll40">
					<img class="imgBox300" src="/insa/img/noimage.jpg" id="img_view"><br>
					<input type="file" class="w3-hide" name="profile_image" id="profile_image" onchange="profileURL(this);"
						accept="image/*">
					<input type="button" class="inblock w180 mgt5 mgl60 bgcw" id="filebtn" value="사진올리기">
				</div>
			</div>
			<div class="inblock">
				<div class="mgb10 inblock">
					<div class="inblock">
						<label class="mgr30"">*사번</label>
						<input type="text" class="mgr30 w3-right-align bgcg" readonly="readonly" value="${DATA.sabun}" name="sabun" id="sabun">
					</div>
					<div class="inblock mgr30">
						<label for="name" class="mgr30">*한글성명</label>
						<input type="text" name="name" id="name" value="${DATA.name}">
					</div>
					<div class="inblock">
						<label for="eng_name" class="mgr30">영문성명</label>
						<input type="text" name="eng_name" id="eng_name" value="${DATA.eng_name}">
					</div>
				</div>
				<div class="mgb10">
					<label for="id" class="mgr30">*아이디</label>
					<input type="text" class="mgr30" name="id" id="id" value="${DATA.id}">
					<label for="pwd_view" class="w3-center mgr30 ">*패스워드</label>
					<input type="text" class="mgr30 w3-right-align" name="pwd_view" id="pwd_view" value="${DATA.pwd}">
					<input type="hidden" name="pwd" id="pwd" value="${DATA.pwd}">
					<label for="repwd_view" class="w3-center mgr30">*패스워드확인</label>
					<input type="text" class="w3-right-align" id="repwd_view">
					<input type="hidden" name="repwd" id="repwd">
				</div>
				<div class="mgb10">
					<label for="phone" class="mgr30">전화번호</label>
					<input type="text" class="mgr30 w3-right-align" name="phone" id="phone" value="${DATA.phone}">
					<label for="hp" class="mgr30">*핸드폰번호</label>
					<input type="text" class="mgr30 w3-right-align" name="hp" id="hp" value="${DATA.hp}">
					<label for="reg_no_view" class="mgr30">주민번호</label>
					<input type="text" class="w3-right-align" id="reg_no_view" value="${DATA.reg_no}">
					<input type="hidden" name="reg_no" id="reg_no" value="${DATA.reg_no}">
				</div>
				<div class="mgb10">
					<label for="years" class="mgr30">연령</label>
					<input type="text" class="mgr30 w3-right-align" name="years" id="years" value="${DATA.years}">
					<label for="email" class="mgr30">*이메일</label>
					<input type="text" class="mgr30 w150" name="email_id" id="email_id">
					<select class="w180 mgr20" id="email_addr">
						<option></option>
						<option value="@naver.com">@naver.com</option>
						<option value="@gmail.com">@gmail.com</option>
					</select>
					<input type="hidden" name="email" id="email" value="${DATA.email}">
					<label for="join_gbn_code" class="mgr30">직종체크</label>
					<select class="w180 mgr20" name="join_gbn_code" id="join_gbn_code">
						<option></option>
				<c:forEach var="data" items="${LIST1}">
						<option value="${data.code}" <c:if test="${DATA.join_gbn_code eq data.code}">selected</c:if>>${data.name}</option>
				</c:forEach>
					</select>
					<label for="sex" class="mgr30">성별</label>
					<select class="w180" name="sex" id="sex">
						<option></option>
				<c:forEach var="data" items="${LIST2}">
						<option value="${data.code}" <c:if test="${DATA.sex eq data.code}">selected</c:if>>${data.name}</option>
				</c:forEach>
					</select>
				</div>
				<div class="mgb10">
					<label for="zip" class="mgr30">주소</label>
					<input type="text" class="w150 mgr40 w3-right-align" placeholder="우편번호" name="zip" id="zip" value="${DATA.zip}">
					<input class="w80 mgr30 bgcw" type="button" id="saddr" value="주소검색">
					<input type="text" class="w480 mgr20" placeholder="주소" name="addr1" id="addr1" value="${DATA.addr1}">
					<input type="text" class="w480" placeholder="세부주소" name="addr2" id="addr2" value="${DATA.addr2}">
				</div>
				<div class="mgb20">
					<label for="pos_gbn_code" class="mbr5 pdr30">직위</label>
					<select name="pos_gbn_code" id="pos_gbn_code">
						<option></option>
				<c:forEach var="data" items="${LIST3}">
						<option value="${data.code}" <c:if test="${DATA.pos_gbn_code eq data.code}">selected</c:if>>${data.name}</option>
				</c:forEach>
					</select>
					<label for="dept_code" class="pdr30">부서</label>
					<select name="dept_code" id="dept_code">
						<option></option>
				<c:forEach var="data" items="${LIST4}">
						<option value="${data.code}" <c:if test="${DATA.dept_code eq data.code}">selected</c:if>>${data.name}</option>
				</c:forEach>
					</select>
					<label for="salary" class="pdr30" >연봉(만원)</label>
					<input type="text" class="phalign w3-right-align" name="salary" id="salary" placeholder="(만원)" value="${DATA.salary}">
				</div>
			</div>
		</div>
		<div>
			<div class="mgl80 mgb20">
					<label for="join_type" class="mbr5 pdr30">입사구분</label>
					<select class="mgr30" name="join_type" id="join_type">
						<option></option>
				<c:forEach var="data" items="${LIST5}">
						<option value="${data.code}" <c:if test="${DATA.join_type eq data.code}">selected</c:if> >${data.name}</option>
				</c:forEach>
					</select>
					<label for="gart_level" class="pdr30">등급</label>
					<select class="mgr30" name="gart_level" id="gart_level">
						<option></option>
				<c:forEach var="data" items="${LIST6}">
						<option value="${data.code}" <c:if test="${DATA.gart_level eq data.code}">selected</c:if> >${data.name}</option>
				</c:forEach>
					</select>
					<label for="put_yn" class="pdr30">투입여부</label>
					<select class="mgr30" name="put_yn">
						<option></option>
				<c:forEach var="data" items="${LIST7}">
						<option value="${data.code}" <c:if test="${DATA.put_yn eq data.code}">selected</c:if> >${data.name}</option>
				</c:forEach>
					</select>
					<label for="mil_yn" class="pdr30">군필여부</label>
					<select class="mgr30" name="mil_yn" id="mil_yn">
						<option></option>
				<c:forEach var="data" items="${LIST8}">
						<option value="${data.code}" <c:if test="${DATA.mil_yn eq data.code}">selected</c:if> >${data.name}</option>
				</c:forEach>
					</select>
			</div>
			<div class="mgl80 mgb20 mil">
					<label for="mil_type" class="mbr5 pdr30 mil">군별</label>
					<select class="mgr30" name="mil_type" id="mil_type">
						<option></option>
				<c:forEach var="data" items="${LIST9}">
						<option value="${data.code}" <c:if test="${mil_type eq data.code}">selected</c:if> >${data.name}</option>
				</c:forEach>
					</select>
					<label for="mil_level" class="pdr30 mil">계급</label>
					<select class="mgr30" name="mil_level" id="mil_level">
						<option></option>
				<c:forEach var="data" items="${LIST10}">
						<option value="${data.code}" <c:if test="${mil_level eq data.code}">selected</c:if> >${data.name}</option>
				</c:forEach>
					</select>
					<label for="mil_startdate" class="pdr30">입영일자</label>
					<input type="text" name="mil_startdate" id="mil_startdate" readonly="readonly" value="${DATA.mil_startdate}">
					<label for="mil_enddate" class="pdr30">전역일자</label>
					<input type="text" name="mil_enddate" id="mil_enddate" readonly="readonly" value="${DATA.mil_enddate}">
			</div>
			<div class="mgl80 mgb20">
					<label for="kosa_reg_yn" class="mbr5 pdr30">KOSA등록</label>
					<select class="mgr30" name="kosa_reg_yn" id="kosa_reg_yn">
						<option></option>
				<c:forEach var="data" items="${LIST11}">
						<option value="${data.code}" <c:if test="${DATA.kosa_reg_yn eq data.code}">selected</c:if> >${data.name}</option>
				</c:forEach>
					</select>
					<label for="kosa_class_code" class="pdr30">KOSA등급</label>
					<select class="mgr30" name="kosa_class_code" id="kosa_class_code">
						<option></option>
				<c:forEach var="data" items="${LIST12}">
						<option value="${data.code}" <c:if test="${DATA.kosa_class_code eq data.code}">selected</c:if> >${data.name}</option>
				</c:forEach>
					</select>
					<label for="join_day" class="pdr30">*입사일자</label>
					<input type="text" name="join_day" id="join_day" readonly="readonly" value="${DATA.join_day}">
					<label for="retire_day" class="pdr30">퇴사일자</label>
					<input type="text" name="retire_day" id="retire_day" readonly="readonly" value="${DATA.retire_day}">
			</div>
			<div class="mgl80 mgb20">
					<label for="cmp_reg_no" class="mbr5 pdr30 ">사업자번호</label>
					<input type="text" class="w3-right-align" name="cmp_reg_no" id="cmp_reg_no" value="${DATA.cmp_reg_no}">
					<label for="crm_name" class="pdr30">업체명</label>
					<input type="text" name="crm_name" id="crm_name" value="${DATA.crm_name}">
					<label for="cmp_reg_image" class="pdr30">사업자등록증</label>
					<input type="text" name="cmp_reg_image_name" id="cmp_reg_image_name" readonly="readonly" value="${DATA.cmp_reg_image}">
					<input type="button" class="inblock w150 bgcw" value="미리보기" id="cmp_img">
					<input type="button" class="inblock w150 bgcw" value="등록" id="cmpbtn">
					<input type="file" class="w3-hide" name="cmp_reg_image" id="cmpfile" onchange="cmpfileURL(this);"
							accept="image/*">
			</div>
			<div class="mgl80 mgb20">
					<label for="self_intro" class="mbr5 pdr30">자기소개</label>
					<textarea rows="2" cols="80" name="self_intro" id="self_intro" 
							placeholder="100자 내외로 적으시오." maxlength="110">${DATA.self_intro}</textarea>
					<label class="mbr5 pdr30">이력서</label>
					<input type="text" id="carrier_image_name" name="carrier_image_name" readonly="readonly" value="${DATA.carrier_image}">
					<input type="button" class="inblock w150 bgcw" value="다운" id="self_img">
					<input type="button" class="inblock w150 bgcw" value="파일업로드" id="crbtn">
					<input type="file" class="w3-hide" name="carrier_image" id="crfile" onchange="crfileURL(this);"
							accept="image/*">
			</div>
		</div>
	</form>
	
	<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
    	<div class="w3-modal-content w3-animate-zoom mxw550">
      		<img id="crfile_img" style="width:100%">
    	</div>
  	</div>
  	
  	<div id="modal02" class="w3-modal" onclick="this.style.display='none'">
    	<div class="w3-modal-content w3-animate-zoom mxw550">
      		<img id="cmpfile_img" style="width:100%">
    	</div>
  	</div>
</body>
</html>