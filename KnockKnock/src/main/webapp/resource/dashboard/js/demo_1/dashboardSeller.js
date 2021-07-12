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
     
     if ($("#net-profit").length) {
      var marksCanvas = document.getElementById("net-profit");
      var idx=0;
       
      
      
      $(".countWeeklySalesDate2").each(function(){
      	idx = $(".countWeeklySalesDate2").index();
      	console.log($(".countWeeklySalesDate2").eq(2).text());
      })
      
      $(".countWeeklySalesC2").each(function(){
      	idx = $(".countWeeklySalesC2").index();
      	console.log("c2 "+$(".countWeeklySalesC2").eq(2).text());
      })
       
      $(".countWeeklySalesC1").each(function(){
       idx = $("countWeeklySalesC1").index();
       console.log("c1:" + $("countWeeklySalesC1").eq(0).text());
      })
      var marksData = {      
        labels: [$(".countWeeklySalesDate2").eq(0).text(), $(".countWeeklySalesDate2").eq(1).text(), $(".countWeeklySalesDate2").eq(2).text(), $(".countWeeklySalesDate2").eq(3).text(), $(".countWeeklySalesDate2").eq(4).text(), $(".countWeeklySalesDate2").eq(5).text(), $(".countWeeklySalesDate2").eq(6).text()],
        datasets: [{
          label: "지난주",
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
          data: [$(".countWeeklySalesC2").eq(0).text(), $(".countWeeklySalesC2").eq(1).text(), $(".countWeeklySalesC2").eq(2).text(), $(".countWeeklySalesC2").eq(2).text(), $(".countWeeklySalesC2").eq(3).text(), $(".countWeeklySalesC2").eq(4).text(), $(".countWeeklySalesC2").eq(5).text()]
        }, {
          label: "이번주",
          backgroundColor: 'rgb(251, 210, 255)',
          borderColor: 'rgb(251, 210, 255)',
          borderWidth: 0,
          fill: true,
          radius: 0,
          pointRadius: 0,
          pointBorderWidth: 0,
          pointBackgroundColor: 'rgba(150, 77, 247,1)',
          pointHoverRadius: 10,
          pointHitRadius: 5,
          data: [$(".countWeeklySalesC1").eq(0).text(), $(".countWeeklySalesC1").eq(1).text(), $(".countWeeklySalesC1").eq(2).text(), $(".countWeeklySalesC1").eq(3).text(), $(".countWeeklySalesC1").eq(4).text(), $(".countWeeklySalesC1").eq(5).text()]
        }]
      };


      var chartOptions = {
        scale: {
          ticks: {
            beginAtZero: true,
            min: 0,
            max: 10,
            stepSize: 1,
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
     
    
  });
})(jQuery);