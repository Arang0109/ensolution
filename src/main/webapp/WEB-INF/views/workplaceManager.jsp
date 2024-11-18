<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
<%@include file="layouts/modal/workplaceModal.jsp"%>
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <div class="container" style="padding: 1.875rem 0 0">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <h4><span class="badge text-bg-primary">측정대상 사업장 관리</span></h4>
        <div>
          <button type="button" class="btn btn-primary mx-1" data-bs-toggle="modal" data-bs-target="#workplaceAdd">
            사업장 추가
          </button>
          <button id="removeBtn" class="btn btn-primary mx-1">사업장 삭제</button>
          <form action="" id="removeForm"></form>
        </div>
      </div>
      <%@include file="layouts/tables/workplaceTable.jsp"%>
    </div>
  </div>
</main>
<footer class="w-100">
</footer>

<script>
  $(document).ready(function(){
    $('.js-example-basic-single').select2({
      dropdownParent: $('#workplaceAdd'),
      width: 'resolve'
    });

    $('#removeBtn').on("click", function() {
      if (!confirm("삭제 후 복구가 불가능 합니다. 정말로 삭제 하시겠습니까?")) return;

      const selectedWorkplace = [];

      $('#table tbody input[type="checkbox"]:checked').each(function() {
        const workplace_id = $(this).closest('tr').attr('data-workplace-id');
        selectedWorkplace.push({"workplace_id": workplace_id});
      });

      if (selectedWorkplace.length === 0) return alert("사업장을 선택해 주세요.");

      $.ajax({
        url: '<c:url value="/manager/workplace"/>',
        type: 'DELETE',
        contentType: 'application/json',
        data: JSON.stringify(selectedWorkplace),
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
  if (msg=="Success Add Workplace") alert("사업장 추가 완료");
</script>
</body>
</html>
