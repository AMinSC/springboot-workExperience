<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>join_view</title>
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
</head>
<body>
	<form name="joinForm" method="post" action="join_db.jsp">
		<p id="text">회원가입</p>
		<p>
			<label>이름: <input type="text" name="username" id="userName" maxlength='6' ></label>
		</p>
		<p>
			<label>
				주민번호: <input type="text" name="userjumin" id="userJumin" maxlength='6'
							>
				 - <input type="text" name="usergender" id="userGender" maxlength='1'
				 		>
				 xxxxxx
			</label>
		</p>
		<p>
			통신사: <br>
			<label><input type="checkbox" name="tel" class="tel" value="SK"
			onclick="checkOnlyOneTogglBox(this)"/>SK</label>
			<label><input type="checkbox" name="tel" class="tel" value="KT"
			onclick="checkOnlyOneTogglBox(this)"/>KT</label>
			<label><input type="checkbox" name="tel" class="tel" value="LG"
			onclick="checkOnlyOneTogglBox(this)"/>LG</label>
			<label><input type="checkbox" name="tel" class="tel" value="SUB"
			onclick="checkOnlyOneTogglBox(this)"/>알뜰
				<select name="tel" id="telSub" disabled>
				  <option value="0">선택</option>
				  <option value="SK알뜰">SK알뜰</option>
				  <option value="KT알뜰">KT알뜰</option>
				  <option value="CJ모바일">CJ모바일</option>
				</select>
			</label>
		</p>
		<p>
			<label>핸드폰 번호: <input type="text" name="userphone" id="userPhone" maxlength='13'
								oninput="phoneAutoHyphen(this)"></label>
		</p>
		<p>
			<label>이메일: <input type="text" name="userEmail" id="userEmail" maxlength='20'></label>
			@
			<select name="email" id="emailAddr" >
			  <option value="0">선택</option>
			  <option value="naver.com">naver.com</option>
			  <option value="gmail.com">gmail.com</option>
			  <option value="daum.net">daum.net</option>
			</select>
		</p>
		<p>
			<input type="button" value="확인" onclick="sendit()">
		</p>
		
		
		<div id="result"></div>
	</form>
	<!-- <script src="/resource/static/js/register.js" > -->
	<script>
	
		function sendit() {
			
			const name = document.getElementById('userName');
			const jumin = document.getElementById('userJumin');
			const gender = document.getElementById('userGender');
			const phone = document.getElementById('userPhone');
			const email = document.getElementById('userEmail');
			const emailAddr = document.getElementById('emailAddr');
			const result = document.getElementById('result');
			
			var checkedTel = $('input:checkbox[name="tel"]:checked').val();
			
			const regex = /^[ㄱ-ㅎ|가-힣|]+$/;
			const regex2 = /[a-z|A-Z|0-9|]+$/;
			
			
			if (onlyNumber(jumin.value)) {
				jumin.focus();
			} else if (onlyNumber(gender.value)) {
				gender.focus();
			} else if (!regex.test(name.value)) {
				name.focus();
			} else if (!regex2.test(email.value)) {
				email.focus();
			} else if (emailAddr.value === "0") {
				emailAddr.focus();
			} else {
				if (checkedTel === "SUB") {
					checkedTel = document.getElementById('telSub').value;
					if (checkedTel.value === "0") {
						checkedTel.focus();
					}
				}
				
				const resultText = '<p>결과</p>' +
				'<p>이름: ' + name.value + '</p>' +
				'<p>주민번호: ' + jumin.value + ' - ' + gender.value + 'xxxxxx</p>' +
				'<p>' + checkedTel + " " + phone.value.replaceAll("-", "") + '</p>' +
				'<p>' + email.value + '@' + emailAddr.value + '</p>';
				
				result.innerHTML = resultText;
				
				console.log(name.value, jumin.value, gender.value, phone.value.replaceAll("-", ""), 
						checkedTel, email.value, emailAddr.value)
			}
			

		}
		
		
		function onlyNumber(numString) {
			
			for (var i = 0; i < numString.length; i++) {
				var asciiCheck = numString.charCodeAt(i);
				if (asciiCheck < 48 || asciiCheck > 57) {
					return true;
				}
			}
			return false;
		}
		
		
	
		function checkOnlyOneTogglBox(checkbox) {
			
			// 1. 텍스트 박스 element 찾기
			const selcet_elem = document.getElementById('telSub');
			
			const checkboxes 
				= document.getElementsByName("tel");
		  
			checkboxes.forEach((cb) => {
			    cb.checked = false;
		    })
			  
		    checkbox.checked = true;
			
			// 2-1. 체크박스 선택여부와 SUB를 가리키고 있는지 확인
			// 2-2. 체크박스 선택여부에 따라 선택박스 활성화/비활성화
			if (checkbox.checked && checkbox.value === "SUB") {
				selcet_elem.disabled = false;
			} else {
				selcet_elem.disabled = true;
			}
			  
			// 3. 선택박스가 활성화 된 경우 포커스 이동
			if (selcet_elem.disabled) {
				selcet_elem.focus();
			} 
		}
		
		
		const phoneAutoHyphen = (target) => {
			target.value = target.value
			  .replace(/[^0-9]/g, '')
			  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}
		
	</script>
</body>

</html>