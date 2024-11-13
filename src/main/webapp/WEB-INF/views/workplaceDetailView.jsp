<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>manager</title>
  <%@include file="semantic/header.jsp"%>
</head>
<body>
<main style="height: 500px">
    <div class="mb-3 row">
      <span><b>사업장 상세 정보</b></span>
    </div>
    <div class="mb-3 row">
      <label for="inputCeo" class="col-sm-2 col-form-label">측정 대상 사업장</label>
      <div class="col-sm-10">
        <input type="text" name="workplace_name" class="form-control" id="inputCeo" value="${workplace.workplace_name}">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="inputAddress" class="col-sm-2 col-form-label">업체 주소</label>
      <div class="col-sm-10">
        <input type="text" name="address" class="form-control" id="inputAddress" value="${workplace.address}">
      </div>
    </div>
    <button id="updateBtn" class="btn btn-primary" type="button">수정 하기</button>
</main>

<script>
  $(document).ready(function(){
    $('#updateBtn').on('click',function(){
      if (!confirm("수정하시겠습니까?")) return;

      const workplaceInfo = {};

      $('input').each(function(){
        let name = String($(this).attr('name'));
        workplaceInfo[name] = $(this).val();
      });

      $.ajax({
        type: 'PATCH',
        url: "<c:url value='/manager/workplace/${workplace.workplace_id}'/>",
        headers : { "Content-Type": "application/json"},
        dataType : 'text',
        data : JSON.stringify(workplaceInfo),
        success: function() {
          alert("업데이트에 성공했습니다.");
          location.reload();
        },
        error: function() {
          alert("실패했습니다.");
        }
      });
    });
  });
</script>
</body>
</html>
