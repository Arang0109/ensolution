<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
  <table id="table"
         data-toggle="table"
         data-locale="ko-KR"
         data-search="true"
         data-height="550"
         data-pagination="true"
         data-checkbox-header="true"
         data-click-to-select="true"
         data-show-columns="true"
         data-buttons-class="primary"
         data-buttons-align="left">
    <thead>
    <tr>
      <th data-field="state" data-checkbox="true"></th>
      <th data-field="stack_name">측정 시설 <span class="badge text-bg-primary">수정시 시설명 클릭</span></th>
      <th data-field="prevention">방지 시설</th>
      <th data-field="company_name">측정 대행 의뢰 업체</th>
      <th data-field="workplace_name">측정 대상 사업장</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="stack" items="${stacks}">
      <tr data-stack-id="${stack.stack_id}">
        <td></td>
        <td><a class="updateLink"
               href="<c:url value='/manager/stack/${stack.stack_id}'/>">
            ${stack.stack_name != null ? stack.stack_name : '-'}</a></td>
        <td>${stack.prevention != null ? stack.prevention : '-'}</td>
        <td>${stack.company_name != null ? stack.company_name : '-'}</td>
        <td>${stack.workplace_name != null ? stack.workplace_name : '-'}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>