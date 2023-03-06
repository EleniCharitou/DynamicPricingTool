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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vscStyle.css">


</head>
<body>
<nav class="navbar fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" id="logo" href="#">LOGO</a>
        <a class="navbar-brand" id="home" href=""${pageContext.request.contextPath}/home">Home</a>
        <a class="navbar-brand" id="dynamicPricing" href="${pageContext.request.contextPath}/marketplace">Dynamic
            Pricing</a>
        <a class="navbar-brand" id="university" href="#">Aristotle University of Thessaloniki</a>  <!--  or anything -->
    </div>
</nav>


<img src="image-1.jpg" class="img-fluid" alt="Responsive image" style="width:100%;height: 350px;">
<div class="info">
    <h2>Dynamic pricing model</h2>
    <p class="text-left" style="padding: 4%;"> Information about the project.
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's
        standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make
        a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,
        remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing
        Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions
        of Lorem Ipsum.
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's
        standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make
        a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,
        remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing
        Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions
        of Lorem Ipsum.
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's
        standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make
        a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,
        remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing
        Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions
        of Lorem Ipsum.
    </p>
</div>


<div class="HomeButtons">
    <a class="button1" href="#" role="button">Learn more</a>
    <a class="button2" href="marketplace" role="button">Use model</a>
</div>

<br>
<br>
<br>
<br>

<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true"
         data-bs-delay="5000">
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

    <div style="width: 25%; margin: 10pt auto;">
        File to upload:
        <br/>
        <input id="fileID" type="file" name="file" accept=".csv"/>
        <br/>
        <button id="submitFile" type="button" class="btn btn-primary" style="margin-top: 10pt">SubmitFile</button>
    </div>


    <div id="container" style="width: 50%;margin: 0 auto"></div>


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
