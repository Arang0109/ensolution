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
  <div class="container">
    <div id="addPlanForm" class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <p style="margin-left: 1.25rem;"><b>자가측정부 측정 일정 등록</b></p>
        <input type="text" id="datepicker" name="measure_date" placeholder="Select a date" style="text-align: center;">
        <button id="addPlan" type="button" class="btn btn-primary">등록</button>
      </div>
      <hr>
      <div class="row align-items-stretch">
        <div class="col">
          <div class="border p-4 mx-2 shadow-sm rounded bg-body-tertiary">
            <div class="p-2">
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="team_id" id="team1" value="1">
                <label class="form-check-label" for="team1">1팀</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="team_id" id="team2" value="2">
                <label class="form-check-label" for="team2">2팀</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="team_id" id="team3" value="3">
                <label class="form-check-label" for="team3">3팀</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="team_id" id="team4" value="4">
                <label class="form-check-label" for="team4">4팀</label>
              </div>
            </div>
            <div class="p-2">
              <label for="selectWorkplace" class="form-label">측정대상 사업장</label>
              <select id="selectWorkplace" class="js-example-basic-single" style="width: 100%;">
                <option value="">-- select workplace --</option>
                <c:forEach var="workplace" items="${workplaces}">
                  <option value="${workplace.workplace_id}">${workplace.workplace_name}</option>
                </c:forEach>
              </select>
            </div>
            <div class="p-2">
              <label for="selectStack" class="form-label">측정 시설</label>
              <select id="selectStack" class="js-example-basic-single" name="stack_id" style="width: 100%">
                <option value="">-- select stack --</option>
              </select>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="border p-4 mx-2 shadow-sm rounded bg-body-tertiary h-100">
            <div class="p-2 d-flex justify-content-between">
              <a href=""><span><b>#시설 정보</b></span></a>
              <button id="modifyNoteBtn" type="button" class="btn btn-primary btn-sm">특이사항 수정</button>
            </div>
            <div class="p-2">
              <div class="input-group">
                <span class="input-group-text"><b>특이사항</b></span>
                <textarea id="noteOfStack" class="form-control" aria-label="With textarea"></textarea>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="measurementList" class="d-flex justify-content-between" style="padding-top: 1.875rem;">

      </div>
    </div>
  </div>
  <div class="container" style="padding-top: 1.875rem;">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <p style="margin-left: 1.25rem;"><b>히스토리</b></p>
      </div>
      <hr>
      <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
        <table id="table" class="table table-bordered">
          <thead>
          <tr>
            <th data-field="measure_date">Date</th>
            <th data-field="pollutant">Pollutant</th>
            <th data-field="team_name">Team</th>
          </tr>
          </thead>
          <tbody>
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
    $('.js-example-basic-single').select2();

    const today = new Date();
    const formatDate = today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + String(today.getDate()).padStart(2, '0');
    const addResult = sessionStorage.getItem("addResult");
    viewAddMeasurementToast(addResult);

    $('#datepicker').datepicker({
      defaultDate: new Date(),
      dateFormat: "yy-mm-dd",
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

    $('#modifyNoteBtn').on('click', function () {
      if ($('#noteOfStack').attr('readonly') === 'readonly') {
        $('#noteOfStack').attr('readonly', false);
        $(this).html('특이사항 저장');
        return;
      }

      const note = $('#noteOfStack').val();
      const stack_id = $('#selectStack').val();

      const stack = {
        'stack_id': stack_id,
        'note': note,
      }

      $.ajax({
        url: '<c:url value="/schedule/modify/stack/note"/>',
        type: 'PATCH',
        contentType: 'application/json',
        data: JSON.stringify(stack),
        success: function() {
          $('#modifyNoteBtn').html('특이사항 수정');
          $('#noteOfStack').attr('readonly', true);
          alert('success');
        },
        error: function() {
          alert('failed');
        }
      });
    });

    const id = ["monthly", "quarterly", "semiannual", "annual", "twiceamonth", "onceinfebruary"];

    function selectStackOption(stacks) {
      id.forEach(cycle => {
        const div = $('#' + cycle);
        div.empty();
      });

      const select = $('#selectStack');
      select.empty();
      select.append('<option value="">-- select stack --</option>');

      $.each(stacks, function(index, item) {
        select.append('<option value="' + item.stack_id + '">' + item.stack_name + '</option>');
      })
    }

    function getNoteOfStack(note) {
      const memo = $('#noteOfStack');

      memo.empty();
      memo.attr('readonly', true);
      memo.val(note);
    }

    function getHistory(histories) {
      const tbody = $('#table tbody');
      tbody.empty();

      histories.forEach(history => {
        const date = new Date(history.measure_date);

        const localDate = new Date(date.getTime() - date.getTimezoneOffset() * 60000);

        const innerHtml = `
          <tr>
            <td>` + localDate.toISOString().split('T')[0] + `</td>
            <td>` + history.pollutant_ids + `</td>
            <td>` + history.team_name + `</td>
          </tr>
        `;
        tbody.append(innerHtml);
      });
    }

    function selectMeasurement(measurements) {
      id.forEach(cycle => {
        const div = $('#' + cycle);
        div.empty();
        $.each(measurements, function(index, item) {
          let color = 'red';
          if (item.is_completed) {
            color = 'green';
          }
          if (item.cycle_type === cycle) {
            const checkboxHtml = `
              <div class="form-check ms-2" data-stack-measurement-id="` + item.stack_measurement_id + `">
                <input
                  class="form-check-input"
                  type="checkbox"
                  value="` + item.pollutant_id + `"
                  id="` + item.pollutant_id + `">
                <label class="form-check-label" for="` + item.pollutant_id + `" style="color: ` + color + `;">
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
      const selectedStack = {};
      selectedStack['stack_id'] = $(this).val();

      if (selectedStack['stack_id']===0) return;

      $.ajax({
        url: '<c:url value="/schedule/select/stack/measurement"/>',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(selectedStack),
        success: function(result) {
          selectMeasurement(result.measurements);
          getHistory(result.histories);
          getNoteOfStack(result.note);
        },
        error: function() {
          alert('failed');
        }
      });
    });

    $("#addPlan").on('click', function() {
      const selectedMeasurement = [];
      const measure_date = $("#datepicker").val();
      const team_id = $('input[type="radio"]:checked').val();

      $('#addPlanForm input[type="checkbox"]:checked').each(function () {
        const stack_measurement_id = $(this).closest('div').attr('data-stack-measurement-id');
        selectedMeasurement.push({
          "team_id": team_id,
          "stack_measurement_id": stack_measurement_id,
          "measure_date": measure_date,
        })
      });

      if (!selectedMeasurement) {
        alert("select measurement!")
        return;
      }

      $.ajax({
        url: '<c:url value="/schedule/add/plan"/>',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(selectedMeasurement),
        success: function() {
          alert('success');
        },
        error: function () {
          alert('fail')
        }
      });
    });
  });
</script>
</body>
</html>