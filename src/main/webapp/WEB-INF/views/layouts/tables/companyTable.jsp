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
      <th data-field="company_name">측정 대행 의뢰 업체 <span class="badge text-bg-primary">수정시 업체명 클릭</span></th>
      <th data-field="ceo_name">CEO</th>
      <th data-field="address">주소</th>
      <th data-field="biz_number">사업자 번호</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="company" items="${companies}">
      <tr data-company-id="${company.company_id}">
        <td></td>
        <td><a class="updateLink"
               href="<c:url value='/management/company/${company.company_id}'/>">
            ${company.company_name != null ? company.company_name : 'N/A'}</a></td>
        <td>${company.ceo_name != null ? company.ceo_name : 'N/A'}</td>
        <td>${company.address != null ? company.address : 'N/A'}</td>
        <td class="bizNumber">${company.biz_number != null ? company.biz_number : 'N/A'}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>