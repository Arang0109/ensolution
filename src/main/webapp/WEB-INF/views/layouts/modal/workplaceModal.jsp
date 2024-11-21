<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="workplaceAddLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="workplaceAddLabel">사업장 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="<c:url value="/manager/add/workplace"/>" method="post" id="workplace_form" class="needs-validation" novalidate>
        <div class="modal-body m-2">
          <div class="mb-3 row">
            <label for="company_name" class="form-label">측정대행 의뢰업체</label>
            <input type="text" class="form-control" id="company_name" value="${company.company_name}" disabled="disabled">
          </div>
          <input type="text" class="form-control" name="company_id" value="${company.company_id}" hidden="hidden">
          <div class="mb-3 row">
            <label for="inputWorkplace" class="form-label">측정대상 사업장 <small><b>(필수)</b></small></label>
            <input type="text" name="workplace_name" class="form-control" id="inputWorkplace" required>
            <div class="invalid-feedback">
              사업장 입력 필수!
            </div>
          </div>
          <div class="mb-3 row">
            <label for="inputAddress" class="form-label">사업장 주소</label>
            <input type="text" name="address" class="form-control" id="inputAddress">
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">추가</button>
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
        </div>
      </form>
    </div>
  </div>
</div>