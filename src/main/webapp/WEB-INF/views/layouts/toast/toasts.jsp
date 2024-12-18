<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="toast-container position-fixed top-0 end-0 p-3">
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" id="successToast">
    <div class="toast-header">
      <img src='<c:url value="/img/smile.svg"/>'/>
      <strong class="me-auto" style="color: green;">&nbsp;Success</strong>
      <small></small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">

    </div>
  </div>
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" id="failToast">
    <div class="toast-header">
      <img src='<c:url value="/img/frown.svg"/>'/>
      <strong class="me-auto" style="color: red;">&nbsp;Fail</strong>
      <small></small>
      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">

    </div>
  </div>
</div>
