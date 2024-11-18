<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="companyAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="companyAddLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="companyAddLabel">업체 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="<c:url value="/manager/company"/>" method="post" id="company_form">
        <div class="modal-body m-2">
          <div class="mb-3 row">
            <label for="inputCompany" class="form-label">측정 대행 의뢰 업체</label>
            <input type="text" name="company_name" class="form-control" id="inputCompany">
          </div>
          <div class="mb-3 row">
            <label for="inputCeo" class="form-label">대표자 이름</label>
            <input type="text" name="ceo_name" class="form-control" id="inputCeo">
          </div>
          <div class="mb-3 row">
            <label for="inputAddress" class="form-label">업체 주소</label>
            <input type="text" name="address" class="form-control" id="inputAddress">
          </div>
          <div class="mb-3 row">
            <label for="inputBizNum" class="form-label">사업자 번호</label>
            <input type="text" name="biz_number" class="form-control" id="inputBizNum">
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