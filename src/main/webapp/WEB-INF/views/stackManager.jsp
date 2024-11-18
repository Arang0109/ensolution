<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>manager</title>
  <%@include file="semantic/header.jsp"%>
</head>
<body class="d-flex flex-wrap">
<!-- navigation bar layout -->
<%@include file="semantic/navbar.jsp"%>
<!-- modal layer -->
<%@include file="layouts/modal/stackModal.jsp"%>
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <div class="container" style="padding: 1.875rem 0 0">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <h4><span class="badge text-bg-primary">측정 시설 관리</span></h4>
        <div>
          <button type="button" class="btn btn-primary mx-1" data-bs-toggle="modal" data-bs-target="#stackAdd">
            시설 추가
          </button>
          <button id="removeBtn" class="btn btn-primary mx-1">시설 삭제</button>
        </div>
      </div>
      <%@include file="layouts/tables/stackTable.jsp"%>
    </div>
  </div>
</main>
<footer class="w-100">

</footer>

<script>
  $(document).ready(function(){
    $('#removeBtn').on("click", function() {
      if (!confirm("삭제 후 복구가 불가능 합니다. 정말로 삭제 하시겠습니까?")) return;

      const selectedStack = [];

      $('#table tbody input[type="checkbox"]:checked').each(function() {
        const stack_id = $(this).closest('tr').attr('data-stack-id');
        selectedStack.push({"stack_id": stack_id});
      });

      if (selectedStack.length === 0) return alert("시설을 선택해 주세요.");

      $.ajax({
        url: '<c:url value="/manager/stack"/>',
        type: 'DELETE',
        contentType: 'application/json',
        data: JSON.stringify(selectedStack),
        success: function() {
          alert("삭제 완료");
          location.reload();
        },
        error: function() {
          alert("삭제에 실패했습니다.");
        }
      });
    });
  });

  let msg = "${msg}";
  if (msg=="Success Add Stack") alert("시설 추가 완료");
</script>
</body>
</html>
