<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>manager</title>
  <%@include file="../semantic/header.jsp"%>
</head>
<body class="d-flex flex-wrap">
<!-- navigation bar layout -->
<%@include file="../semantic/navbar.jsp"%>
<main class="d-flex flex-column flex-grow-1">
  <div class="tostify"></div>
  <div class="container" style="padding: 1.875rem 0 0">
    <div class="border p-4" style="background-color: white;">
      <p style="margin-left: 1.25rem;"><b>사업장 측정 현황</b></p>
      <hr>
      <div class="m-2">
        <label for="searchWorkplace" style="font-size: 0.875rem"><b>사업장 필터&nbsp;</b></label>
        <select id="searchWorkplace" class="js-example-basic-multiple w-100"
                name="states[]" multiple="multiple">
          <c:forEach var="workplace" items="${workplaces}">
            <option value="${workplace.workplace_id}">${workplace.workplace_name}</option>
          </c:forEach>
        </select>
      </div>
      <canvas id="myChart" style="width:100%;max-height:300px;"></canvas>
    </div>
  </div>
  <div class="container" style="padding: 1.875rem 0 0">
    <div class="border p-4" style="background-color: white;">
      <p style="margin-left: 1.25rem;"><b>detail</b></p>
      <hr>

    </div>
  </div>
</main>
<footer class="w-100">

</footer>

<script>
  $(document).ready(function() {
    $('#searchWorkplace').select2({});

    $('#searchWorkplace').on('change', function () {
      const selectedWorkplace = $(this).val();
      loadChartData(selectedWorkplace);
    });

    const ctx = document.getElementById('myChart');
    const completeCntData = [
      ${completeCnt.monthly},
      ${completeCnt.quarterly},
      ${completeCnt.semiannual},
      ${completeCnt.annual}
    ]
    const nonCompleteCntData = [
      ${nonCompleteCnt.monthly},
      ${nonCompleteCnt.quarterly},
      ${nonCompleteCnt.semiannual},
      ${nonCompleteCnt.annual}
    ]

    let chart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ['1회/월', '1회/분기', '1회/반기', '1회/년'],
          datasets: [
            {
              label: '완료',
              data: completeCntData,
              backgroundColor: 'rgba(75, 192, 192, 0.5)', // 색상
            },
            {
              label: '미완료',
              data: nonCompleteCntData,
              backgroundColor: 'rgba(255, 99, 132, 0.5)', // 색상
            },
          ],
        },
        options: {
          responsive: true,
          plugins: {
            legend: {
              position: 'right',
            },
            datalabels: {
              anchor: 'center',
              align: 'center',
              formatter: (value, context) => {
                const label = context.dataset.label;

                if (value === 0 || value == null) {
                  return '';
                }

                return label === '완료' ? `완료: \${value}` : `미완료: \${value}`;
              },
              font: {
                size: 10,
                weight: 'bold'
              },
            },
          },
          scales: {
            x: {
              stacked: true,
            },
            y: {
              stacked: true,
              beginAtZero: true,
            },
          },
        },
        plugins: [ChartDataLabels],
    });

    function loadChartData(workplaceIds = []) {
      const queryString = workplaceIds.map(id => `workplaceIds=` + id).join('&');

      const url = workplaceIds.length === 0
        ? '<c:url value="/statistics/chart/all"/>'
        : "http://localhost:8080/ensolution/statistics/chart/workplace?" + queryString;

      $.ajax({
        url: url,
        method: 'GET',
        success: function(response) {
          const completeCntData = response.completeStats;
          const NonCompleteCntData = response.nonCompleteStats;

          chart.data.datasets[0].data = [
            completeCntData.monthly,
            completeCntData.quarterly,
            completeCntData.semiannual,
            completeCntData.annual
          ];

          chart.data.datasets[1].data = [
            NonCompleteCntData.monthly,
            NonCompleteCntData.quarterly,
            NonCompleteCntData.semiannual,
            NonCompleteCntData.annual
          ];

          chart.update();
        },
        error: function(err) {
          alert("Error loading data:" + err);
        }
      });
    }
  });
</script>
</body>
</html>