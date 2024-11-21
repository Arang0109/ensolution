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
<main class="d-flex flex-column flex-grow-1">
    <div class="tostify"></div>
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
            <%@include file="layouts/tables/companyTable.jsp"%>
        </div>
    </div>
</main>
<footer class="w-100">

</footer>

<script>
    $(document).ready(function(){
        'use strict';

        $('.needs-validation').each(function () {
            $(this).on('submit', function (event) {
                if (!this.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                $(this).addClass('was-validated');
            });
        });

        const inputBizNum = $('#inputBizNum');

        inputBizNum.on('input', function() {
            let value = $(this).val().replace(/[^0-9]/g, '');

            if (value.length === 0) {
                return;
            }

            if (value.length > 3 && value.length <= 5) {
                value = value.slice(0, 3) + '-' + value.slice(3);
            } else if (value.length > 5) {
                value = value.slice(0, 3) + '-' + value.slice(3, 5) + '-' + value.slice(5, 10);
            }

            $(this).val(value.slice(0, 12));
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
                url: '<c:url value="/manager/delete/company"/>',
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
    if (msg==="Success add company") alert("업체 추가 완료");
    if (msg==="Already exist company") alert("업체가 이미 존재 합니다.")
</script>
</body>
</html>