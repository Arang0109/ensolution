<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>manager</title>
  <%@include file="semantic/header.jsp"%>
</head>
<body class="d-flex flex-wrap">
<!-- navigation bar layout -->
<%@include file="semantic/navbar.jsp"%>
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <div class="container" style="padding: 1.875rem 0 0">
    <div class="border p-4" style="background-color: white;">
      <div class="d-flex justify-content-start">
        <h4><span class="badge text-bg-primary">측정 시설 목록</span></h4>
      </div>
      <%@include file="layouts/tables/stackTable.jsp"%>
    </div>
  </div>
</main>
<footer class="w-100">

</footer>
</body>
</html>
