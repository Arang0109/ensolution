<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <p style="margin-left: 1.25rem;"><b>자가측정부 측정 일정 상세</b></p>
        <input type="text" id="datepicker" name="measure_date" placeholder="Select a date" style="text-align: center;">
        <button id="modifyPlan" type="button" class="btn btn-primary">수정</button>
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
              <label for="workplace_name" class="form-label">측정대상 사업장</label>
              <input type="text" class="form-control" id="workplace_name" value="${schedule.workplace_name}" disabled="disabled">
            </div>
            <div class="p-2">
              <label for="stack_name" class="form-label">측정 시설</label>
              <input type="text" class="form-control" id="stack_name" value="${schedule.stack_name}" disabled="disabled">
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
                <textarea id="noteOfStack" class="form-control" aria-label="With textarea">${stack.note}</textarea>
              </div>
            </div>
          </div>
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
    $('input[type="radio"]').each(function() {
      if ($(this).val() == ${schedule.team_id}) {
        $(this).attr('checked', 'checked');
      }
    })
  });
</script>
</body>
</html>
