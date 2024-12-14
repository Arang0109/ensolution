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
<%@include file="layouts/modal/stackMeasurementModal.jsp"%>
<%@include file="semantic/navbar.jsp"%>
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <div class="container">
    <div class="profile-header">
      <div class="profile-main">
        <div class="d-flex justify-content-between">
          <h4><a class="link-opacity-50 link-offset-2 link-underline link-underline-opacity-0"
              href="<c:url value='/manager/company/${stack.company_id}'/>">${stack.company_name}</a> /
            <a class="link-opacity-50 link-offset-2 link-underline link-underline-opacity-0"
               href="<c:url value='/manager/workplace/${stack.workplace_id}'/>">${stack.workplace_name}</a> /
            ${stack.stack_name}</h4>
          <div>
            <a class="btn btn-primary btn-sm" href="<c:url value='/manager/stack'/>">목록</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="stackInfo" class="container d-flex justify-content-between">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <p style="margin-left: 1.25rem;"><b>측정 시설 정보</b></p>
        <div>
          <button id="modifyBtn" class="btn btn-primary btn-sm" type="button">수정</button>
        </div>
      </div>
      <hr>
      <div class="container text-center">
        <input name="stack_id" type="text" class="form-control" value="${stack.stack_id}" readonly='readonly' hidden="hidden">
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="stack_name">측정 시설</span>
              <input name="stack_name" type="text" class="form-control" value="${stack.stack_name}"
                     aria-label="Stack name" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
        </div>
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="prevention">방지 시설</span>
              <input name="prevention" type="text" class="form-control" value="${stack.prevention}"
                     aria-label="Prevention" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <p style="margin-left: 1.25rem;"><b>측정 시설 제원</b></p>
        <div>
          <button id="modifySpecificationBtn" class="btn btn-primary btn-sm" type="button">수정</button>
        </div>
      </div>
      <hr>
      <div id="stackSpecification" class="container text-center">
        <input name="stack_info_id" type="text" class="form-control" value="${stack_info.stack_info_id}" readonly='readonly' hidden="hidden">
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="diameter">직경 (m)</span>
              <input name="diameter" type="text" class="form-control" value="${stack_info.diameter}"
                     aria-label="Diameter" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="velocity_speed">유속 (m/s)</span>
              <input name="velocity_speed" type="text" class="form-control" value="${stack_info.velocity_speed}"
                     aria-label="Velocity speed" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
        </div>
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="dynamic_pressure">동압 (mmH<sub>2</sub>O)</span>
              <input name="dynamic_pressure" type="text" class="form-control" value="${stack_info.dynamic_pressure}"
                     aria-label="Dynamic pressure" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="static_pressure">정압 (mmH<sub>2</sub>O)</span>
              <input name="static_pressure" type="text" class="form-control" value="${stack_info.static_pressure}"
                     aria-label="Static pressure" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
        </div>
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="quantity">유량 (m<sup>3</sup>/hr)</span>
              <input name="quantity" type="text" class="form-control" value="${stack_info.quantity}"
                     aria-label="Quantity" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="temperature">온도 (ºC)</span>
              <input name="temperature" type="text" class="form-control" value="${stack_info.temperature}"
                     aria-label="Temperature" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="stackMeasurement" class="container" style="padding-top: 1.875rem;">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <p style="margin-left: 1.25rem;"><b>측정 오염 물질</b></p>
        <div>
          <span>측정가용능력 점수 : </span>
          <span id="score"></span>
        </div>
        <div>
          <button id="calculateBtn" class="btn btn-primary btn-sm" type="button">측정가용능력 점수 계산</button>
        </div>
      </div>
      <hr>
      <div class="d-flex justify-content-end">
        <div>
          <button type="button" class="btn btn-primary btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            측정 항목 추가
          </button>
          <button id="removeBtn" class="btn btn-primary btn-sm mb-3">측정 항목 삭제</button>
        </div>
      </div>
      <div class="d-flex justify-content-between">
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">월 / 1회</span>
          <div class="my-3">
            <c:forEach var="stack_measurement" items="${stack_measurements}">
              <c:if test="${stack_measurement.cycle_type eq 'monthly'}">
                <div class="form-check ms-2" data-stack-measurement-id="${stack_measurement.stack_measurement_id}"
                     data-is-measure="${stack_measurement.is_measure}">
                  <input class="form-check-input" type="checkbox" value="${stack_measurement.pollutant_id}" id="${stack_measurement.pollutant_id}">
                  <label class="form-check-label"
                         <c:if test="${stack_measurement.is_measure eq false}">
                           style="text-decoration: line-through"</c:if>
                         for="${stack_measurement.pollutant_id}">
                      ${stack_measurement.pollutant_name}
                  </label>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">분기 / 1회</span>
          <div class="my-3">
            <c:forEach var="stack_measurement" items="${stack_measurements}">
              <c:if test="${stack_measurement.cycle_type eq 'quarterly'}">
                <div class="form-check ms-2" data-stack-measurement-id="${stack_measurement.stack_measurement_id}"
                     data-is-measure="${stack_measurement.is_measure}">
                  <input class="form-check-input" type="checkbox" value="${stack_measurement.pollutant_id}" id="${stack_measurement.pollutant_id}">
                  <label class="form-check-label"
                      <c:if test="${stack_measurement.is_measure eq false}">
                        style="text-decoration: line-through"</c:if>
                         for="${stack_measurement.pollutant_id}">
                      ${stack_measurement.pollutant_name}
                  </label>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">반기 / 1회</span>
          <div class="my-3">
            <c:forEach var="stack_measurement" items="${stack_measurements}">
              <c:if test="${stack_measurement.cycle_type eq 'semiannual'}">
                <div class="form-check ms-2" data-stack-measurement-id="${stack_measurement.stack_measurement_id}"
                     data-is-measure="${stack_measurement.is_measure}">
                  <input class="form-check-input" type="checkbox" value="${stack_measurement.pollutant_id}" id="${stack_measurement.pollutant_id}">
                  <label class="form-check-label"
                      <c:if test="${stack_measurement.is_measure eq false}">
                        style="text-decoration: line-through"</c:if>
                         for="${stack_measurement.pollutant_id}">
                      ${stack_measurement.pollutant_name}
                  </label>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">연 / 1회</span>
          <div class="my-3">
            <c:forEach var="stack_measurement" items="${stack_measurements}">
              <c:if test="${stack_measurement.cycle_type eq 'annual'}">
                <div class="form-check ms-2" data-stack-measurement-id="${stack_measurement.stack_measurement_id}"
                     data-is-measure="${stack_measurement.is_measure}">
                  <input class="form-check-input" type="checkbox" value="${stack_measurement.pollutant_id}" id="${stack_measurement.pollutant_id}">
                  <label class="form-check-label"
                      <c:if test="${stack_measurement.is_measure eq false}">
                        style="text-decoration: line-through"</c:if>
                         for="${stack_measurement.pollutant_id}">
                      ${stack_measurement.pollutant_name}
                  </label>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">월 / 2회</span>
          <div class="my-3">
            <c:forEach var="stack_measurement" items="${stack_measurements}">
              <c:if test="${stack_measurement.cycle_type eq 'twiceamonth'}">
                <div class="form-check ms-2" data-stack-measurement-id="${stack_measurement.stack_measurement_id}"
                     data-is-measure="${stack_measurement.is_measure}">
                  <input class="form-check-input" type="checkbox" value="${stack_measurement.pollutant_id}" id="${stack_measurement.pollutant_id}">
                  <label class="form-check-label"
                      <c:if test="${stack_measurement.is_measure eq false}">
                        style="text-decoration: line-through"</c:if>
                         for="${stack_measurement.pollutant_id}">
                      ${stack_measurement.pollutant_name}
                  </label>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">2월 / 1회</span>
          <div class="my-3">
            <c:forEach var="stack_measurement" items="${stack_measurements}">
              <c:if test="${stack_measurement.cycle_type eq 'onceinfebruary'}">
                <div class="form-check ms-2" data-stack-measurement-id="${stack_measurement.stack_measurement_id}"
                     data-is-measure="${stack_measurement.is_measure}">
                  <input class="form-check-input" type="checkbox" value="${stack_measurement.pollutant_id}" id="${stack_measurement.pollutant_id}">
                  <label class="form-check-label"
                      <c:if test="${stack_measurement.is_measure eq false}">
                        style="text-decoration: line-through"</c:if>
                         for="${stack_measurement.pollutant_id}">
                      ${stack_measurement.pollutant_name}
                  </label>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<script>
  $(document).ready(function(){
    $('#selectPoll').select2({
      dropdownParent: $('#staticBackdrop'),
    });

    $('#nextToStep').on('click', function () {
      const selectedValues = $("#selectPoll").val() || [];
      const divBody = $('#selectedPoll');
      divBody.empty();

      selectedValues.forEach(function (value) {
        const text = $(`#selectPoll option[value="\${value}"]`).text();
        result = `
              <div class="row g-2 m-1 stackMeasurementDiv">
                <div class="col-md">
                  <input type="text" name="stack_id" value="` + ${stack.stack_id} +`" hidden>
                  <div class="form-floating">
                    <input type="text" class="form-control" id="\${value}" name="pollutant_id" placeholder="측정 항목" value="\${text}" disabled>
                    <label for="\${value}">측정 항목</label>
                  </div>
                </div>
                <div class="col-md">
                  <div class="form-floating">
                    <select class="form-select cycle" name="cycle_type" id="selectCycle">
                      <option value="monthly">1회 / 월</option>
                      <option value="quarterly">1회 / 분기</option>
                      <option value="semiannual">1회 / 반기</option>
                      <option value="annual">1회 / 연</option>
                      <option value="twiceamonth">2회 / 월</option>
                      <option value="onceinfebruary">1회 / 2월</option>
                      <option value="additional">추가 측정</option>
                    </select>
                    <label for="selectCycle">측정 주기</label>
                  </div>
                </div>
                <div class="col-md">
                  <div class="form-floating">
                    <input type="text" class="form-control" name="allow_value" id="allow_value" placeholder="혀용 기준치">
                    <label for="allow_value">허용 기준치(ppm)</label>
                  </div>
                </div>
                <div class="col-md">
                  <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" role="switch" name="is_measure" id="measureCheck\${value}" checked>
                    <label class="form-check-label" for="measureCheck\${value}">
                      측정 여부<br><span style="color: red; font-size:0.875rem;">* 측정하지 않는 항목일 경우 해제</span></label>
                  </div>
                </div>
              </div>
        `;
        divBody.append(result);
      });

      $('#staticBackdrop').modal('hide');
      $('#staticBackdrop1').modal('show');
    });

    $("#selectPoll").on('change', function() {
      const cnt = $(this).val().length;
      $('#cnt').text('(총 ' + cnt + ' 항목)');
    });

    $('#calculateBtn').on("click", function() {
      const selectedPollutant = [];

      $('input[type="checkbox"]:checked').each(function() {
        const pollutant_id = $(this).val();
        selectedPollutant.push({"pollutant_id": pollutant_id});
      });

      if (selectedPollutant.length === 0) return alert("항목을 선택해 주세요.");

      $.ajax({
        url: '<c:url value="/document/abilityScore"/>',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(selectedPollutant),
        success: function(response) {
          const score = response.score;
          $('#score').html(score);
        },
        error: function() {
          alert("error");
        }
      });
    });

    $('#modifyBtn').on('click',function(){
      let isReadonly = $("#stackInfo input").attr('readonly');

      if(isReadonly==='readonly') {
        $("#stackInfo input").attr('readonly', false);
        $("#modifyBtn").html("저장");
        return;
      }

      if (!confirm("수정하시겠습니까?")) return;

      const stackInfo = {};

      $('#stackInfo input').each(function(){
        let name = String($(this).attr('name'));
        stackInfo[name] = $(this).val();
      });

      $.ajax({
        type: 'PATCH',
        url: "<c:url value='/manager/modify/stack'/>",
        headers : { "Content-Type": "application/json"},
        dataType : 'text',
        data : JSON.stringify(stackInfo),
        success: function() {
          alert("업데이트에 성공했습니다.");
          location.reload();
        },
        error: function() {
          alert("실패했습니다.");
        }
      });
    });

    $('#modifySpecificationBtn').on('click',function(){
      let isReadonly = $("#stackSpecification input").attr('readonly');

      if(isReadonly==='readonly') {
        $("#stackSpecification input").attr('readonly', false);
        $("#modifySpecificationBtn").html("저장");
        return;
      }

      if (!confirm("수정하시겠습니까?")) return;

      const stackInfo = {};

      $('#stackSpecification input').each(function(){
        let name = String($(this).attr('name'));
        stackInfo[name] = $(this).val();
      });

      $.ajax({
        type: 'PATCH',
        url: "<c:url value='/manager/modify/stack/specification'/>",
        headers : { "Content-Type": "application/json"},
        dataType : 'text',
        data : JSON.stringify(stackInfo),
        success: function() {
          alert("업데이트에 성공했습니다.");
          location.reload();
        },
        error: function() {
          alert("실패했습니다.");
        }
      });
    });

    $('#addMeasurementBtn').on('click', function() {
      const pollutantList = [];

      $('div[class="row g-2 m-1 stackMeasurementDiv"]').each(function() {
        pollutantList.push({
          "stack_id": $(this).find('input[name="stack_id"]').val(),
          "pollutant_id": $(this).find('input[name="pollutant_id"]').attr("id"),
          "cycle_type": $(this).find('select.cycle').val(),
          "is_completed": 0,
          "allow_value": $(this).find('input[name="allow_value"]').val(),
          "is_measure": $(this).find('input[name="is_measure"]').is(":checked"),
        })
      });

      $.ajax({
        type:'POST',
        url: '<c:url value="/manager/add/stack/measurement"/>',
        headers : { "Content-Type": "application/json"},
        dataType : 'text',
        data: JSON.stringify(pollutantList),
        success: function() {
          alert("success");
          location.reload();
        },
        error: function () {
          alert("error");
        }
      });
    });

    $('#removeBtn').on("click", function() {
      if (!confirm("삭제 후 복구가 불가능 합니다. 정말로 삭제 하시겠습니까?")) return;

      const selectedStackMeasurement = [];

      $('#stackMeasurement input[type="checkbox"]:checked').each(function() {
        const stack_measurement_id = $(this).closest('div').attr('data-stack-measurement-id');
        selectedStackMeasurement.push({"stack_measurement_id": stack_measurement_id});
      });

      if (selectedStackMeasurement.length === 0) return alert("항목을 선택해 주세요.");

      $.ajax({
        url: '<c:url value="/manager/delete/stack/measurement"/>',
        type: 'DELETE',
        contentType: 'application/json',
        data: JSON.stringify(selectedStackMeasurement),
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
</script>
</body>
</html>
