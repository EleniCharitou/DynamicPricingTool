<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Results-Stats</title>
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
    <%--plotly.js   PIE--%>
    <script src='https://cdn.plot.ly/plotly-2.18.2.min.js'></script>


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
    const data_views = [];
    const data_orders = [];
    const input_NN2 = [];

    // const training_data = [];
    // const testing_data = [];

    function showInput(resultID) {
        $('#resultInput' + resultID).toggle();
    }

    function download_data_products(id) {

        let hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(data_products[id]);
        hiddenElement.target = '_blank';
        hiddenElement.download = 'data_products_' + (id + 1) + '.csv';
        hiddenElement.click();
    }

    function download_data_views(id) {

        let hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(data_views[id]);
        hiddenElement.target = '_blank';
        hiddenElement.download = 'data_views_' + (id + 1) + '.csv';
        hiddenElement.click();
    }

    function download_data_orders(id) {

        let hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(data_orders[id]);
        hiddenElement.target = '_blank';
        hiddenElement.download = 'data_orders_' + (id + 1) + '.csv';
        hiddenElement.click();
    }


    // function download_training_data(id) {
    //
    //     var hiddenElement = document.createElement('a');
    //     hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(training_data[id]);
    //     hiddenElement.target = '_blank';
    //     hiddenElement.download = 'training_data_' + (id + 1) + '.csv';
    //     hiddenElement.click();
    // }
    // function download_testing_data(id) {
    //
    //     var hiddenElement = document.createElement('a');
    //     hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(testing_data[id]);
    //     hiddenElement.target = '_blank';
    //     hiddenElement.download = 'testing_data_' + (id + 1) + '.csv';
    //     hiddenElement.click();
    // }

    $(document).ready(function () {

        $.ajax({
            type: "POST",
            url: "getHistory",
            contentType: "application/json",
            data: {},
            success: function (result) {

                const obj = JSON.parse(result);
                console.log(obj.output1.length);

                for (let i = 0; i < obj.output.length; i++) {

                    data_products.push(obj.output[i].data_products);
                    data_orders.push(obj.output[i].data_orders);
                    data_views.push(obj.output[i].data_views);
                    // input_NN2.push(obj.output[i].input_NN2);
                    // training_data.push(obj.output[i].training_data);
                    // testing_data.push(obj.output[i].testing_data);

                    let resultId = "result" + i;
                    let resultButton = "resultBtn" + i;
                    let resultInput = "resultInput" + i;

                    let inputObj = JSON.parse(obj.output[i].input_fields);

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
                            // "<button onclick=\"download_input_NN2(" + i + ")\" class='tableResult'>Customers' characteristics</button>" +

                            // "<button onclick=\"download_training_data(" + i + ")\" class='tableResult'>Training dataset</button>" +
                            // "<button onclick=\"download_testing_data(" + i + ")\" class='tableResult'>Testing dataset</button>" +
                            "SeedsNN1: " + inputObj.seedsNN1 +
                            //pie recency


                            //pie recency
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
                            "<button onclick=\"download_input_NN2(" + i + ")\" class='tableResult'>Empty Customers' characteristics</button>" +
                            // "<button onclick=\"download_training_data(" + i + ")\" class='tableResult'>Training dataset</button>" +
                            // "<button onclick=\"download_testing_data(" + i + ")\" class='tableResult'>Testing dataset</button>" +
                            "Number of customer: " + inputObj.numberOfCustomers +
                            "Mean: " + inputObj.meanOfCustomers +
                            "Standard deviation: " + inputObj.standardDeviationOfCustomers +
                            "Percentage of training data: " + inputObj.dataTrainingPercentage +
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
