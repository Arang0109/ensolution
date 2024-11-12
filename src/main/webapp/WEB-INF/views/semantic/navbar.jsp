<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary w-100">
  <div class="container-fluid">
    <div class="collapse navbar-collapse d-flex justify-content-center" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item mx-4">
          <a class="nav-link active" aria-current="page" href="#">홈</a>
        </li>
        <li class="nav-item mx-4">
          <a class="nav-link" href="#">일정</a>
        </li>
        <li class="nav-item mx-4">
          <a class="nav-link" href="#">정보</a>
        </li>
        <li class="nav-item dropdown mx-4">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            관리
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<c:url value="/manager/company"/>">측정 대행 의뢰 업체</a></li>
            <li><a class="dropdown-item" href="<c:url value="/manager/workplace"/>">측정 대상 사업장</a></li>
            <li><a class="dropdown-item" href="#">측정 시설</a></li>
            <li><hr class="dropdown-divider"></li>
          </ul>
        </li>
        <li class="nav-item mx-4">
          <a class="nav-link" href="#">문서</a>
        </li>
        <li class="nav-item mx-4">
          <a class="nav-link" href="#">보고서</a>
        </li>
        <li class="nav-item mx-4">
          <a class="nav-link" href="#">공지사항</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
