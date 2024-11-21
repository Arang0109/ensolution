<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">측정 항목 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <input type="hidden" name="stack_id" value="${stack.stack_id}"/>
      <div class="modal-body">
        <table class="table align-middle text-center">
          <thead>
          <tr>
            <th scope="col">NO.</th>
            <th scope="col">항목</th>
            <th scope="col">주기</th>
            <th scope="col">
              <button type="button" id="addItemBtn" class="btn btn-outline-success btn-sm">
                <i class="bi bi-plus"></i>
              </button>
            </th>
          </tr>
          </thead>
          <tbody id="itemTableBody">
          <tr class="stackMeasurementRow">
            <th>1</th>
            <td>
              <select class="js-example-basic-single pollutant" name="pollutant_id" style="width: 100%;">
                <c:forEach var="pollutant" items="${pollutants}">
                  <option value="${pollutant.pollutant_id}">${pollutant.pollutant_name}</option>
                </c:forEach>
              </select>
            </td>
            <td>
              <select class="js-example-basic-single cycle" name="cycle_type" style="width: 100%;">
                <option value="monthly">1회 / 월</option>
                <option value="quarterly">1회 / 분기</option>
                <option value="semiannual">1회 / 반기</option>
                <option value="annual">1회 / 연</option>
                <option value="twice a month">2회 / 월</option>
                <option value="once in february">1회 / 2월</option>
              </select>
            </td>
            <td>

            </td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button id="addMeasurementBtn" type="button" class="btn btn-primary">추가</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>