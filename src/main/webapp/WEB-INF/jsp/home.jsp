<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="icon" type="image/x-icon" href="./sources/logo-05.png" style="width: 100%;">
    <%--Font family--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
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
        <a href="home"><img class="logo" src="./sources/logo-05.png" alt="logo"/></a>
    </div>
    <nav class="navbar-links">
        <li><a class="navbar-link" id="logo" href="home"></a></li>
        <li class="active"><a class="navbar-link" id="home" href="${pageContext.request.contextPath}/home"> Home </a>
        </li>
        <li><a class="navbar-link" id="dynamicPricing" href="${pageContext.request.contextPath}/marketplace">Dynamic
            Pricing Simulator</a></li>
        <li><a class="navbar-link" id="results" href="${pageContext.request.contextPath}/history"> Results </a></li>
    </nav>
    <script>
        // Add active class to the current button (highlight it)
        let header = document.getElementById("navbar-links");
        let btns = header.getElementsByClassName("navbar-link");
        for (let i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function () {
                let current = document.getElementsByClassName("active");
                current[0].className = current[0].className.replace(" active", "");
                this.className += " active";
            });
        }
    </script>
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
                In recent years, e-commerce is growing rapidly and is being established as one of the dominant
                ways of making commercial transactions. Pricing and policies strategies employed by businesses
                are one of the key decisions for surviving in this highly competitive market, achieving goals and
                maximizing profits. <span id="dots">...</span><span id="more">
                <br> For this reason, various dynamic pricing algorithms have been implemented and adapted to the
                continuously changing conditions of the online market. These algorithms are based on the
                abundance of data available to the online stores about market conditions as well as customers'
                preferences and consumption habits. Utilizing the above data and integrating them into dynamic
                pricing strategies can give a significant competitive advantage to businesses. However, so far these
                techniques have been applied to limited business areas, e.g. airline and hotel bookings.
                In a previous thesis was developed a system with dynamic pricing methods for online stores that
                take into account demand, competition, available stock as well as user profiles. The system
                combines the mentioned data and uses neural networks in conjunction with optimization and
                personalization methods and algorithms in order to set dynamically the price for each product per
                customer in order to optimise the conversion rate. </span>
            </p>
            <button onclick="myFunction()" id="myBtn">Read more</button>
            <br>
            <img src="./sources/DynamicPricing.png" style="padding: 30px 0px 0px 0px"/>
            <br>
            <p>RESEARCH-ARTICLE:
                <a href="https://dl.acm.org/doi/abs/10.1145/3477282.3477283" target="_blank"
                   style="color: #064C58; margin: 0px; "> Personalized dynamic pricing with RFM modeling </a>
            </p>
        </div>
    </section>
    <section class="presentation">
        <div class="intro-text">
            <h2>Why is Pricing Analytics Software useful?</h2>
            <p class="text-left"> Pricing analytics software is an automated tool that allows you to analyse the
                effectiveness and profitability of a pricing strategy. Pricing analytics software helps optimize
                decision-making within eCommerce businesses.
                The software collects data on multiple pricing metrics, such as sales, profits, price changes or user
                behaviours, and how they change over time. It also considers how variations in supply and demand within
                the market affect the eCommerce business. <span id="dot">...</span><span id="readMore">
                <br>This data stream is then easily analysed and represented to
                provide key information on the profitability of prices. This will help you implement more effective and
                consistent changes to your pricing strategy.Its functionality means pricing analytics software is
                crucial in the current context. Pricing is becoming increasingly complex due to the ever-growing online
                market, the speed with which changes occur at a global level, and the current period of inflation.
                Pricing becomes increasingly complicated the larger the catalogue of eCommerce products and the audiences
                it targets. You can harness the benefits of applying Big Data to pricing with a pricing analytics tool
                which will organize, study, and compare thousands of proprietary and competitors' data. Benefits of
                pricing analytics software for your eCommerce. In addition to the advantages mentioned above, pricing
                analytics software can help you in the following ways in your day-to-day business. Easily identify
                opportunities or weaknesses in your pricing strategy, and new market trends. <br> <br>
                &bull; Identify which sales channels are most profitable and which types of pricing work best. <br><br>
                &bull; Plan effective and profitable promotions. <br><br>
                Learn more about different customer groups. By studying variables such as willingness to pay, you can
                better segment the prices aimed at each type of client.
                </span>
            </p>

            <button onclick="myFunction_read()" id="myBtn_2">Read more</button>
        </div>
    </section>
    <section class="logos">
        <a href="https://issel.ee.auth.gr/en/13-2/" target="_blank"><img class="issel" src="./sources/issel.png"/></a>
        <a href="http://ee.auth.gr/en/" target="_blank"><img class="auth" src="./sources/thmmy.png"/></a>
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

    function myFunction() {
        let dots = document.getElementById("dots");
        let moreText = document.getElementById("more");
        let btnText = document.getElementById("myBtn");

        if (dots.style.display === "none") {
            dots.style.display = "inline";
            btnText.innerHTML = "Read more";
            moreText.style.display = "none";
        } else {
            dots.style.display = "none";
            btnText.innerHTML = "Read less";
            moreText.style.display = "inline";
        }
    }

    function myFunction_read() {
        let dot = document.getElementById("dot");
        let readMore = document.getElementById("readMore");
        let btnText_2 = document.getElementById("myBtn_2");

        if (dot.style.display === "none") {
            dot.style.display = "inline";
            btnText_2.innerHTML = "Read more";
            readMore.style.display = "none";
        } else {
            dot.style.display = "none";
            btnText_2.innerHTML = "Read less";
            readMore.style.display = "inline";
        }
    }
</script>


</body>
</html>
