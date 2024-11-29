<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>자가 측정 일정 등록</title>
  <%@include file="../semantic/header.jsp"%>
</head>
<body class="d-flex flex-wrap">
<!-- navigation bar layout -->
<%@include file="../semantic/navbar.jsp"%>
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <form action="<c:url value="/schedule/add/plan"/>" method="post" id="plan_form">
  <div class="container">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <p style="margin-left: 1.25rem;"><b>자가측정부 측정 일정 등록</b></p>
        <input type="text" id="datepicker" placeholder="Select a date" style="text-align: center;">
        <button type="submit" class="btn btn-primary">등록</button>
      </div>
      <hr>
      <div class="d-flex justify-content-between">
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <select id="selectWorkplace" class="js-example-basic-single" name="workplace_id" style="width: 100%;">
            <option value="">-- select workplace --</option>
            <c:forEach var="workplace" items="${workplaces}">
              <option value="${workplace.workplace_id}">${workplace.workplace_name}</option>
            </c:forEach>
          </select>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <select id="selectStack" class="js-example-basic-single" name="stack_id" style="width: 100%">
            <option value="">-- select stack --</option>
          </select>
        </div>
      </div>
      <div id="measurementList" class="d-flex justify-content-between" style="padding-top: 1.875rem;">
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">월 / 1회</span>
          <div id="monthly" class="my-3">

          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">분기 / 1회</span>
          <div id="quarterly" class="my-3">

          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">반기 / 1회</span>
          <div id="semiannual" class="my-3">

          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">연 / 1회</span>
          <div id="annual" class="my-3">

          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">월 / 2회</span>
          <div id="twiceamonth" class="my-3">

          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">2월 / 1회</span>
          <div id="onceinfebruary" class="my-3">

          </div>
        </div>
      </div>
      <div class="d-flex justify-content-between" style="padding-top: 1.875rem;">
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <a href="">history</a>
        </div>
      </div>
    </div>
  </div>
  </form>
</main>
<footer class="w-100">

</footer>

<script>
  $(document).ready(function(){
    $('.js-example-basic-single').select2();

    const today = new Date();
    const formatDate = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월 " + today.getDate() + "일";

    $('#datepicker').datepicker({
      defaultDate: new Date(),
      dateFormat: "yy년 mm월 dd일",
      closeText: "닫기",
      currentText: "오늘",
      prevText: '이전 달',
      nextText: '다음 달',
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      weekHeader: "주",
      yearSuffix: '년',
    });

    $('#datepicker').val(formatDate);

    function selectStackOption(stacks) {
      const select = $('#selectStack');
      select.empty();
      select.append('<option value="">-- select stack --</option>');

      $.each(stacks, function(index, item) {
        select.append('<option value="' + item.stack_id + '">' + item.stack_name + '</option>');
      })
    }

    const id = ["monthly", "quarterly", "semiannual", "annual", "twiceamonth", "onceinfebruary"];

    function selectMeasurement(measurements) {
      id.forEach(cycle => {
        const div = $('#' + cycle);
        div.empty();
        $.each(measurements, function(index, item) {
          if (item.cycle_type === cycle) {
            const checkboxHtml = `
              <div class="form-check ms-2" data-stack-measurement-id="` + item.stack_measurement_id + `">
                <input
                  class="form-check-input"
                  type="checkbox"
                  value="` + item.pollutant_id + `"
                  id="` + item.pollutant_id + `">
                <label class="form-check-label" for="` + item.pollutant_id + `">
                  ` + item.pollutant_name + `
                </label>
              </div>
            `;
            div.append(checkboxHtml);
          }
        })
      });
    }

    $("#selectWorkplace").on('change', function() {
      const selectedWorkplace = {}
      selectedWorkplace['workplace_id'] = $(this).val();

      if (selectedWorkplace['workplace_id']===0) return;

      $.ajax({
        url: '<c:url value="/schedule/select/stack"/>',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(selectedWorkplace),
        success: function(result) {
          const stacks = result.stacks;
          selectStackOption(stacks);
        },
        error: function() {
          alert('failed');
        }
      });
    });

    $("#selectStack").on('change', function() {
      const selectedStack = {}
      selectedStack['stack_id'] = $(this).val();

      if (selectedStack['stack_id']===0) return;

      $.ajax({
        url: '<c:url value="/schedule/select/stack/measurement"/>',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(selectedStack),
        success: function(result) {
          const measurements = result.measurements;
          selectMeasurement(measurements);
        },
        error: function() {
          alert('failed');
        }
      });
    });
  });
</script>
</body>
</html>