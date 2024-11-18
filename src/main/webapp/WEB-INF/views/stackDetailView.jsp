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
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <div class="container">
    <div class="profile-header">
      <div class="profile-main">
        <div class="d-flex justify-content-between">
          <h4><a class="link-opacity-50 link-offset-2 link-underline link-underline-opacity-0"
              href="<c:url value='/manager/company/${company.company_id}'/>">${company.company_name}</a> /
            <a class="link-opacity-50 link-offset-2 link-underline link-underline-opacity-0"
               href="<c:url value='/manager/workplace/${workplace.workplace_id}'/>">${workplace.workplace_name}</a> /
            ${stack.stack_name}</h4>
          <div>
            <a class="btn btn-primary btn-sm" href="<c:url value='/manager/stack'/>">목록</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="border p-4" style="background-color: white;">
      <p style="margin-left: 1.25rem;"><b>측정 오염 물질</b></p>
      <hr>
      <div class="d-flex justify-content-between">
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">월 / 1회</span>
          <div class="my-3">
            -
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">월 / 2회</span>
          <div class="my-3">
            -
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">2월 / 1회</span>
          <div class="my-3">
            -
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">분기 / 1회</span>
          <div class="my-3">
            -
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">반기 / 1회</span>
          <div class="my-3">
            -
          </div>
        </div>
        <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
          <span class="badge text-bg-primary">연 / 1회</span>
          <div class="my-3">
            -
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container d-flex justify-content-between" style="padding-top: 1.875rem;">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-between">
        <p style="margin-left: 1.25rem;"><b>측정 시설 정보</b></p>
        <div>
          <button id="modifyBtn" class="btn btn-primary btn-sm" type="button">수정</button>
        </div>
      </div>
      <hr>
      <div class="container text-center">
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="stack_name">측정 시설</span>
              <input name="stack_name" type="text" class="stack form-control" value="${stack.stack_name}"
                     aria-label="Stack name" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
        </div>
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="prevention">방지 시설</span>
              <input name="prevention" type="text" class="stack form-control" value="${stack.prevention}"
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
          <button id="modifyInfoBtn" class="btn btn-primary btn-sm" type="button">수정</button>
        </div>
      </div>
      <hr>
      <div class="container text-center">
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="diameter">직경 (m)</span>
              <input name="diameter" type="text" class="stackInfo form-control" value="${stack_info.diameter}"
                     aria-label="Diameter" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="velocity_speed">유속 (m/s)</span>
              <input name="velocity_speed" type="text" class="stackInfo form-control" value="${stack_info.velocity_speed}"
                     aria-label="Velocity speed" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
        </div>
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="dynamic_pressure">동압 (mmH<sub>2</sub>O)</span>
              <input name="dynamic_pressure" type="text" class="stackInfo form-control" value="${stack_info.dynamic_pressure}"
                     aria-label="Dynamic pressure" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="static_pressure">정압 (mmH<sub>2</sub>O)</span>
              <input name="static_pressure" type="text" class="stackInfo form-control" value="${stack_info.static_pressure}"
                     aria-label="Static pressure" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
        </div>
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="quantity">유량 (m<sup>3</sup>/hr)</span>
              <input name="quantity" type="text" class="stackInfo form-control" value="${stack_info.quantity}"
                     aria-label="Quantity" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="temperature">온도 (ºC)</span>
              <input name="temperature" type="text" class="stackInfo form-control" value="${stack_info.temperature}"
                     aria-label="Temperature" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<script>
  $(document).ready(function(){
    $('#modifyBtn').on('click',function(){
      let isReadonly = $("input.stack").attr('readonly');

      if(isReadonly==='readonly') {
        $("input.stack").attr('readonly', false);
        $("#modifyBtn").html("저장");
        return;
      }

      if (!confirm("수정하시겠습니까?")) return;

      const stackInfo = {};

      $('input.stack').each(function(){
        let name = String($(this).attr('name'));
        stackInfo[name] = $(this).val();
      });

      $.ajax({
        type: 'PATCH',
        url: "<c:url value='/manager/stack/${stack.stack_id}'/>",
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

    $('#modifyInfoBtn').on('click',function(){
      let isReadonly = $("input.stackInfo").attr('readonly');

      if(isReadonly==='readonly') {
        $("input.stackInfo").attr('readonly', false);
        $("#modifyInfoBtn").html("저장");
        return;
      }

      if (!confirm("수정하시겠습니까?")) return;

      const stackInfo = {};

      $('input.stackInfo').each(function(){
        let name = String($(this).attr('name'));
        stackInfo[name] = $(this).val();
      });

      $.ajax({
        type: 'PATCH',
        url: "<c:url value='/manager/stackInfo/${stack_info.stack_info_id}'/>",
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
  });
</script>
</body>
</html>
