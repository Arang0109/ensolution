<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>manager</title>
    <%@include file="semantic/header.jsp"%>
</head>
<body class="d-flex flex-wrap">
<!-- navigation bar layout -->
<%@include file="semantic/navbar.jsp"%>
<!-- modal layer -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">업체 추가</h1>
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
<aside>
    <%@include file="semantic/aside.jsp"%>
</aside>
<main class="d-flex flex-column flex-grow-1">
    <div class="custom-div p-2">
        <button type="button" class="btn btn-primary mx-1" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            업체 추가
        </button>
        <button id="removeBtn" class="btn btn-primary mx-1">업체 삭제</button>
        <form action="" id="removeForm"></form>
    </div>
    <div class="custom-div p-2">
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
                <th data-field="company_name">측정 대행 의뢰 업체 (수정 시 클릭)</th>
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
                           href="<c:url value='/manager/company/${company.company_id}'/>">
                            ${company.company_name != null ? company.company_name : 'N/A'}</a></td>
                    <td>${company.ceo_name != null ? company.ceo_name : 'N/A'}</td>
                    <td>${company.address != null ? company.address : 'N/A'}</td>
                    <td>${company.biz_number != null ? company.biz_number : 'N/A'}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
<footer class="w-100">

</footer>

<script>
    $(document).ready(function(){
        $('.updateLink').on("click", function() {
            window.open(this.href, '_blank', 'width=400, height=500');
            return false;
        });

        $('#removeBtn').on("click", function() {
            if (!confirm("삭제 후 복구가 불가능 합니다. 정말로 삭제 하시겠습니까?")) return;

            const selectedCompany = [];

            $('#table tbody input[type="checkbox"]:checked').each(function() {
                const company_id = $(this).closest('tr').attr('data-company-id');
                selectedCompany.push({"company_id": company_id});
            });

            if (selectedCompany.length === 0) return alert("업체를 선택해 주세요.");

            $.ajax({
                url: '<c:url value="/manager/company"/>',
                type: 'DELETE',
                contentType: 'application/json',
                data: JSON.stringify(selectedCompany),
                success: function() {
                    alert("삭제 완료");
                    location.reload();
                },
                error: function() {
                    alert("삭제에 실패했습니다.");
                }
            });
        });
    });

    let msg = "${msg}";
    if (msg=="Success Add Company") alert("업체 추가 완료");
</script>
</body>
</html>
