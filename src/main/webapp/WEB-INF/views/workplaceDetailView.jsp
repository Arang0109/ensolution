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
<%@include file="layouts/modal/stackModal.jsp"%>
<%@include file="layouts/modal/ExcelUploadModal.jsp"%>
<%@include file="layouts/toast/toasts.jsp"%>
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <div class="container">
    <div class="profile-header">
      <div class="profile-main d-flex justify-content-between">
        <div class="d-flex">
          <h4><a class="link-opacity-50 link-offset-2 link-underline link-underline-opacity-0"
              href="<c:url value='/management/company/${company.company_id}'/>">${company.company_name}</a> /
            ${workplace.workplace_name}</h4>
          <span style="margin-left: 1.25rem;">${workplace.address}</span>
        </div>
        <div >
          <button id="modifyBtn" class="btn btn-primary btn-sm" type="button">수정</button>
          <a class="btn btn-primary btn-sm" href="<c:url value="/management/workplace"/>">목록</a>
        </div>
      </div>
    </div>
  </div>
  <div id="workplaceInfo" class="container">
    <div class="border p-4" style="background-color: white;">
      <p style="margin-left: 1.25rem;"><b>사업장 정보</b></p>
      <hr>
      <form id="workplaceInfoForm" class="needs-validation" novalidate>
        <div class="container text-center">
          <input name="workplace_id" type="text" class="form-control" value="${workplace.workplace_id}" readonly='readonly' hidden="hidden">
          <div class="row p-2">
            <div class="col">
              <div class="input-group flex-nowrap">
                <span class="input-group-text" id="workplace_name">측정대상 사업장 <small><b>(필수)</b></small></span>
                <input name="workplace_name" type="text" class="form-control" value="${workplace.workplace_name}"
                       aria-label="Username" aria-describedby="addon-wrapping" readonly='readonly' required>
              </div>
            </div>
            <div class="col">
              <div class="input-group flex-nowrap">
                <span class="input-group-text" id="address">사업장 주소</span>
                <input name="address" type="text" class="form-control" value="${workplace.address}"
                       aria-label="Username" aria-describedby="addon-wrapping" readonly='readonly'>
                <span class="input-group-text" id="addon-wrapping">
                    <a id="naverMapLink" href="" class="link-dark link-offset-2 link-underline link-underline-opacity-0">네이버 지도</a>
              </span>
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
        <p style="margin-left: 1.25rem;"><b>측정시설 목록</b></p>
        <div>
          <button type="button" class="btn btn-primary btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            측정시설 추가
          </button>
          <button id="removeBtn" class="btn btn-primary btn-sm mb-3">측정시설 삭제</button>
          <button id="excelAddBtn" class="btn btn-primary btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#excelUpload">엑셀 데이터 한번에 넣기</button>
        </div>
      </div>
      <hr>
      <%@include file="layouts/tables/stackTable.jsp"%>
    </div>
  </div>
</main>

<script src="<c:url value='/js/business-management.js'/>"></script>
<script>
  $(document).ready(function(){
    const stackAddResult = '${stackAddResult}';
    if (stackAddResult) {
      const msg = {
        successMsg: 'stack: ' + '\"${stackName}\"' + ', 시설이 추가 되었습니다.',
        failedMsg: '\"${stackName}\"' + ', 시설이 이미 존재 합니다.',
      }
      loadToast(stackAddResult, msg);
    }
    setupValidation('#stack_form');
    mapView('#naverMapLink', $('#workplaceInfo input[name=address]').val());
    uploadMeasurementExcelData('#stack-measurement-file');
    $('#removeBtn').on('click', function() {
      const options = {
        selector: '#table tbody input[type="checkbox"]:checked',
        closestTag: 'tr',
        dataAttr: 'data-stack-id',
        idKey: 'stack_id',
        url: '<c:url value="/management/stack/delete"/>' // controller.business.BusinessRestController.deleteStack
      }
      businessDeleteHandler(options);
    });
    $('#modifyBtn').on('click', function(){
      const options = {
        btnId: $(this),
        selector: $('#workplaceInfoForm'),
        url: '<c:url value='/management/workplace/modify'/>' // controller.business.BusinessRestController.updateWorkplace
      }
      businessModifyHandler(options);
    });

    $("#excelUploadBtn").on("click", function () {
      const convertCycleNameForDatabase = {
        "미측정": "nomeasure",
        "1회/월": "monthly",
        "1회/분기": "quarterly",
        "1회/반기": "semiannual",
        "1회/년": "annual",
        "2회/2월": "twiceamonth",
        "1회/2월": "onceinfebruary",
        "추가 측정": "additional",
      }

      const stack_measurements = [];

      $('#tbody tr').each(function() {
        const stack_measurement = {};
        stack_measurement.stack_name = $(this).find('td.stack_name').text();
        stack_measurement.pollutant_name = $(this).find('td.pollutant_name').text();
        stack_measurement.allow_value = $(this).find('td.allow_value').text();
        stack_measurement.cycle_type = convertCycleNameForDatabase[$(this).find('td.cycle_type').text()];

        stack_measurements.push(stack_measurement);
      })

      $.ajax({
        url: '<c:url value="/management/stack-measurement/add/excel_data/"/>',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(stack_measurements),
        success: function() {
          alert('완료');
          location.reload();
        },
        error: function() {
          alert('실패 하였습니다.');
        }
      });
    });
  });
</script>
</body>
</html>
