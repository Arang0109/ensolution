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
      <th data-field="workplace_name">측정 대상 사업장 <span class="badge text-bg-primary">수정시 사업장명 클릭</span></th>
      <th data-field="address">주소</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="workplace" items="${workplaces}">
      <tr data-workplace-id="${workplace.workplace_id}">
        <td></td>
        <td><a class="updateLink"
               href="<c:url value='/manager/workplace/${workplace.workplace_id}'/>">
            ${workplace.workplace_name != null ? workplace.workplace_name : 'N/A'}</a></td>
        <td>${workplace.address != null ? workplace.address : 'N/A'}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>