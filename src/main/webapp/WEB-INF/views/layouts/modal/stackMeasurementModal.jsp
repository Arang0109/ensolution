<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel1" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel1">측정 항목 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container">
          <div id="selectedPoll" class="border p-4" style="background-color: white;">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button id="addMeasurementBtn" type="button" class="btn btn-primary" tabindex="-1">추가</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" tabindex="-1">닫기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">측정 항목 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container">
          <div class="border p-4" style="background-color: white;">
            <div class="mb-3">
              <label for="selectPoll" class="form-label"><b>측정 물질 <span id="cnt"></span></b></label>
              <select id="selectPoll" class="js-example-basic-multiple" name="states[]" multiple="multiple" style="width: 100%;">
                <c:forEach var="pollutant" items="${pollutants}">
                  <option value="${pollutant.pollutant_id}">${pollutant.pollutant_name}</option>
                </c:forEach>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button id="nextToStep" type="button" class="btn btn-primary" tabindex="-1">다음</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" tabindex="-1">닫기</button>
      </div>
    </div>
  </div>
</div>