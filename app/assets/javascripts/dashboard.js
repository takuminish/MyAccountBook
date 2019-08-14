$(document).on("ready turbolinks:load", function() {
        
    $("#next_year").on("click", () => {
        getAjaxPurchaseData("dashboard/ajax_get_year_purchase_data", gon.next_num-1, yearAddData());
    });
    
    $("#ago_year").on("click", () => {
        getAjaxPurchaseData("dashboard/ajax_get_year_purchase_data", gon.next_num+1, yearAddData());
    });
    
    $("#next_month").on("click", () => {
        getAjaxPurchaseData("dashboard/ajax_get_month_purchase_data", gon.next_num-1, monthAddData());
    });
    
    $("#ago_month").on("click", () => {
        getAjaxPurchaseData("dashboard/ajax_get_month_purchase_data", gon.next_num+1, monthAddData());
    });
    
    $("#next_week").on("click", () => {
        getAjaxPurchaseData("dashboard/ajax_get_week_purchase_data", gon.next_num-1, weekAddData());
    });
    
    $("#ago_week").on("click", () => {
        getAjaxPurchaseData("dashboard/ajax_get_week_purchase_data", gon.next_num+1, weekAddData());
    });
    
    barChartNameByWeek = document.getElementById('expenseByWeekBarChart');
    barChartByWeek = createBarChart(barChartNameByWeek, '1日の支出金額', gon.week_date_purchase.map(x => x[0]), gon.week_date_purchase.map(x => x[1]));
    
    barChartNameByMonth = document.getElementById('expenseByMonthBarChart');
    barChartByMonth = createBarChart(barChartNameByMonth, '1週間の支出金額', gon.month_date_purchase.map(x => x[0]), gon.month_date_purchase.map(x => x[1]));
    
    barChartNameByYear = document.getElementById('expenseByYearBarChart');
    barChartByYear = createBarChart(barChartNameByYear, '1ヶ月の支出金額', gon.year_date_purchase.map(x => x[0]), gon.year_date_purchase.map(x => x[1]));
    
    
    pieChartNameByWeek = document.getElementById('expenseByWeekPieChart');
    pieChartByWeek = createPieChart(pieChartNameByWeek, '1週間の支出種類', gon.product_category_by_week.map(x => x.name), gon.product_category_by_week.map(x => x.total_cost));
    
    pieChartNameByMonth = document.getElementById('expenseByMonthPieChart');
    pieChartByMonth = createPieChart(pieChartNameByMonth, '1ヶ月の支出種類', gon.product_category_by_month.map(x => x.name), gon.product_category_by_month.map(x => x.total_cost));
    
    pieChartNameByYear = document.getElementById('expenseByYearPieChart');
    pieChartByYear = createPieChart(pieChartNameByYear, '1年の支出種類', gon.product_category_by_year.map(x => x.name), gon.product_category_by_year.map(x => x.total_cost));
    
    function weekAddData() {
        barChartByWeek.data.labels = gon.week_date_purchase.map(x => x[0]);
        barChartByWeek.data.datasets[0].data = gon.week_date_purchase.map(x => x[1]);
        pieChartByWeek.data.labels = gon.product_category_by_week.map(x => x.name);
        pieChartByWeek.data.datasets[0].data = gon.product_category_by_week.map(x => x.total_cost);
        barChartByWeek.update();
        pieChartByWeek.update();
    }
    
    function monthAddData() {
        barChartByMonth.data.labels = gon.month_date_purchase.map(x => x[0]);
        barChartByMonth.data.datasets[0].data = gon.month_date_purchase.map(x => x[1]);
        pieChartByMonth.data.labels = gon.product_category_by_month.map(x => x.name);
        pieChartByMonth.data.datasets[0].data = gon.product_category_by_month.map(x => x.total_cost);
        barChartByMonth.update();
        pieChartByMonth.update();
    }
    
    function yearAddData() {
        barChartByYear.data.labels = gon.year_date_purchase.map(x => x[0]);
        barChartByYear.data.datasets[0].data = gon.year_date_purchase.map(x => x[1]);
        pieChartByYear.data.labels = gon.product_category_by_year.map(x => x.name);
        pieChartByYear.data.datasets[0].data = gon.product_category_by_year.map(x => x.total_cost);
        barChartByYear.update();
        pieChartByYear.update();
    }
    
    function createBarChart(chartId, chartLabel, chartDataLabel, chartData) {
        chart = new Chart(chartId, {
            type: 'bar',
            data: {
                labels: chartDataLabel,
                datasets: [{
                    label: chartLabel,
                    data: chartData,
                    backgroundColor: 
                        'rgba(255, 99, 132, 0.2)'
                    ,
                    borderColor: 
                        'rgba(255, 99, 132, 1)'
                    ,
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    
        return chart;
    }
    
    function createPieChart(chartId, chartLabel, chartDataLabel, chartData) {
        chart = new Chart(chartId, {
        type: 'pie',
        data: {
            labels: chartDataLabel,
            datasets: [{
                label: chartLabel,
                data: chartData,
                backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [             
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
                ],
                borderWidth: 1
            }]
        },
        options: {
    
    
        }
    });
        return chart;
    }
});

function getAjaxPurchaseData(url, next_num, addGraphData) {
    $.ajax({
        url: url,
        type: "GET",
        data: {
            'next_num': next_num
        }
    }).done( (data) => {
    $('head').append(data); 
    addGraphData();
    })
}