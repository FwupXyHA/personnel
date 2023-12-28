<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp"%>
<%@ page import="com.mycompany.personnel.vo.BoardVO"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<script type="text/javascript">
		$(document).ready(function() {
			// 저장
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function() {
				if(fn_valiChk()) {
					return false;
				}
				formObj.attr("action", "/board/register");
				formObj.attr("method", "post");
				formObj.submit();
			});
			
			// 취소
			$(".cancel_btn").on("click", function() {
				event.preventDefault();
				location.href = "/board/list";
			});
		})
		function fn_valiChk() {
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i < regForm; i++) {
				console.log($(".chk").eq(i).val()); // 검증 중인 값을 로그에 기록
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
					alert($(".chk").eq(i).attr("title"));
					return true;
				}	
			}
		}
	</script>


<section id="container">
	<div class="col-lg-12 well">
		<div class="row">
			<form role="form" name="writeForm" method="post" action="/board/register">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-6 form-group">
							<label for="name">성명</label> <input id="name" name="name"
								type="text" placeholder="성명" class="form-control chk" title="성명을 입력하세요.">
						</div>
						<div class="col-sm-6 form-group">
							<label for="reg_no">주민번호</label> <input id="reg_no" name="reg_no" 
								type="text" placeholder="주민번호" class="form-control chk" title="주민번호를 입력하세요.">
						</div>
					</div>
					<div class="form-group">
						<label for="address">주소</label>
						<textarea id="address" name="address" placeholder="주소" rows="3"
							class="form-control chk" title="주소를 입력하세요."></textarea>
					</div>
					<div class="row">
						<div class="col-sm-4 form-group">
							<label for="hire_date">입사일</label> <input id="hire_date"
								name="hire_date" type="date" placeholder="입사일"
								class="form-control chk" title="입사일을 입력하세요.">
						</div>


						<div class="col-sm-4 form-group">
							<label for="dept">부서</label>
							<form:select id="department_id" name="department_id" path="depts"
								class="form-control chk">
								<form:options items="${depts }" itemLabel="dept_name"
									itemValue="department_id" title="부서를 선택하세요."/>
							</form:select>
						</div>

						<div class="col-sm-4 form-group">
							<label for="leave_date">퇴사일</label> <input id="leave_date"
								name="leave_date" type="date" placeholder="퇴사일"
								class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4 form-group">
							<label for="bank">급여은행</label>
							<form:select name="bank_id" id="bank_id" path="banks"
								class="form-control chk">
								<form:options items="${banks }" itemLabel="bank_name"
									itemValue="bank_id" title="급여은행을 선택하세요." />
							</form:select>
						</div>

						<div class="col-sm-8 form-group">
							<label for="bank_account">급여계좌</label> <input id="bank_account"
								name="bank_account" type="text" placeholder="급여계좌"
								class="form-control chk" title="급여계좌를 입력하세요.">
						</div>
					</div>
					<div class="form-group">
						<label for="phone_number">전화번호</label> <input id="phone_number"
							name="phone_number" type="tel" placeholder="전화번호"
							class="form-control chk" title="전화번호를 입력하세요.">
					</div>
					<div class="form-group">
						<label for="email">Email </label> <input id="email" name="email"  title="Email을 입력하세요."
							type="email" placeholder="Email" class="form-control chk">
					</div>
					<button type="submit" class="btn btn-primary write_btn">저장</button>
					<button type="submit" class="btn btn-secondary cancel_btn">취소</button>
			</form>
		</div>
	</div>
	</div>

	</div>
</section>













<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</body>

</html>
