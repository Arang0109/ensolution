<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="stackAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="stackAddLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="stackAddLabel">시설 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="<c:url value="/manager/stack"/>" method="post" id="stack_form">
        <div class="modal-body m-2">
          <div class="mb-3 row d-flex justify-content-center">
            <label for="companyList" class="form-label">측정 대행 의뢰 업체</label>
            <select class="js-example-basic-single" id="companyList" name="workplace_id" style="width: 50%">
              <c:forEach var="workplace" items="${workplaces}">
                <option value="${workplace.workplace_id}">${workplace.workplace_name}</option>
              </c:forEach>
            </select>
          </div>
          <div class="mb-3 row">
            <label for="inputStack" class="form-label">측정 시설</label>
            <input type="text" name="stack_name" class="form-control" id="inputStack">
          </div>
          <div class="mb-3 row">
            <label for="inputPrevention" class="form-label">방지 시설</label>
            <input type="text" name="prevention" class="form-control" id="inputPrevention">
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