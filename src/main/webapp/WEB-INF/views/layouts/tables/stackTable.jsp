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
      <th data-field="stack_name">측정시설 <span class="badge text-bg-primary">수정시 시설명 클릭</span></th>
      <th data-field="company_name">측정대행 의뢰업체</th>
      <th data-field="workplace_name">측정 대상 사업장</th>
      <th data-field="sub_factory_name">공장</th>
      <th data-field="department_name">관리부서</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="stack" items="${stacks}">
      <tr data-stack-id="${stack.stack_id}">
        <td></td>
        <td><a class="updateLink"
               href="<c:url value='/management/stack/${stack.stack_id}'/>">
            ${stack.stack_name != null ? stack.stack_name : '-'}</a></td>
        <td>${stack.company_name != null ? stack.company_name : '-'}</td>
        <td>${stack.workplace_name != null ? stack.workplace_name : '-'}</td>
        <td>${stack.sub_factory_name != null ? stack.sub_factory_name : '-'}</td>
        <td>${stack.department_name != null ? stack.department_name : '-'}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>