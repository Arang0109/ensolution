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
<%@include file="layouts/modal/stackModal.jsp"%>
<%@include file="layouts/modal/ExcelUploadModal.jsp"%>
<!-- navigation bar layout -->
<%@include file="semantic/navbar.jsp"%>
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <div class="container">
    <div class="profile-header">
      <div class="profile-main d-flex justify-content-between">
        <div class="d-flex">
          <h4><a class="link-opacity-50 link-offset-2 link-underline link-underline-opacity-0"
              href="<c:url value='/manager/company/${company.company_id}'/>">${company.company_name}</a> /
            ${workplace.workplace_name}</h4>
          <span style="margin-left: 1.25rem;">${workplace.address}</span>
        </div>
        <div >
          <button id="modifyBtn" class="btn btn-primary btn-sm" type="button">수정</button>
          <a class="btn btn-primary btn-sm" href="<c:url value="/manager/workplace"/>">목록</a>
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

<script lang="javascript" src="https://cdn.sheetjs.com/xlsx-0.20.3/package/dist/xlsx.full.min.js"></script>
<script>
  $(document).ready(function(){
    'use strict';

    $('#stack_form').each(function () {
      $(this).on('submit', function (event) {
        if (!this.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        $(this).addClass('was-validated');
      });
    });

    $('#removeBtn').on("click", function() {
      if (!confirm("삭제 후 복구가 불가능 합니다. 정말로 삭제 하시겠습니까?")) return;

      const selectedStack = [];

      $('#table tbody input[type="checkbox"]:checked').each(function() {
        const stack_id = $(this).closest('tr').attr('data-stack-id');
        selectedStack.push({"stack_id": stack_id});
      });

      if (selectedStack.length === 0) return alert("시설을 선택해 주세요.");

      $.ajax({
        url: '<c:url value="/manager/delete/stack"/>',
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

    const change = {
      "미측정": "nomeasure",
      "1회/월": "monthly",
      "1회/분기": "quarterly",
      "1회/반기": "semiannual",
      "1회/년": "annual",
      "2회/2월": "twiceamonth",
      "1회/2월": "onceinfebruary",
      "추가 측정": "additional",
    }

    $("#excelUploadBtn").on("click", function () {
      const stack_measurements = [];

      $('#tbody tr').each(function() {
        const stack_measurement = {};
        stack_measurement.stack_name = $(this).find('td.stack_name').text();
        stack_measurement.pollutant_name = $(this).find('td.pollutant_name').text();
        stack_measurement.prevention = $(this).find('td.prevention').text();
        stack_measurement.allow_value = $(this).find('td.allow_value').text();
        stack_measurement.cycle_type = change[$(this).find('td.cycle_type').text()];

        stack_measurements.push(stack_measurement);
      })

      $.ajax({
        url: '<c:url value="/manager/add/excel_data/measurement"/>',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(stack_measurements),
        success: function() {
          alert("완료");
          location.reload();
        },
        error: function() {
          alert("실패했습니다.");
        }
      });
    });

    $("#naverMapLink").on("click", function () {
      const url = "https://map.naver.com/p/search/" + $("#workplaceInfo input[name=address]").val();
      window.open(url, '_blank');
    });

    $('#modifyBtn').on('click',function(){
      let isReadonly = $("#workplaceInfo input").attr('readonly');

      if(isReadonly==='readonly') {
        $("#workplaceInfo input").attr('readonly', false);
        $("#modifyBtn").html("저장");
        return;
      }

      if (!confirm("수정 하시겠습니까?")) return;

      const form = $("#workplaceInfoForm")[0];

      // HTML5 유효성 검사 실행
      if (!form.checkValidity()) {
        $(form).addClass('was-validated');
        return;
      }

      const workplaceInfo = {};

      $('#workplaceInfo input').each(function(){
        let name = String($(this).attr('name'));
        workplaceInfo[name] = $(this).val();
      });

      $.ajax({
        type: 'PATCH',
        url: "<c:url value='/manager/modify/workplace'/>",
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

    $('#formFile').on('change', function(e) {
      const file = e.target.files[0];

      if (!file) {
        console.error("파일이 선택되지 않았습니다.");
        return;
      }

      const reader = new FileReader();

      reader.onload = function(e) {
        const data = new Uint8Array(e.target.result);

        const workbook = XLSX.read(data, { type: "array" });

        const sheetName = workbook.SheetNames[0];
        const worksheet = workbook.Sheets[sheetName];

        const jsonData = XLSX.utils.sheet_to_json(worksheet);

        const processedData = jsonData.map(row => {
          const processedRow = {};
          for (let key in row) {
            processedRow[key] = row[key] === undefined || row[key] === null ? "" : row[key];
          }
          return processedRow;
        });

        processedData.forEach(item => {
          const text = `
            <tr>
              <td class="stack_name">\${item["stack"] || ""}</td>
              <td class="pollutant_name">\${item["pollutant"] || ""}</td>
              <td class="prevention">\${item["prevention"] || ""}</td>
              <td class="allow_value">\${item["aValue"] || ""}</td>
              <td class="cycle_type">\${item["cycle"] || ""}</td>
            </tr>
          `;

          $('#tbody').append(text);
        });

        const cells = $('tbody#tbody td');

        Array.from(cells).forEach(cell => {
          cell.setAttribute("contenteditable", "true");
        });
      };

      reader.onerror = function(e) {
        console.error("FileReader 에러 발생:", e);
      };

      // 파일 읽기 시작
      reader.readAsArrayBuffer(file);
    });
  });
</script>
</body>
</html>
