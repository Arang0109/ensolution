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
<!-- modal layer -->
<%@include file="layouts/modal/workplaceModal.jsp"%>
<!-- navigation bar layout -->
<%@include file="semantic/navbar.jsp"%>
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <div class="container">
    <div class="profile-header">
      <div class="profile-main d-flex justify-content-between">
        <div class="d-flex">
          <h4>${company.company_name}</h4>
          <span style="margin-left: 1.25rem;">${company.address}</span>
        </div>
        <div >
          <button id="modifyBtn" class="btn btn-primary btn-sm" type="button">수정</button>
          <a class="btn btn-primary btn-sm" href="<c:url value="/manager/company"/>">목록</a>
        </div>
      </div>
    </div>
  </div>
  <div id="companyInfo" class="container">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-start">
        <p style="margin-left: 1.25rem;"><b>업체 정보</b></p>
      </div>
      <hr>
      <div class="container text-center">
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="company_name">측정대행 의뢰업체</span>
              <input name="company_name" type="text" class="form-control" value="${company.company_name}"
                     aria-label="Username" aria-describedby="addon-wrapping" ${mode=="modify" ? "" : "readonly='readonly'"}>
            </div>
          </div>
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="address">주소</span>
              <input name="address" type="text" class="form-control" value="${company.address}"
                     aria-label="Username" aria-describedby="addon-wrapping" ${mode=="modify" ? "" : "readonly='readonly'"}>
              <span class="input-group-text" id="addon-wrapping">
                    <a id="naverMapLink" href="" class="link-dark link-offset-2 link-underline link-underline-opacity-0">네이버 지도</a>
              </span>
            </div>
          </div>
        </div>
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="ceo_name">대표자명</span>
              <input name="ceo_name" type="text" class="form-control" value="${company.ceo_name}"
                     aria-label="Username" aria-describedby="addon-wrapping" ${mode=="modify" ? "" : "readonly='readonly'"}>
            </div>
          </div>
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="biz_number">사업자등록번호</span>
              <input name="biz_number" type="text" class="form-control" value="${company.biz_number}"
                     aria-label="Username" aria-describedby="addon-wrapping" ${mode=="modify" ? "" : "readonly='readonly'"}>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container" style="padding-top: 1.875rem;">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <p style="margin-left: 1.25rem;"><b>사업장 목록</b></p>
        <div>
          <button type="button" class="btn btn-primary btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            사업장 추가
          </button>
          <button id="removeBtn" class="btn btn-primary btn-sm mb-3">사업장 삭제</button>
        </div>
      </div>
      <hr>
      <%@include file="layouts/tables/workplaceTable.jsp"%>
    </div>
  </div>
</main>

<script>
  $(document).ready(function(){
    $('#removeBtn').on("click", function() {
      if (!confirm("삭제 후 복구가 불가능 합니다. 정말로 삭제 하시겠습니까?")) return;

      const selectedWorkplace = [];

      $('#table tbody input[type="checkbox"]:checked').each(function() {
        const workplace_id = $(this).closest('tr').attr('data-workplace-id');
        selectedWorkplace.push({"workplace_id": workplace_id});
      });

      if (selectedWorkplace.length === 0) return alert("사업장을 선택해 주세요.");

      $.ajax({
        url: '<c:url value="/manager/company/delete/workplaces"/>',
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

    $("#naverMapLink").on("click", function () {
      const url = "https://map.naver.com/p/search/" + $("#companyInfo input[name=address]").val();
      window.open(url, '_blank');
    });

    $("#modifyBtn").on("click", function(){
      let isReadonly = $("#companyInfo input").attr('readonly');

      if(isReadonly==='readonly') {
        $("#companyInfo input").attr('readonly', false);
        $("#modifyBtn").html("저장");
        return;
      }

      if (!confirm("수정 하시겠습니까?")) return;

      const companyInfo = {};

      $('#companyInfo input').each(function(){
        let name = String($(this).attr('name'));
        companyInfo[name] = $(this).val();
      });

      $.ajax({
        type: 'PATCH',
        url: "<c:url value='/manager/company/${company.company_id}'/>",
        headers : { "Content-Type": "application/json"},
        dataType : 'text',
        data : JSON.stringify(companyInfo),
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
