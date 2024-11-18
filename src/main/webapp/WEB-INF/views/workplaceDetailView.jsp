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
  <div class="container">
    <div class="border p-4" style="background-color: white;">
      <p style="margin-left: 1.25rem;"><b>사업장 정보</b></p>
      <hr>
      <div class="container text-center">
        <div class="row p-2">
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="workplace_name">측정대상 사업장</span>
              <input name="workplace_name" type="text" class="form-control" value="${workplace.workplace_name}"
                     aria-label="Username" aria-describedby="addon-wrapping" readonly='readonly'>
            </div>
          </div>
          <div class="col">
            <div class="input-group flex-nowrap">
              <span class="input-group-text" id="address">주소</span>
              <input name="address" type="text" class="form-control" value="${workplace.address}"
                     aria-label="Username" aria-describedby="addon-wrapping" readonly='readonly'>
              <span class="input-group-text" id="addon-wrapping">
                    <a id="naverMapLink" href="" class="link-dark link-offset-2 link-underline link-underline-opacity-0">네이버 지도</a>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container" style="padding-top: 1.875rem;">
    <div class="border p-4" style="background-color: white;">
      <p style="margin-left: 1.25rem;"><b>측정시설 목록</b></p>
      <hr>
      <%@include file="layouts/tables/stackTable.jsp"%>
    </div>
  </div>
</main>

<script>
  $(document).ready(function(){
    $("#naverMapLink").on("click", function () {
      const url = "https://map.naver.com/p/search/" + $("input[name=address]").val();
      window.open(url, '_blank');
    });

    $('#modifyBtn').on('click',function(){
      let isReadonly = $("input").attr('readonly');

      if(isReadonly=='readonly') {
        $("input").attr('readonly', false);
        $("#modifyBtn").html("저장");
        return;
      }

      if (!confirm("수정하시겠습니까?")) return;

      const workplaceInfo = {};

      $('input').each(function(){
        let name = String($(this).attr('name'));
        workplaceInfo[name] = $(this).val();
      });

      $.ajax({
        type: 'PATCH',
        url: "<c:url value='/manager/workplace/${workplace.workplace_id}'/>",
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
  });
</script>
</body>
</html>
