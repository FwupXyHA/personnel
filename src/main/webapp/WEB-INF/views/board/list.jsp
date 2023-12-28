<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>

    <div class="card border-0">
      <div class="card-body">

        <!-- Search form -->
        <form class="form-inline d-flex justify-content-center md-form form-sm active-cyan-2 mt-2">


          <!-- Material inline 1 -->
          <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="inlineRadio1" name="searchType" value="all" ${scri.searchType == 'all' ? 'checked' : ''}>
            <label class="form-check-label" for="inlineRadio1">전체</label>
          </div>

          <!-- Material inline 2 -->
          <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="inlineRadio2" name="searchType" value="on" ${scri.searchType == 'on' ? 'checked' : ''}>
            <label class="form-check-label" for="inlineRadio2">근무자</label>
          </div>

          <!-- Material inline 3 -->
          <div class="form-check form-check-inline">
            <input type="radio" class="form-check-input" id="inlineRadio3" name="searchType" value="off" ${scri.searchType == 'off' ? 'checked' : ''}>
            <label class="form-check-label" for="inlineRadio3">퇴사자</label>
          </div>



          <input class="form-control form-control-sm mr-3 ml-3" type="text" placeholder="성명" aria-label="Search" name="keyword" id="keywordInput" value="${scri.keyword}"/>
          <button class="fas fa-search" aria-hidden="true" id="searchBtn"></button>
        </form>
          <script>
						$(function() {
							$('#searchBtn').click(function() {
							// URL 조립
							var url = "list" + '${pageMaker.makeQuery(1)}' + 
									  "&searchType=" + $("input[name='searchType']:checked").val() +	// 라디오 버튼 선택값 가져오기
									  "&keyword=" + encodeURIComponent($('#keywordInput').val());
							
							// 검색 결과 페이지로 이동
							window.location.href = url;
							});
						});
					</script>
      </div>
    </div>



    <div class="table-responsive-xl">
      <table class="table table-hover table-striped table-bordered">
        <thead class="thead-dark">
          <tr>
            <th scope="col">선택</th>
            <th scope="col">사원번호</th>
            <th scope="col">성명</th>
            <th scope="col">주민번호</th>
            <th scope="col">부서명</th>
            <th scope="col">입사일</th>
            <th scope="col">퇴사일</th>
            <th scope="col">Email</th>

          </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="list">
          <tr>
            <td>
            <input type="checkbox" id="selEmp" name="selEmp" value="${list.employee_id }">
            </td>
            <td><c:out value="${list.employee_id }"/></td>
            <td><c:out value="${list.name }"/></td>
            <td><c:out value="${list.reg_no }"/></td>
            <td><c:out value="${list.dept_name }"/></td>
            <td><c:out value="${list.hire_date }"/></td>
            <td><c:out value="${list.leave_date }"/></td>
            <td><c:out value="${list.email }"/></td>

          </tr>
          </c:forEach>

        </tbody>
      </table>

    </div>

    <div class="card border-0">
      <div class="card-body">
        				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  	<c:if test="${pageMaker.prev}">
				    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				    </c:if>
				    
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    </c:forEach>
				    
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">	
				    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage  + 1)}">다음</a></li>
				    </c:if>
				  </ul>
				</nav>
      </div>
    </div>

    <div class="card border-0">
      <div class="card-body pl-0 pt-0">
        <div class="btn-group" role="group" aria-label="buttons">
        <a href="/board/registerView"><button type="button" class="btn btn-dark mr-3">추가</button></a>
        <button type="button" class="btn btn-dark">삭제</button>
        </div>
      </div>
    </div>
	<script>
	$(document).ready(function() {			
	    // 추가
	    $(".create_btn").on("click", function() {
	        location.href = "board/registerView"; // 페이지 경로 확인 후 수정
	    });
	    
	    // 삭제
	    $(".delete_btn").on("click", function() {		
	        var deleteYN = confirm("삭제하시겠습니까?");
	        
	        if(deleteYN == true) {
	        	
	        	var idList = [];
		        
		        $("input[name='chBox']:checked").each(function() {
		            idList.push($(this).val());		// 체크된 것만 값을 뽑아서 배열에 push
		        });
		        console.log(idList);
		       	        	        
		        $.ajax({
		            url : "board/delete", // AJAX 요청의 경로 확인 후 수정
		            type : "POST",
		            data : { 
		            	empIdList : idList 
		            },
		            success : function(response) {
		                console.log("서버 응답: " + response + " 삭제 성공");
		          		window.location.href = "board/list";
		            },
		            error: function(xhr, status, error) {
		                console.error("에러: " + error);
		            }
		        });	
	        }
	    });
	});
	</script>
  </div>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
