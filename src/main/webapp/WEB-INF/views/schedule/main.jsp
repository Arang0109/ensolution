<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <div class="border p-4" style="background-color: white;">
      <div id="toolbar">
        <div class="d-flex justify-content-end">
          <button id="search" type="button" class="btn btn-primary btn-sm m-2">검색</button>
        </div>
        <div class="form-inline d-flex justify-content-between" role="form">
          <div class="form-group m-2">
            <input name="offset" class="form-control w70" type="date">
          </div>
          <div class="form-group m-2">
            <input name="limit" class="form-control w70" type="date">
          </div>
          <div class="form-group m-2">
            <label for="workplaceSelect" style="font-size: 0.875rem"><b>업체&nbsp;</b></label>
            <select id="workplaceSelect" class="js-example-basic-single" name="workplace_id" style="width: 300px;">
              <option value="">-- select workplace --</option>
              <c:forEach var="workplace" items="${workplaces}">
                <option value="${workplace.workplace_id}">${workplace.workplace_name}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group m-2">
            <label for="stackSelect" style="font-size: 0.875rem"><b>시설&nbsp;</b></label>
            <select id="stackSelect" class="js-example-basic-single" name="stack_id" style="width: 300px;">
              <option value="">-- select stack --</option>
              <c:forEach var="stack" items="${stacks}">
                <option value="${stack.stack_id}">${stack.stack_name}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group m-2">
            <label for="team" style="font-size: 0.875rem"><b>팀&nbsp;</b></label>
            <select id="team" class="js-example-basic-single pollutant" name="team_id" style="width: 150px;">
              <option value="">-- select team --</option>
              <option value="1">1팀</option>
              <option value="2">2팀</option>
              <option value="3">3팀</option>
              <option value="4">4팀</option>
            </select>
          </div>
        </div>
      </div>
      <div class="d-flex justify-content-between">
        <h4><span class="badge text-bg-primary">자가측정부 일정</span></h4>
        <div>
          <a href="<c:url value='/schedule/register'/>" class="btn btn-primary btn-sm mx-1">일정 추가</a>
          <button id="deleteBtn" type="button" class="btn btn-primary btn-sm mx-1">
            일정 삭제
          </button>
          <button id="completeBtn" type="button" class="btn btn-primary btn-sm mx-1">
            일정 완료
          </button>
        </div>
      </div>
      <table
          id="table"
          data-toggle="table"
          data-locale="ko-KR"
          data-height="550"
          data-checkbox-header="true"
          data-click-to-select="true"
          data-pagination="true"
          data-toolbar="#toolbar"
          data-buttons-class="primary"
          data-row-style="rowStyle">
        <thead style="font-size: 0.875rem">
        <tr>
          <th data-field="state" data-checkbox="true" data-width="5"></th>
          <th data-field="measure_date" data-width="5">Date</th>
          <th data-field="workplace_name" data-width="150">Workplace</th>
          <th data-field="stack_name" data-width="150">Stack</th>
          <th data-field="pollutants" data-width="300">Pollutants</th>
          <th data-field="team" data-width="5">Team</th>
        </tr>
        </thead>
        <tbody style="font-size: 0.75rem">
        <c:forEach var="schedule" items="${schedules}">
          <tr
              data-schedule-ids="${schedule.schedule_ids}"
              data-is-completed=${schedule.is_completed ? '"true"' : '"false"'}>
            <td></td>
            <td><a href="<c:url value="/schedule/modify/${schedule.stack_id}/${schedule.measure_date}"/>">
              <fmt:formatDate value="${schedule.measure_date}" pattern="yyyy-MM-dd" /></a></td>
            <td>${schedule.workplace_name}</td>
            <td data-stack-id="${schedule.stack_id}"><a href="<c:url value="/manager/stack/${schedule.stack_id}"/>">
                ${schedule.stack_name}</a></td>
            <td>${schedule.pollutants}</td>
            <td>${schedule.team_name}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</main>
<footer class="w-100">

</footer>

<script>
  $(document).ready(function(){
    $('.js-example-basic-single').select2();

    $('#completeBtn').on('click', function() {
      const is_checked = $('#table tr td input[type="checkbox"]:checked');
      let schedule_ids = [];

      is_checked.each(function() {
        const schedule_id = $(this).closest('tr').attr('data-schedule-ids').split(',');
        schedule_id.forEach(item => {
          schedule_ids.push(item);
        })
      });

      $.ajax({
        url: '<c:url value="/schedule/update/complete"/>',
        type: 'PATCH',
        contentType: 'application/json',
        data: JSON.stringify(schedule_ids),
        success: function () {
          alert('success');
          location.reload();
        },
        error: function () {
          alert('fail')
        }
      });
    });

    $('#deleteBtn').on('click', function() {
      const is_checked = $('#table tr td input[type="checkbox"]:checked');
      let schedule_ids = [];

      is_checked.each(function() {
        const schedule_id = $(this).closest('tr').attr('data-schedule-ids').split(',');
        schedule_id.forEach(item => {
          schedule_ids.push(item);
        })
      });

      $.ajax({
        url: '<c:url value="/schedule/delete"/>',
        type: 'DELETE',
        contentType: 'application/json',
        data: JSON.stringify(schedule_ids),
        success: function () {
          alert('success');
          location.reload();
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