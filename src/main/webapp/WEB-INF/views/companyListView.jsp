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
<%@include file="layouts/modal/companyModal.jsp"%>
<%@include file="layouts/toast/toasts.jsp"%>
<main class="d-flex flex-column flex-grow-1">
    <div class="container" style="padding: 1.875rem 0 0">
        <div class="border p-4" style="background-color: white;">
            <div class="d-flex justify-content-between">
                <h4><span class="badge text-bg-primary">측정대행 의뢰업체 목록</span></h4>
                <div>
                    <button type="button" class="btn btn-primary mx-1" data-bs-toggle="modal" data-bs-target="#companyAdd">
                        업체 추가
                    </button>
                    <button id="removeBtn" class="btn btn-primary mx-1">업체 삭제</button>
                    <form action="" id="removeForm"></form>
                </div>
            </div>
            <div id="tableContainer">
                <%@include file="layouts/tables/companyTable.jsp"%>
            </div>
        </div>
    </div>
</main>
<footer class="w-100">

</footer>
<script src="<c:url value='/js/business-management.js'/>"></script>
<script>
    $(document).ready(function(){
        const companyAddResult = '${companyAddResult}';
        if (companyAddResult) {
            const msg = {
                successMsg: 'company: ' + '\"${companyName}\"' + ', 업체가 추가 되었습니다.',
                failedMsg: '\"${companyName}\"' + ', 업체가 이미 존재 합니다.',
            }
            loadToast(companyAddResult, msg);
        }
        setupValidation('#company_form'); // business-management.js >> 유효성 검사
        bizNumFormatter('#inputBizNum'); // business number formatter
        $('#removeBtn').on("click", function() {
            const options = {
                tableSelector: '#table',
                dataAttr: 'data-company-id',
                idKey: 'company_id',
                url: '<c:url value="/management/company/delete"/>' // controller.business.BusinessRestController.deleteCompany
            }

            businessDeleteHandler(options);
        });
    });
</script>
</body>
</html>