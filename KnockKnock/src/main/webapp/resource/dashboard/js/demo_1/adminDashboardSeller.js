(function ($) {
  'use strict';
  $(function () {
    var lineStatsOptions = {
      scales: {
        yAxes: [{
          display: false
        }],
        xAxes: [{
          display: false
        }]
      },
      legend: {
        display: false
      },
      elements: {
        point: {
          radius: 0
        },
        line: {
          tension: 0
        }
      },
      stepsize: 100
    }
    
    //총 결제금액이 vs 실제 판매금액(환불건 제외) 그래프
    if ($('#sales-statistics-overview').length) {
      var salesChartCanvas = $("#sales-statistics-overview").get(0).getContext("2d");
      var gradientStrokeFill_1 = salesChartCanvas.createLinearGradient(0, 0, 0, 450);
      gradientStrokeFill_1.addColorStop(1, 'rgba(255,255,255, 0.0)');
      gradientStrokeFill_1.addColorStop(0, 'rgba(102,78,235, 0.2)');
      var gradientStrokeFill_2 = salesChartCanvas.createLinearGradient(0, 0, 0, 400);
      gradientStrokeFill_2.addColorStop(1, 'rgba(255, 255, 255, 0.01)');
      gradientStrokeFill_2.addColorStop(0, '#14c671');
      var data_1_1 = [60, 75, 65, 130, 130, 145, 110, 145, 155, 149, 170];
      var data_1_2 = [0, 25, 20, 40, 70, 52, 49, 90, 70, 94, 110, 135];

      var data_2_1 = [130, 145, 155, 60, 75, 65, 130, 110, 145, 149, 170];
      var data_2_2 = [0, 70, 52, 90, 25, 20, 40, 70, 49, 94, 110, 135];

      var data_3_1 = [130, 75, 65, 130, 110, 145, 155, 60, 145, 149, 170];
      var data_3_2 = [0, 70, 52, 94, 110, 135, 90, 25, 20, 40, 70, 49];

      var data_4_1 = [130, 145, 65, 130, 75, 145, 149, 170, 110, 155, 60];
      var data_4_2 = [0, 70, 90, 25, 40, 20, 94, 110, 135, 70, 49, 52];
      var areaData = {
        labels: ["Jan 1", "Jan 7", "Jan 14", "Jan 21", "Jan 28", "Feb 4", "Feb 11", "Feb 18"],
        datasets: [{
          label: 'Revenue',
          data: data_1_1,
          borderColor: infoColor,
          backgroundColor: gradientStrokeFill_1,
          borderWidth: 2
        }, {
          label: 'Sales',
          data: data_1_2,
          borderColor: successColor,
          backgroundColor: gradientStrokeFill_2,
          borderWidth: 2
        }]
      };
      var areaOptions = {
        responsive: true,
        animation: {
          animateScale: true,
          animateRotate: true
        },
        elements: {
          point: {
            radius: 3,
            backgroundColor: "#fff"
          },
          line: {
            tension: 0
          }
        },
        layout: {
          padding: {
            left: 0,
            right: 0,
            top: 0,
            bottom: 0
          }
        },
        legend: false,
        legendCallback: function (chart) {
          var text = [];
          text.push('<div class="chartjs-legend"><ul>');
          for (var i = 0; i < chart.data.datasets.length; i++) {
            console.log(chart.data.datasets[i]); // see what's inside the obj.
            text.push('<li>');
            text.push('<span style="background-color:' + chart.data.datasets[i].borderColor + '">' + '</span>');
            text.push(chart.data.datasets[i].label);
            text.push('</li>');
          }
          text.push('</ul></div>');
          return text.join("");
        },
        scales: {
          xAxes: [{
            display: false,
            ticks: {
              display: false,
              beginAtZero: false
            },
            gridLines: {
              drawBorder: false
            }
          }],
          yAxes: [{
            ticks: {
              max: 200,
              min: 0,
              stepSize: 50,
              fontColor: "#858585",
              beginAtZero: false
            },
            gridLines: {
              color: '#e2e6ec',
              display: true,
              drawBorder: false
            }
          }]
        }
      }
      var salesChart = new Chart(salesChartCanvas, {
        type: 'line',
        data: areaData,
        options: areaOptions
      });
      document.getElementById('sales-statistics-legend').innerHTML = salesChart.generateLegend();

      $("#sales-statistics_switch_1").click(function () {
        var data = salesChart.data;
        data.datasets[0].data = data_1_1;
        data.datasets[1].data = data_1_2;
        salesChart.update();
      });
      $("#sales-statistics_switch_2").click(function () {
        var data = salesChart.data;
        data.datasets[0].data = data_2_1;
        data.datasets[1].data = data_2_2;
        salesChart.update();
      });
      $("#sales-statistics_switch_3").click(function () {
        var data = salesChart.data;
        data.datasets[0].data = data_3_1;
        data.datasets[1].data = data_3_2;
        salesChart.update();
      });
      $("#sales-statistics_switch_4").click(function () {
        var data = salesChart.data;
        data.datasets[0].data = data_4_1;
        data.datasets[1].data = data_4_2;
        salesChart.update();
      });
    }
    if ($("#net-profit").length) {
      var marksCanvas = document.getElementById("net-profit");
      var marksData = {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"],
        datasets: [{
          label: "Sales",
          backgroundColor: 'rgba(88, 208, 222,0.8)',
          borderColor: 'rgba(88, 208, 222,0.8)',
          borderWidth: 0,
          fill: true,
          radius: 0,
          pointRadius: 0,
          pointBorderWidth: 0,
          pointBackgroundColor: 'rgba(88, 208, 222,0.8)',
          pointHoverRadius: 10,
          pointHitRadius: 5,
          data: [54, 45, 60, 70, 54, 75, 60, 54]
        }, {
          label: "Orders",
          backgroundColor: 'rgba(150, 77, 247,1)',
          borderColor: 'rgba(150, 77, 247,1)',
          borderWidth: 0,
          fill: true,
          radius: 0,
          pointRadius: 0,
          pointBorderWidth: 0,
          pointBackgroundColor: 'rgba(150, 77, 247,1)',
          pointHoverRadius: 10,
          pointHitRadius: 5,
          data: [65, 75, 70, 80, 60, 80, 36, 60]
        }]
      };

      var chartOptions = {
        scale: {
          ticks: {
            beginAtZero: true,
            min: 0,
            max: 100,
            stepSize: 20,
            display: false,
          },
          pointLabels: {
            fontSize: 14
          },
          angleLines: {
            color: '#e9ebf1'
          },
          gridLines: {
            color: "#e9ebf1"
          }
        },
        legend: false,
        legendCallback: function (chart) {
          var text = [];
          text.push('<div class="chartjs-legend"><ul>');
          for (var i = 0; i < chart.data.datasets.length; i++) {
            console.log(chart.data.datasets[i]); // see what's inside the obj.
            text.push('<li>');
            text.push('<span style="background-color:' + chart.data.datasets[i].backgroundColor + '">' + '</span>');
            text.push(chart.data.datasets[i].label);
            text.push('</li>');
          }
          text.push('</ul></div>');
          return text.join("");
        },
      };

      var radarChart = new Chart(marksCanvas, {
        type: 'radar',
        data: marksData,
        options: chartOptions
      });
      document.getElementById('net-profit-legend').innerHTML = radarChart.generateLegend();
    }
     
    //총 결제건수
    if ($('#total-transaction').length) {
      var ctx = document.getElementById('total-transaction').getContext('2d');
      var gradientStrokeFill_1 = ctx.createLinearGradient(0, 100, 200, 0);
      gradientStrokeFill_1.addColorStop(0, '#fa5539');
      gradientStrokeFill_1.addColorStop(1, '#fa3252');
      var areaData = {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
        datasets: [{
          label: 'Sessions',
          data: [320, 280, 300, 280, 300, 270, 350],
          backgroundColor: gradientStrokeFill_1,
          borderColor: '#fa394e',
          borderWidth: 0,
          pointBackgroundColor: "#fa394e",
          pointRadius: 7,
          pointBorderWidth: 3,
          pointBorderColor: '#fff',
          pointHoverRadius: 7,
          pointHoverBackgroundColor: "#fa394e",
          pointHoverBorderColor: "#fa394e",
          pointHoverBorderWidth: 2,
          pointHitRadius: 7,
        }]
      };
      var areaOptions = {
        responsive: true,
        animation: {
          animateScale: true,
          animateRotate: true
        },
        elements: {
          point: {
            radius: 0
          }
        },
        layout: {
          padding: {
            left: -10,
            right: 0,
            top: 0,
            bottom: -10
          }
        },
        legend: false,
        scales: {
          xAxes: [{
            gridLines: {
              display: false
            },
            ticks: {
              display: false
            }
          }],
          yAxes: [{
            gridLines: {
              display: false
            },
            ticks: {
              display: false
            }
          }]
        }
      }
      var revenueChart = new Chart(ctx, {
        type: 'line',
        data: areaData,
        options: areaOptions
      });
    }
    
    //첫번째그래프 (판매금액 총합계)
    if ($("#market-overview-chart").length) {
      var MarketingChartCanvas = $("#market-overview-chart").get(0).getContext("2d");
	  var idx=0;
	 
	 $(".dailySalesTotal").each(function(){
	 	idx=$(".dailySalesTotal").index();
	 	console.log($(".dailySalesTotal").eq(4).text());
	 })
	 
	 var Marketing_data_1_1 = [$(".dailySalesTotal").eq(6).text(), 
	 $(".dailySalesTotal").eq(5).text(),
	 $(".dailySalesTotal").eq(4).text(),
	 $(".dailySalesTotal").eq(3).text(),
	 $(".dailySalesTotal").eq(2).text(),
	 $(".dailySalesTotal").eq(1).text(),
	 $(".dailySalesTotal").eq(0).text() ]; 
	 
	 $(".dailySales").each(function(){
	 	 idx = $(".dailySales").index();
	 	 console.log($(".dailySales").eq(idx).text());
	  })
      var MarketingChart = new Chart(MarketingChartCanvas, {
        type: 'bar',
        data: {
          labels: [$(".dailySales").eq(6).text(), $(".dailySales").eq(5).text(), $(".dailySales").eq(4).text(), $(".dailySales").eq(3).text(), $(".dailySales").eq(2).text(), $(".dailySales").eq(1).text(), $(".dailySales").eq(0).text()],
          datasets: [{
            label: '매출',
            data: Marketing_data_1_1,
            backgroundColor: ' rgb(11, 104, 19)',
            borderColor: ' rgb(11, 104, 19)',
            borderWidth: 0
          }
          ]
        },
        options: {
          responsive: true,
          maintainAspectRatio: true,
          layout: {
            padding: {
              left: 0,
              right: 0,
              top: 20,
              bottom: 0
            }
          },
          scales: {
            yAxes: [{
              ticks: {
                max: 200000,
                display: true,
                beginAtZero: true,
                fontColor: "#212529",
                stepSize: 50000
              },
              gridLines: {
                display: false,
              }
            }],
            xAxes: [{
              stacked: true,
              ticks: {
                beginAtZero: true,
                fontColor: "#212529"
              },
              gridLines: {
                color: "#e9ebf1",
                display: true
              },
              barPercentage: 0.2
            }]
          },
          legend: {
            display: false
          },
          elements: {
            point: {
              radius: 0
            }
          }
        }
      });
      $("#market-overview_1").click(function () {
        var data = MarketingChart.data;
        data.datasets[0].data = Marketing_data_1_1;
        data.datasets[1].data = Marketing_data_1_2;
        data.datasets[2].data = Marketing_data_1_2;
        data.datasets[3].data = Marketing_data_1_2;
        MarketingChart.update();
      });
      $("#market-overview_2").click(function () {
        var data = MarketingChart.data;
        data.datasets[0].data = Marketing_data_2_1;
        data.datasets[1].data = Marketing_data_2_2;
        data.datasets[2].data = Marketing_data_2_2;
        data.datasets[3].data = Marketing_data_2_2;
        MarketingChart.update();
      });
      $("#market-overview_3").click(function () {
        var data = MarketingChart.data;
        data.datasets[0].data = Marketing_data_3_1;
        data.datasets[1].data = Marketing_data_3_2;
        data.datasets[2].data = Marketing_data_3_2;
        data.datasets[3].data = Marketing_data_3_2;
        MarketingChart.update();
      });
    } 
    if ($('#stats-line-graph-1').length) {
      var lineChartCanvas = $("#stats-line-graph-1").get(0).getContext("2d");
      var gradientStrokeFill_1 = lineChartCanvas.createLinearGradient(0, 0, 0, 50);
      gradientStrokeFill_1.addColorStop(0, 'rgba(131, 144, 255, 0.5)');
      gradientStrokeFill_1.addColorStop(1, '#fff');
      var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: {
          labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10", "Day 11", "Day 12", "Day 13"],
          datasets: [{
            label: 'Profit',
            data: [7, 6, 9, 7, 8, 6, 8, 5, 7, 8, 6, 7, 7],
            borderColor: '#6d7cfc',
            backgroundColor: gradientStrokeFill_1,
            borderWidth: 3,
            fill: true
          }]
        },
        options: lineStatsOptions
      });
    }
    if ($('#stats-line-graph-2').length) {
      var lineChartCanvas = $("#stats-line-graph-2").get(0).getContext("2d");
      var gradientStrokeFill_1 = lineChartCanvas.createLinearGradient(0, 0, 0, 50);
      gradientStrokeFill_1.addColorStop(0, 'rgba(131, 144, 255, 0.5)');
      gradientStrokeFill_1.addColorStop(1, '#fff');
      var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: {
          labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10", "Day 11", "Day 12", "Day 13"],
          datasets: [{
            label: 'Profit',
            data: [7, 6, 8, 5, 7, 8, 6, 7, 7, 6, 9, 7, 8],
            borderColor: '#6d7cfc',
            backgroundColor: gradientStrokeFill_1,
            borderWidth: 3,
            fill: true
          }]
        },
        options: lineStatsOptions
      });
    }
    if ($('#stats-line-graph-3').length) {
      var lineChartCanvas = $("#stats-line-graph-3").get(0).getContext("2d");
      var gradientStrokeFill_1 = lineChartCanvas.createLinearGradient(0, 0, 0, 50);
      gradientStrokeFill_1.addColorStop(0, 'rgba(131, 144, 255, 0.5)');
      gradientStrokeFill_1.addColorStop(1, '#fff');
      var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: {
          labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10", "Day 11", "Day 12", "Day 13"],
          datasets: [{
            label: 'Profit',
            data: [8, 6, 7, 8, 5, 7, 9, 7, 8, 7, 6, 7, 6],
            borderColor: '#6d7cfc',
            backgroundColor: gradientStrokeFill_1,
            borderWidth: 3,
            fill: true
          }]
        },
        options: lineStatsOptions
      });
    }
    if ($('#stats-line-graph-4').length) {
      var lineChartCanvas = $("#stats-line-graph-4").get(0).getContext("2d");
      var gradientStrokeFill_1 = lineChartCanvas.createLinearGradient(0, 0, 0, 50);
      gradientStrokeFill_1.addColorStop(0, 'rgba(131, 144, 255, 0.5)');
      gradientStrokeFill_1.addColorStop(1, '#fff');
      var lineChart = new Chart(lineChartCanvas, {
        type: 'line',
        data: {
          labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10", "Day 11", "Day 12", "Day 13"],
          datasets: [{
            label: 'Profit',
            data: [7, 6, 8, 5, 8, 6, 8, 7, 8, 6, 9, 7, 7],
            borderColor: '#6d7cfc',
            backgroundColor: gradientStrokeFill_1,
            borderWidth: 3,
            fill: true
          }]
        },
        options: lineStatsOptions
      });
    }
    if ($('#dashboard-guage-chart').length) {
      var g3 = new JustGage({
        id: 'dashboard-guage-chart',
        value: 65,
        min: 0,
        max: 100,
        symbol: '%',
        pointer: true,
        gaugeWidthScale: 1,
        customSectors: [{
          color: '#ff0000',
          lo: 50,
          hi: 100
        }, {
          color: '#00ff00',
          lo: 0,
          hi: 50
        }],
        counter: true
      });
    }
  });
})(jQuery);