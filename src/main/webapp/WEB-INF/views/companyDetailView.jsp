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
<!-- navigation bar layout -->
<%@include file="semantic/navbar.jsp"%>
<!-- modal layer -->
<%@include file="layouts/modal/workplaceModal.jsp"%>
<%@include file="layouts/toast/toasts.jsp"%>
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
          <a class="btn btn-primary btn-sm" href="<c:url value="/management/company"/>">목록</a>
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
      <form id="companyInfoForm" class="needs-validation" novalidate>
        <div class="container text-center">
          <div class="row p-2">
            <input name="company_id" type="text" class="form-control" value="${company.company_id}" readonly='readonly' hidden="hidden">
            <div class="col">
              <div class="input-group flex-nowrap">
                <span class="input-group-text" id="company_name">측정대행 의뢰업체 <small><b>(필수)</b></small></span>
                <input name="company_name" type="text" class="form-control" value="${company.company_name}"
                       aria-label="Username" aria-describedby="addon-wrapping" required
                       readonly='readonly'>
              </div>
            </div>
            <div class="col">
              <div class="input-group flex-nowrap">
                <span class="input-group-text" id="address">업체 주소</span>
                <input name="address" type="text" class="form-control" value="${company.address}"
                       aria-label="Username" aria-describedby="addon-wrapping" readonly='readonly'>
                <span class="input-group-text" id="addon-wrapping">
                    <a id="naverMapLink" href="" class="link-dark link-offset-2 link-underline link-underline-opacity-0">네이버 지도</a>
              </span>
              </div>
            </div>
          </div>
          <div class="row p-2">
            <div class="col">
              <div class="input-group flex-nowrap">
                <span class="input-group-text" id="ceo_name">대표자 이름</span>
                <input name="ceo_name" type="text" class="form-control" value="${company.ceo_name}"
                       aria-label="Username" aria-describedby="addon-wrapping" readonly='readonly'>
              </div>
            </div>
            <div class="col">
              <div class="input-group flex-nowrap">
                <span class="input-group-text" id="biz_number">사업자 번호 <small>(10자리 숫자)</small></span>
                <input
                    type="text"
                    name="biz_number"
                    value="${company.biz_number}"
                    class="form-control"
                    id="inputBizNum"
                    aria-label="Username"
                    aria-describedby="addon-wrapping"
                    readonly='readonly'
                    maxlength="12"
                    pattern="^\d{3}-\d{2}-\d{5}$"
                    placeholder="000-00-00000">
              </div>
            </div>
          </div>
        </div>
      </form>
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

<script src="<c:url value='/js/business-management.js'/>"></script>
<script>
  $(document).ready(function(){
    const workplaceAddResult = '${workplaceAddResult}';
    if (workplaceAddResult) {
      const msg = {
        successMsg: 'workplace: ' + '\"${workplaceName}\"' + ', 사업장이 추가 되었습니다.',
        failedMsg: '\"${workplaceName}\"' + ', 사업장이 이미 존재 합니다.',
      }
      loadToast(workplaceAddResult, msg);
    }
    setupValidation('#workplace_form');
    bizNumFormatter('#inputBizNum');
    mapView('#naverMapLink', $('#companyInfoForm input[name=address]').val());
    $('#removeBtn').on('click', function() {
      const options = {
        tableSelector: '#table',
        dataAttr: 'data-workplace-id',
        idKey: 'workplace_id',
        url: '<c:url value="/management/workplace/delete"/>' // controller.business.BusinessRestController.deleteWorkplace
      }

      businessDeleteHandler(options);
    });
    $('#modifyBtn').on('click', function(){
      const options = {
        selector: $('#companyInfoForm'),
        url: '<c:url value='/management/company/modify'/>' // controller.business.BusinessRestController.updateCompany
      }
      businessModifyHandler(options);
    });
  });
</script>
</body>
</html>
