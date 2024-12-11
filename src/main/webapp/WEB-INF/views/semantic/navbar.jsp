<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<header class="fixed-top">
  <nav class="navbar bg-primary navbar-expand-lg">
    <div class="container container-fluid">
      <a class="navbar-brand" href="#">ENSolution</a>
      <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="<c:url value='/img/calendar.svg'/>"/><span style="margin-left: 1.25rem;">일정</span>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<c:url value="/schedule/register"/>">일정 등록</a></li>
              <li><a class="dropdown-item" href="<c:url value="/schedule/main"/>">자가측정부 일정</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="<c:url value='/img/settings.svg'/>"/><span style="margin-left: 1.25rem;">관리</span>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<c:url value="/manager/company"/>">측정 대행 의뢰업체</a></li>
              <li><a class="dropdown-item" href="<c:url value="/manager/workplace"/>">측정 대상 사업장</a></li>
              <li><a class="dropdown-item" href="<c:url value="/manager/stack"/>">측정 시설</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="<c:url value='/img/file-text.svg'/>"/><span style="margin-left: 1.25rem;">문서</span>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">인수인계서</a></li>
              <li><a class="dropdown-item" href="#">차량운행일지</a></li>
              <li><a class="dropdown-item" href="<c:url value="/document/abilityScore"/>">용역이행능력평가</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="<c:url value='/img/trending-up.svg'/>"/><span style="margin-left: 1.25rem;">통계</span>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">자가측정부 매출</a></li>
              <li><a class="dropdown-item" href="<c:url value="/statistics/main"/>">자가측정 달성률</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="bookmark">
    <div class="container container-fluid">
      <a target="_blank" href="https://docs.google.com/spreadsheets/" class="center-align">
        <img src="<c:url value='/img/spreadsheet.svg'/>">spread sheet
      </a>
      <a target="_blank" href="https://측정인.kr/init.go" class="center-align ms-2">
        <img src="<c:url value='/img/bookmark.svg'/>">에코랩
      </a>
      <a target="_blank" href="https://www.moleg.go.kr/" class="center-align ms-2">
        <img src="<c:url value='/img/bookmark.svg'/>">법제처
      </a>
    </div>
  </div>
</header>