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
<div class="modal fade" id="workplaceAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="workplaceAddLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="workplaceAddLabel">사업장 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="<c:url value="/manager/workplace"/>" method="post" id="workplace_form">
        <div class="modal-body m-2">
          <div class="mb-3 row d-flex justify-content-center">
            <label for="companyList" class="form-label">측정 대행 의뢰 업체</label>
            <select class="js-example-basic-single" id="companyList" name="company_id" style="width: 50%" name="state">
              <c:forEach var="company" items="${companies}">
                <option value="${company.company_id}">${company.company_name}</option>
              </c:forEach>
            </select>
          </div>
          <div class="mb-3 row">
            <label for="inputWorkplace" class="form-label">측정 대상 사업장</label>
            <input type="text" name="workplace_name" class="form-control" id="inputWorkplace">
          </div>
          <div class="mb-3 row">
            <label for="inputAddress" class="form-label">사업장 주소</label>
            <input type="text" name="address" class="form-control" id="inputAddress">
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">추가</button>
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
        </div>
      </form>
    </div>
  </div>
</div>
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
      <div>
        <table id="table"
               data-toggle="table"
               data-locale="ko-KR"
               data-search="true"
               data-height="550"
               data-pagination="true"
               data-checkbox-header="true"
               data-click-to-select="true"
               data-show-columns="true"
               data-buttons-class="primary"
               data-buttons-align="left">
          <thead>
          <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="workplace_name">측정 대상 사업장 <span class="badge text-bg-primary">수정시 사업장명 클릭</span></th>
            <th data-field="address">주소</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="workplace" items="${workplaces}">
            <tr data-workplace-id="${workplace.workplace_id}">
              <td></td>
              <td><a class="updateLink"
                     href="<c:url value='/manager/workplace/${workplace.workplace_id}'/>">
                  ${workplace.workplace_name != null ? workplace.workplace_name : 'N/A'}</a></td>
              <td>${workplace.address != null ? workplace.address : 'N/A'}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</main>
<footer class="w-100">
</footer>

<script>
  $(document).ready(function(){
    $('.js-example-basic-single').select2({
      dropdownParent: $('#staticBackdrop'),
      width: 'resolve'
    });

    $('.updateLink').on("click", function() {
      window.open(this.href, '_blank', 'width=400, height=500');
      return false;
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
