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
<nav id="navbar" class="navbar fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" id="logo" href="#">LOGO</a>
        <a class="navbar-brand" id="home" href=""${pageContext.request.contextPath}/home">Home</a>
        <a class="navbar-brand" id="dynamicPricing" href="${pageContext.request.contextPath}/marketplace">Dynamic
            Pricing</a>
        <a class="navbar-brand" id="university" href="#">Aristotle University of Thessaloniki</a>  <!--  or anything -->
    </div>
</nav>

<br>
<br>
<br>


<div id="historyDiv">
    <h3 id="placeholder"></h3>
</div>


<script>

    const data_products = [];
    const data_orders = [];
    const data_views = [];

    function showInput(resultID) {
        $('#resultInput' + resultID).toggle();
    }

    function download_data_products(id) {

        var hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(data_products[id]);
        hiddenElement.target = '_blank';
        hiddenElement.download = 'data_products_' + (id + 1) + '.csv';
        hiddenElement.click();
    }

    function download_data_views(id) {

        var hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(data_views[id]);
        hiddenElement.target = '_blank';
        hiddenElement.download = 'data_views_' + (id + 1) + '.csv';
        hiddenElement.click();
    }

    function download_data_orders(id) {

        var hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(data_orders[id]);
        hiddenElement.target = '_blank';
        hiddenElement.download = 'data_orders_' + (id + 1) + '.csv';
        hiddenElement.click();
    }

    $(document).ready(function () {

        $.ajax({
            type: "POST",
            url: "getHistory",
            contentType: "application/json",
            data: {},
            success: function (result) {

                const obj = JSON.parse(result);

                for (var i = 0; i < obj.output.length; i++) {

                    data_products.push(obj.output[i].data_products);
                    data_orders.push(obj.output[i].data_orders);
                    data_views.push(obj.output[i].data_views);

                    var resultId = "result" + i;
                    var resultButton = "resultBtn" + i;
                    var resultInput = "resultInput" + i;

                    var inputObj = JSON.parse(obj.output[i].input_fields);

                    for (j in inputObj.dataShops) {
                        console.log(inputObj.dataShops[j].avgProfitDiff);
                    }


                    if (i !== 0) {

                        $("<div id=\"" + resultId + "\" class=\"mt-3\">" +
                            "<button id=\"" + resultButton + "\" class=\"btn btn-outline-dark w-100\" onClick=\"showInput(" + i + ")\">" +
                            obj.output[i].timestamp.slice(0, -2) + " | " +
                            obj.output[i].run_time + "s" +
                            "</button>" +
                            "<div id=\"" + resultInput + "\">" +
                            "<button onclick=\"download_data_products(" + i + ")\" class='tableResult'>Data Products</button>" +
                            "<button onclick=\"download_data_views(" + i + ")\" class='tableResult'>Data Views</button>" +
                            "<button onclick=\"download_data_orders(" + i + ")\" class='tableResult'>Data Orders</button>" +
                            "SeedsNN1: " + inputObj.seedsNN1 +
                            "</div>" +
                            "</div>" +
                            "<br>").insertAfter($('#result' + (i - 1)));

                        $('#' + resultInput).hide();

                    } else {

                        $('#placeholder').replaceWith(
                            "<div id=\"" + resultId + "\" class=\"mt-3\">" +
                            "<button id=\"" + resultButton + "\" class=\"btn btn-outline-dark w-100\" onClick=\"showInput(" + i + ")\">" +
                            obj.output[i].timestamp.slice(0, -2) + " | " +
                            obj.output[i].run_time + "s" +
                            "</button>" +
                            "<div id=\"" + resultInput + "\">" +
                            "<button onclick=\"download_data_products(" + i + ")\" class='tableResult'>Data Products</button>" +
                            "<button onclick=\"download_data_views(" + i + ")\" class='tableResult'>Data Views</button>" +
                            "<button onclick=\"download_data_orders(" + i + ")\" class='tableResult'>Data Orders</button>" +
                            "Number of customer: " + inputObj.numberOfCustomers +
                            "Mean: " + inputObj.meanOfCustomers +
                            "Standard deviation: " + inputObj.standardDeviationOfCustomers +
                            "SeedsNN1: " + inputObj.seedsNN1 +
                            "nEpochsNN1: " + inputObj.nEpochsNN1 +
                            "nSamplesNN1: " + inputObj.nSamplesNN1 +
                            "Batch sizeNN1: " + inputObj.batchSizeNN1 +
                            "Learning ratecNN1: " + inputObj.learningRateNN1 +
                            "SeedsNN2: " + inputObj.seedsNN2 +
                            "nEpochsNN2: " + inputObj.nEpochsNN2 +
                            "nSamplesNN2: " + inputObj.nSamplesNN2 +
                            "Batch sizeNN2: " + inputObj.batchSizeNN2 +
                            "Learning ratecNN2: " + inputObj.learningRateNN2 +
                            "</div>" +
                            "</div>" +
                            "<br>");

                        $('#' + resultInput).hide();
                    }
                }

            },
            error: function (xhr) {
                console.log("Error getting response in AJAX");
            }
        });
    });


</script>


</body>
</html>
