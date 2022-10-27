<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <%-- Bootstrap --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <%-- jQuery --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%--ploty.js--%>
    <script src="https://cdn.plot.ly/plotly-2.14.0.min.js"></script>
    <%--https://jsfiddle.net/2uc346hp/--%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
</head>
<body>
    <nav class="navbar bg-light fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Dynamic Pricing</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </div>
    </nav>

    <br style="line-height:100pt"/>

    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
        <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000">
            <div class="toast-header">
                <%--<img src="..." class="rounded me-2" alt="...">--%>
                <strong class="me-auto">Notification</strong>
                <small>Just now</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div id="toast_body" class="toast-body">

            </div>
        </div>
    </div>


    <div style="width: 25%; margin:0 auto;">
        <div class="form-group">
            <label for="first_value">First Value:</label>
            <input type="text" class="form-control" id="first_value">
        </div>
        <div class="form-group">
            <label for="second_value">Second Value:</label>
            <input type="text" class="form-control" id="second_value">
        </div>
        <button id="searchButton" type="button" class="btn btn-primary" style="margin-top: 10pt">Submit</button>
    </div>

<%--    <div>--%>
<%--        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>--%>
<%--        <script type="text/javascript">--%>
<%--            google.charts.load('current', {'packages':['corechart']});--%>
<%--            google.charts.setOnLoadCallback(drawChart);--%>

<%--            function drawChart() {--%>
<%--                var data = google.visualization.arrayToDataTable([--%>
<%--                    ['Year', 'Sales', 'Expenses'],--%>
<%--                    ['2013',  1000,      400],--%>
<%--                    ['2014',  1170,      460],--%>
<%--                    ['2015',  660,       1120],--%>
<%--                    ['2016',  1030,      540]--%>
<%--                ]);--%>

<%--                var options = {--%>
<%--                    title: 'Company Performance',--%>
<%--                    hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},--%>
<%--                    vAxis: {minValue: 0}--%>
<%--                };--%>

<%--                var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));--%>
<%--                chart.draw(data, options);--%>
<%--            }--%>
<%--        </script>--%>
<%--    </div>--%>
<%--    <div id="chart_div" style="width: 100%; height: 500px;"></div>--%>

<%--    input fields and submit--%>


<%--    <div>--%>
<%--        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">--%>
<%--        </script>--%>
<%--        <canvas id="myChart" style="width:100%;max-width:700px"></canvas>--%>
<%--        <script>--%>
<%--            var xValues = [50,60,70,80,90,100,110,120,130,140,150];--%>
<%--            var yValues = [7,8,8,9,9,9,10,11,14,14,15];--%>

<%--            var myChart = new Chart("myChart", {--%>
<%--            type: "line",--%>
<%--            data: {--%>
<%--                labels: xValues,--%>
<%--                datasets:[{--%>
<%--                    fill: false,--%>
<%--                    lineTension: 0,--%>
<%--                    data: yValues--%>
<%--                }]--%>
<%--            },--%>
<%--            options: {--%>
<%--                legend: {display: false},--%>
<%--                scales: {--%>
<%--                    yAxes: [{ticks: {min: 6,max: 16}}],--%>
<%--                }--%>
<%--            }--%>
<%--        });</script>--%>
<%--    </div>--%>

    <div id="tester" style="width:600px;height:250px;"></div>

    <figure class="highcharts-figure">
        <div id="container"></div>
    </figure>

    <script>
        $(document).ready(function() {

// plot Normal Distribution------------------------------------------------------------------------------------------
            //TESTER = document.getElementById('tester');
            Plotly.newPlot( document.getElementById('tester'), [{
                x: [1, 2, 3, 4, 5],
                y: [1, 2, 4, 8, 16] }], {
                margin: { t: 0 } } );

//plot Normal Distribution------------------------------------------------------------------------------------------
            let n = 10000;  //numbre of samples
            let step = 1;
            let max = 100;
            let min = 0;
            let data = {};


            const randn_bm = (min, max, skew) => {
                var u = 0, v = 0;
                while(u === 0) u = Math.random(); //Converting [0,1) to (0,1)
                while(v === 0) v = Math.random();
                let num = Math.sqrt( -2.0 * Math.log( u ) ) * Math.cos( 2.0 * Math.PI * v );

                num = num / 10.0 + 0.5; // Translate to 0 -> 1
                if (num > 1 || num < 0) num = randn_bm(min, max, skew); // resample between 0 and 1 if out of range
                num = Math.pow(num, skew); // Skew
                num *= max - min; // Stretch to fill range
                num += min; // offset to min
                return num;
            }

            const round_to_precision = (x, precision) => {
                var y = +x + (precision === undefined ? 0.5 : precision/2);
                return y - (y % (precision === undefined ? 1 : +precision));
            }


// Seed data with a bunch of 0s
            for (let j=min; j<max; j+=step) {
                data[j] = 0;
            }

// Create n samples between min and max
            for (i=0; i<n; i+=step) {
                let rand_num = randn_bm(min, max, 1);
                let rounded = round_to_precision(rand_num, step)
                data[rounded] += 1;
            }

// Count number of samples at each increment
            let hc_data = [];
            for (const [key, val] of Object.entries(data)) {
                hc_data.push({"x": parseFloat(key), "y": val/n});
            }

// Sort
            hc_data = hc_data.sort(function(a, b){
                if(a.x < b.x) return -1;
                if(a.x > b.x) return 1;
                return 0;
            });



            Highcharts.chart('container', {
                title: {
                    text: 'Normal Distribution'
                },
                yAxis: {
                    title: {
                        text: 'Percentage chance'
                    }
                },
                xAxis: {
                    ordinal: false
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },
                plotOptions: {
                },
                series: [{
                    name: 'Percent chance',
                    data: hc_data
                }],
                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }
            });



//notification------------------------------------------------------------------------------------------
            document.addEventListener("DOMContentLoaded", function() {
                $('#liveToast').toast();
            });
//------------------------------------------------------------------------------------------
            $('#searchButton').on('click', function () {
                firstValue = $('#first_value').val();
                secondValue = $('#second_value').val();

                $.ajax({
                    type: "POST",
                    url: "getData",
                    contentType: "application/json",
                    data: JSON.stringify({
                        first_value: firstValue,
                        second_value: secondValue
                    }),
                    success: function (result) {
                        console.log(result);
                        /*alert(result.outputString);*/

                        $('#toast_body').text(result.outputString);

                        $('#liveToast').toast("show");
                    },
                    error: function (xhr) {
                        console.log("Error getting response in AJAX");
                    }
                });
            });
        });
    </script>


</body>
</html>
