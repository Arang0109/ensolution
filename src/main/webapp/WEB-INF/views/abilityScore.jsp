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
<main class="d-flex flex-column flex-grow-1">
    <div class="tostify"></div>
    <div class="container" style="padding: 1.875rem 0 0">
        <div class="border p-4" style="background-color: white;">
            <div class="d-flex justify-content-between">
                <h4><span class="badge text-bg-primary">측정 오염물질 (총 ${pollutantCount} 종)</span></h4>
                <div>
                    <span>측정가용능력 점수 : </span>
                    <span id="score"></span>
                </div>
                <div>
                    <button id="calculateBtn" class="btn btn-primary btn-sm" type="button">측정가용능력 점수 계산</button>
                </div>
            </div>
            <div class="d-flex justify-content-between mt-3">
                <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
                    <span class="badge text-bg-primary">먼지</span>
                    <div class="my-3">
                        <c:forEach var="pollutant" items="${pollutants}">
                            <c:if test="${pollutant.method eq '먼지'}">
                                <div class="form-check ms-2">
                                    <input class="form-check-input" type="checkbox" value="${pollutant.pollutant_id}" id="${pollutant.pollutant_id}">
                                    <label class="form-check-label" for="${pollutant.pollutant_id}">
                                            ${pollutant.pollutant_name}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <span class="badge text-bg-primary">현장측정</span>
                    <div class="my-3">
                        <c:forEach var="pollutant" items="${pollutants}">
                            <c:if test="${pollutant.method eq '현장측정'}">
                                <div class="form-check ms-2">
                                    <input class="form-check-input" type="checkbox" value="${pollutant.pollutant_id}" id="${pollutant.pollutant_id}">
                                    <label class="form-check-label" for="${pollutant.pollutant_id}">
                                            ${pollutant.pollutant_name_en}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <span class="badge text-bg-primary">카트리지</span>
                    <div class="my-3">
                        <c:forEach var="pollutant" items="${pollutants}">
                            <c:if test="${pollutant.method eq '카트리지'}">
                                <div class="form-check ms-2">
                                    <input class="form-check-input" type="checkbox" value="${pollutant.pollutant_id}" id="${pollutant.pollutant_id}">
                                    <label class="form-check-label" for="${pollutant.pollutant_id}">
                                            ${pollutant.pollutant_name}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
                    <span class="badge text-bg-primary">흡수액</span>
                    <div class="my-3">
                        <c:forEach var="pollutant" items="${pollutants}">
                            <c:if test="${pollutant.method eq '흡수액'}">
                                <div class="form-check ms-2">
                                    <input class="form-check-input" type="checkbox" value="${pollutant.pollutant_id}" id="${pollutant.pollutant_id}">
                                    <label class="form-check-label" for="${pollutant.pollutant_id}">
                                            ${pollutant.pollutant_name}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <span class="badge text-bg-primary">흡수액, 중금속</span>
                    <div class="my-3">
                        <c:forEach var="pollutant" items="${pollutants}">
                            <c:if test="${pollutant.method eq '흡수액, 중금속'}">
                                <div class="form-check ms-2">
                                    <input class="form-check-input" type="checkbox" value="${pollutant.pollutant_id}" id="${pollutant.pollutant_id}">
                                    <label class="form-check-label" for="${pollutant.pollutant_id}">
                                            ${pollutant.pollutant_name}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
                    <span class="badge text-bg-primary">중금속</span>
                    <div class="my-3">
                        <c:forEach var="pollutant" items="${pollutants}">
                            <c:if test="${pollutant.method eq '중금속'}">
                                <div class="form-check ms-2">
                                    <input class="form-check-input" type="checkbox" value="${pollutant.pollutant_id}" id="${pollutant.pollutant_id}">
                                    <label class="form-check-label" for="${pollutant.pollutant_id}">
                                            ${pollutant.pollutant_name_en}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <span class="badge text-bg-primary">수은</span>
                    <div class="my-3">
                        <c:forEach var="pollutant" items="${pollutants}">
                            <c:if test="${pollutant.method eq '수은'}">
                                <div class="form-check ms-2">
                                    <input class="form-check-input" type="checkbox" value="${pollutant.pollutant_id}" id="${pollutant.pollutant_id}">
                                    <label class="form-check-label" for="${pollutant.pollutant_id}">
                                            ${pollutant.pollutant_name_en}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="border p-4 mx-2 flex-grow-1 shadow-sm rounded bg-body-tertiary">
                    <span class="badge text-bg-primary">흡착관 T-Nox</span>
                    <div class="my-3">
                        <c:forEach var="pollutant" items="${pollutants}">
                            <c:if test="${pollutant.method eq '흡착관(T)'}">
                                <div class="form-check ms-2">
                                    <input class="form-check-input" type="checkbox" value="${pollutant.pollutant_id}" id="${pollutant.pollutant_id}">
                                    <label class="form-check-label" for="${pollutant.pollutant_id}">
                                            ${pollutant.pollutant_name}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <span class="badge text-bg-primary">흡착관 Air-Tox</span>
                    <div class="my-3">
                        <c:forEach var="pollutant" items="${pollutants}">
                            <c:if test="${pollutant.method eq '흡착관(A)'}">
                                <div class="form-check ms-2">
                                    <input class="form-check-input" type="checkbox" value="${pollutant.pollutant_id}" id="${pollutant.pollutant_id}">
                                    <label class="form-check-label" for="${pollutant.pollutant_id}">
                                            ${pollutant.pollutant_name}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<footer class="w-100">

</footer>

<script>
    $(document).ready(function(){
        $('#calculateBtn').on("click", function() {
            const selectedPollutant = [];

            $('input[type="checkbox"]:checked').each(function() {
                const pollutant_id = $(this).val();
                selectedPollutant.push({"pollutant_id": pollutant_id});
            });

            if (selectedPollutant.length === 0) return alert("항목을 선택해 주세요.");

            $.ajax({
                url: '<c:url value="/document/abilityScore"/>',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(selectedPollutant),
                success: function(response) {
                    const score = response.score;
                    $('#score').html(score);
                },
                error: function() {
                    alert("error");
                }
            });
        });
    });
</script>
</body>
</html>