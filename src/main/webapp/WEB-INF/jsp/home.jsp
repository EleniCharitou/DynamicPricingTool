<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <%-- Bootstrap --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <%-- jQuery --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%--ploty.js--%>
    <script src="https://cdn.plot.ly/plotly-2.14.0.min.js"></script>
    <%-- highcharts.js --%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js"></script>
    <%--CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/home.css">


</head>
<body>
<header>
    <div class="logo-container">
        <a href="home"><img class="logo" src="./sources/DynamicPricinglogoBlueGreen.png" alt="logo"/></a>
    </div>
    <nav class="navbar-links">
        <li><a class="navbar-link" id="home" href="home"></a></li>
        <li><a class="navbar-link" id="dynamicPricing" href="${pageContext.request.contextPath}/marketplace">Dynamic
            Pricing Simulator</a></li>
        <li><a class="navbar-link" id="results" href="${pageContext.request.contextPath}/history"> Results </a></li>
        <li><a class="navbar-link" id="university" href="#">Aristotle University of Thessaloniki</a></li>
        <!--  or anything -->
    </nav>
</header>
<main>

    <section class="modal">
        <div id="cover"></div>
        <!-- The Modal -->
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <p class="stats"> Statistics: </p>
                <%--pre-result from data_product.csv                --%>
                <div class="flex-container">
                    <div class="card" id="modalData"></div>
                    <div class="card" id="averageBaseCost"></div>
                    <div class="card" id="averagePrice"></div>
                </div>
                <div class="flex-container">
                    <div id='piePrice'><!-- Plotly chart will be drawn inside this DIV --></div>
                    <div id='marginPriceBaseCost'><!-- Linear Plotly chart will be drawn inside this DIV --></div>
                </div>
                <%--pre-result from data_orders.csv                --%>
                <div class="flex-container">
                    <div class="card" id="orders"></div>
                    <div class="card" id="averageTotal"></div>
                </div>
                <div class="flex-container">
                    <div id='pieTotal'><!-- Plotly chart will be drawn inside this DIV --></div>
                    <div id="pieOrderTime"></div>
                    <div id="scatterTime"></div>
                </div>
                <div class="flex-container">
                    <div id="views"></div>
                </div>
                <div id="final"></div>

    </section>
    <section class="presentation">
        <div class="intro-text">
            <br><br><br><br><br><br>
            <h2>Dynamic pricing model</h2>
            <p class="text-left" id="introduction">
                Some words about the thesis and the model which is used.
                .................
                Some words about the thesis and the model which is used.
                Some words about the thesis and the model which is used.
                Some words about the thesis and the model which is used.
                Some words about the thesis and the model which is used.
                Some words about the thesis and the model which is used.
                Some words about the thesis and the model which is used.
                Some words about the thesis and the model which is used.
                Some words about the thesis and the model which is used.
                Some words about the thesis and the model which is used.
                Some words about the thesis and the model which is used.
            </p>
            <img src="./sources/Group 1.png"/>
        </div>
    </section>
    <section class="presentation">
        <div class="intro-text">
            <h2>Why is Pricing Analytics Software useful?</h2>
            <p class="text-left"> Pricing analytics software is an automated tool that allows you to analyse the
                effectiveness and profitability of a
                pricing strategy. Pricing analytics software helps optimize decision-making within eCommerce businesses.
                The software collects data on
                multiple pricing metrics, such as sales, profits, price changes or user behaviours, and how they change
                over time. It also considers
                how variations in supply and demand within the market affect the eCommerce business. This data stream is
                then easily analysed and
                represented to provide key information on the profitability of prices. This will help you implement more
                effective and consistent
                changes to your pricing strategy.Its functionality means pricing analytics software is crucial in the
                current context. Pricing is
                becoming increasingly complex due to the ever-growing online market, the speed with which changes occur
                at a global level, and the
                current period of inflation. Pricing becomes increasingly complicated the larger the catalogue of
                eCommerce products and the audiences
                it targets. You can harness the benefits of applying Big Data to pricing with a pricing analytics tool
                which will organize, study, and
                compare thousands of proprietary and competitors' data. Benefits of pricing analytics software for your
                eCommerce. In addition to the
                advantages mentioned above, pricing analytics software can help you in the following ways in your
                day-to-day business. Easily identify
                opportunities or weaknesses in your pricing strategy, and new market trends. <br> <br>
                &bull; Identify which sales channels are most profitable and which types of pricing work best. <br><br>
                &bull; Plan effective and profitable promotions. <br><br>
                Learn more about different customer groups. By studying variables such as willingness to pay, you can
                better segment the prices aimed at each type of client.
                <br><br><br><br><br><br>
            </p>
        </div>
    </section>
    <section class="logos">
        <a href="https://issel.ee.auth.gr/en/13-2/"><img class="issel" src="./sources/issel.png"/></a>
        <a href="http://ee.auth.gr/en/"><img class="auth" src="./sources/thmmy.png"/></a>
    </section>
    <img class="illustration" src="./sources/illustration.jpg" alt=""/>
</main>

<footer>
    <div class="copyrights">
        © 2023 Copyright Eleni Charitou
        <!-- <a class="text-white" href="https://mdbootstrap.com/">MDBootstrap.com</a> -->
        <br>Student at Aristotle University of Thessaloniki 2023
    </div>
</footer>
<!-- <video autoplay muted loop id="myVideo" width="100%">
    <source src="slow.mp4" type="video/mp4">
    Your browser does not support HTML5 video.
</video> -->


<%--<div id="tester" style="width:600px;height:250px;"></div>--%>


<script>
    $(document).ready(function () {

        $('#submitFile').on('click', function () {
            var file = document.getElementById('fileID').files[0]; //Files[0] = 1st file
            var reader = new FileReader();
            reader.readAsText(file, 'UTF-8');

            reader.onload = () => {
                // console.log(reader.result);
                // console.log(typeof reader.result);

                $.ajax({
                    type: "POST",
                    url: "postFile",
                    data: {fileTest: reader.result},
                    success: function (result) {
                        // console.log(result);

                        let mean = result.mean;
                        let stdDev = result.standardDeviation;
                        let points = result.inputValues;

                        const normalY = (x, mean, stdDev) => Math.exp((-0.5) * Math.pow((x - mean) / stdDev, 2));

                        let seriesData = points.map(x => ({x, y: normalY(x, mean, stdDev)}));

                        Highcharts.chart('container', {
                                title: {
                                    text: 'Test Chart'
                                },
                                subtitle: {
                                    text: ''
                                },
                                chart: {
                                    type: 'area'
                                },
                                series: [{
                                    name: 'testSeries',
                                    data: seriesData,
                                    turboThreshold: 100000
                                }],
                                credits: {
                                    enabled: false
                                },
                            });
                        },
                        error: function (xhr) {
                            console.log("Error getting response in AJAX");
                        }
                    });
                }
            });

// plot Normal Distribution------------------------------------------------------------------------------------------
            //TESTER = document.getElementById('tester');
            /*Plotly.newPlot( document.getElementById('tester'), [{
                x: [1, 2, 3, 4, 5],
                y: [1, 2, 4, 8, 16] }], {
                margin: { t: 0 } } );*/


//notification------------------------------------------------------------------------------------------
            document.addEventListener("DOMContentLoaded", function () {
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
                        // console.log(result);
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
