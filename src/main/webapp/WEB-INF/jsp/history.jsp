<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Results-Stats</title>
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
    <script src="https://cdn.plot.ly/plotly-2.24.1.min.js" charset="utf-8"></script>
    <%-- highcharts.js --%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js"></script>
    <%--CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/history.css">
    <%--plotly.js   PIE--%>
    <script src='https://cdn.plot.ly/plotly-2.18.2.min.js'></script>


</head>
<body>
<header>
    <div class="logo-container">
        <a href="home"><img class="logo" src="./sources/DynamicPricinglogoBlueGreen.png" alt="logo"/></a>
    </div>
    <nav class="navbar-links">
        <li><a class="navbar-link" id="logo" href="home"></a></li>
        <li><a class="navbar-link" id="home" href="${pageContext.request.contextPath}/home"> Home </a></li>
        <li><a class="navbar-link" id="dynamicPricing" href="${pageContext.request.contextPath}/marketplace">Dynamic
            Pricing Simulator</a></li>
        <li><a class="navbar-link" id="results" href="${pageContext.request.contextPath}/history"> Results </a></li>
        <li><a class="navbar-link" id="university" href="#">Aristotle University of Thessaloniki</a></li>
        <!--  or anything -->
    </nav>
</header>
<br>
<br>
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
    const metrics = [];
    const customer_data = [];

    const training_data = [];
    const testing_data = [];
    const shops_comparison = [];
    const recency = [];
    const frequency = [];
    const monetary = [];
    const pageViews = [];
    const timeSpent = [];

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

    function createRecencyPie(recency, id) {

        let data = [{
            values: [recency[0], recency[1], recency[2], recency[3], recency[4], recency[5], recency[6], recency[7]],
            labels: ['0-9', '10-24', '25-39', '40-59', '60-89', '90-139', '140-730', '731 and<br> more'],
            type: 'pie',
            texttemplate: "%{label}: %{value} (%{percent})",
            textposition: "inside",
            insidetextorientation: "radial"
        }];
        let layout = {
            autosize: false,
            width: 300,
            height: 300,
            margin: {
                l: 50,
                r: 50,
                b: 50,
                t: 50
            },
            paper_bgcolor: '#f5f5f5',
            title: "Recency <br><sup>(days)</sup>",
            font: {size: 11},
        };
        Plotly.newPlot('recencyPie' + id, data, layout);
        // }
    }

    function createFrequencyPie(frequency, id) {

        let data = [{
            values: [frequency[0], frequency[1], frequency[2], frequency[3], frequency[4], frequency[5], frequency[6], frequency[7]],
            labels: ['0-1', '1-4', '4-7', '7-10', '10-15', '15-30', '30-60', '60 and<br> more'],
            type: 'pie',
            texttemplate: "%{label}: %{value} (%{percent})",
            textposition: "inside",
            insidetextorientation: "radial"
        }];
        let layout = {
            autosize: false,
            width: 300,
            height: 300,
            margin: {
                l: 50,
                r: 50,
                b: 50,
                t: 50
            },
            paper_bgcolor: '#f5f5f5',
            title: "Frequency <br><sup>(orders/year)</sup>",
            font: {size: 11}
        };
        Plotly.newPlot('frequencyPie' + id, data, layout);
    }

    function createMonetaryPie(monetary, id) {

        let data = [{
            values: [monetary[0], monetary[1], monetary[2], monetary[3], monetary[4], monetary[5], monetary[6], monetary[7]],
            labels: ['0-49.99', '49.99-99.99', '99.99-149.99', '149.99-199.99', '149.99-199.99', '149.99-199.99', '149.99-199.99', '149.99-199.99', '149.99-199.99'],
            type: 'pie',
            texttemplate: "%{label}: %{value} (%{percent})",
            textposition: "inside",
            insidetextorientation: "radial"
        }];
        let layout = {
            autosize: false,
            width: 300,
            height: 300,
            margin: {
                l: 50,
                r: 50,
                b: 50,
                t: 50
            },
            paper_bgcolor: '#f5f5f5',
            title: "Monetary <br><sup>(€)</sup>",
            font: {size: 11}
        };
        Plotly.newPlot('monetaryPie' + id, data, layout);
    }

    function createPageViewsPie(pageViews, id) {

        let data = [{
            values: [pageViews[0], pageViews[1], pageViews[2], pageViews[3], pageViews[4], pageViews[5], pageViews[6], pageViews[7], pageViews[8]],
            labels: ['0-199', '200-499', '500-999', '1000-1499', '1500-1999', '2000-2999', '3000-4999', '5000-9999', '10000 and<br> more'],
            type: 'pie',
            texttemplate: "%{label}: %{value} (%{percent})",
            textposition: "inside",
            insidetextorientation: "radial"
        }];
        let layout = {
            autosize: false,
            width: 300,
            height: 300,
            margin: {
                l: 50,
                r: 50,
                b: 50,
                t: 50
            },
            paper_bgcolor: '#f5f5f5',
            title: "Page views per product sold",
            font: {size: 11},
        };
        Plotly.newPlot('pageViewsPie' + id, data, layout);
    }

    function createTimeSpentPie(timeSpent, id) {

        let data = [{
            values: [timeSpent[0], timeSpent[1], timeSpent[2], timeSpent[3], timeSpent[4], timeSpent[5], timeSpent[6], timeSpent[7], timeSpent[8]],
            labels: ['0-9', '10-29', '30-49', '50-99', '100-199', '200-499', '500-999', '1000-4999', '5000 and<br> more'],
            type: 'pie',
            texttemplate: "%{label}: %{value} (%{percent})",
            textposition: "inside",
            insidetextorientation: "radial"
        }];
        let layout = {
            autosize: false,
            width: 300,
            height: 300,
            margin: {
                l: 50,
                r: 50,
                b: 50,
                t: 50
            },
            paper_bgcolor: '#f5f5f5',
            title: "Time spent per order <br><sup>(minutes/order)</sup>",
            font: {size: 11},
        };
        Plotly.newPlot('timeSpentPie' + id, data, layout);
    }

    function multiplePies(id) {
        let recen = recency[id];
        let freq = frequency[id];
        let monet = monetary[id];
        let pageV = pageViews[id];
        let timeSp = timeSpent[id];

        createRecencyPie(recen, id);
        createFrequencyPie(freq, id);
        createMonetaryPie(monet, id);
        createPageViewsPie(pageV, id);
        createTimeSpentPie(timeSp, id);
    }

    function download_training_data(id) {

        let hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(training_data[id]);
        hiddenElement.target = '_blank';
        hiddenElement.download = 'training_data_' + (id + 1) + '.csv';
        hiddenElement.click();
    }

    function download_testing_data(id) {

        let hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(testing_data[id]);
        hiddenElement.target = '_blank';
        hiddenElement.download = 'testing_data_' + (id + 1) + '.csv';
        hiddenElement.click();
    }

    function shopsComparisonTable(visits, sales, conversionRate, salesValue, grossProfit, netProfit, productValue, operatingExpenses, id) {

        let values = [
            ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
            [visits[0], visits[1], visits[2], visits[3], visits[4], visits[5], visits[6], visits[7], visits[8], visits[9]],
            [sales[0], sales[1], sales[2], sales[3], sales[4], sales[5], sales[6], sales[7], sales[8], sales[9]],
            [conversionRate[0], conversionRate[1], conversionRate[2], conversionRate[3], conversionRate[4], conversionRate[5], conversionRate[6], conversionRate[7], conversionRate[8], conversionRate[9]],
            [salesValue[0], salesValue[1], salesValue[2], salesValue[3], salesValue[4], salesValue[5], salesValue[6], salesValue[7], salesValue[8], salesValue[9]],
            [grossProfit[0], grossProfit[1], grossProfit[2], grossProfit[3], grossProfit[4], grossProfit[5], grossProfit[6], grossProfit[7], grossProfit[8], grossProfit[9]],
            [netProfit[0], netProfit[1], netProfit[2], netProfit[3], netProfit[4], netProfit[5], netProfit[6], netProfit[7], netProfit[8], netProfit[9]],
        ]

        let data = [{
            type: 'table',
            header: {
                values: [["<b>Shop<b>"], ["<b>Visits</b>"], ["<b>Sales</b>"], ["<b>Conversion rate</b>"], ["<b>Sales value</b>"], ["<b>Gross Profit</b>"], ["<b>Net Profit</b>"]],
                align: "center",
                line: {width: 0.5, color: '#064C58'},
                fill: {color: "#064C58"},
                font: {family: "Arial", size: 12, color: "white"}
            },
            cells: {
                values: values,
                align: "center",
                line: {color: "#064C58", width: 0.5},
                font: {family: "Arial", size: 11, color: ["black"]}
            }
        }]
        let layout = {
            autowidth: true,
            height: 275,
            margin: {
                l: 20,
                r: 20,
                b: 0,
                t: 40
            },
            paper_bgcolor: '#f5f5f5',
            title: "Shops comparison",
            font: {size: 11},
        };
        Plotly.newPlot('shopsComparison' + id, data, layout);
    }

    function lineChartShops(grossProfit, netProfit, id) {
        // line chart
        let trace1 = {
            x: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
            y: [netProfit[0], netProfit[1], netProfit[2], netProfit[3], netProfit[4], netProfit[5], netProfit[6], netProfit[7], netProfit[8], netProfit[9]],
            type: 'scatter',
            name: 'Net profit'
        };
        let trace2 = {
            x: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
            y: [grossProfit[0], grossProfit[1], grossProfit[2], grossProfit[3], grossProfit[4], grossProfit[5], grossProfit[6], grossProfit[7], grossProfit[8], grossProfit[9]],
            type: 'scatter',
            name: 'Gross profit'
        };
        let dataLine = [trace1, trace2];
        let chartLayout = {
            title: 'Shops profit comparison'
        }
        Plotly.newPlot('lineShopsComparison' + id, dataLine, chartLayout);
    }

    function shopsResults(id) {
        let shops = shops_comparison[id].split("\n");

        let visits = [];
        let sales = [];
        let conversionRate = [];
        let salesValue = [];
        let grossProfit = [];
        let netProfit = [];
        let productValue = [];
        let operatingExpenses = [];

        for (let i = 0; i < shops.length; i++) {
            let shopsDetails = shops[i].split(",");

            visits.push(shopsDetails[0]);
            sales.push(shopsDetails[1]);
            conversionRate.push(shopsDetails[2]);
            salesValue.push(shopsDetails[3]);
            grossProfit.push(shopsDetails[4]);
            netProfit.push(shopsDetails[5]);
            productValue.push(shopsDetails[6]);
            operatingExpenses.push(shopsDetails[7]);
            shopsComparisonTable(visits, sales, conversionRate, salesValue, grossProfit, netProfit, productValue, operatingExpenses, id);
            lineChartShops(grossProfit, netProfit, id);
        }
        console.log(visits);
    }

    $(document).ready(function () {

        $.ajax({
            type: "POST",
            url: "getHistory",
            contentType: "application/json",
            data: {},
            success: function (result) {

                const obj = JSON.parse(result);

                for (let i = 0; i < obj.output.length; i++) {

                    data_products.push(obj.output[i].data_products);
                    data_orders.push(obj.output[i].data_orders);
                    data_views.push(obj.output[i].data_views);
                    training_data.push(obj.output[i].training_data);
                    testing_data.push(obj.output[i].testing_data);
                    customer_data.push(obj.output[i].customer_data);
                    shops_comparison.push(obj.output[i].shops_comparison);
                    recency.push(obj.output[i].recency);
                    frequency.push(obj.output[i].frequency);
                    monetary.push(obj.output[i].monetary);
                    pageViews.push(obj.output[i].pageViews);
                    timeSpent.push(obj.output[i].timeSpent);

                    let resultId = "result" + i;
                    let resultButton = "resultBtn" + i;
                    let resultInput = "resultInput" + i;
                    let recencyPie = "recencyPie" + i;
                    let frequencyPie = "frequencyPie" + i;
                    let monetaryPie = "monetaryPie" + i;
                    let pageViewsPie = "pageViewsPie" + i;
                    let timeSpentPie = "timeSpentPie" + i;
                    let shopsComparison = "shopsComparison" + i;
                    let lineShopsComparison = "lineShopsComparison" + i;


                    let inputObj = JSON.parse(obj.output[i].input_fields);

                    for (j in inputObj.dataShops) {
                        console.log(inputObj.dataShops[j].avgProfitDiff);
                    }
                    console.log(metrics);
                    console.log(obj.output[i].metrics);
                    const metricsArray = obj.output[i].metrics.split(",");
                    const metricsNN1 = metricsArray[0].split(" ");
                    const metricsNN2 = metricsArray[1].trim().split(" ");

                    if (i !== 0) {

                        $("<div id=\"" + resultId + "\" class=\"mt-3\">" +
                            "<button id=\"" + resultButton + "\" class=\"dropbtn btn btn-outline-dark w-75\" onClick=\"showInput(" + i + ")\">" +
                            "Experiment: " + (i + 1) + "<pre/> " +
                            "Date: " + obj.output[i].timestamp.slice(0, -2) + "      " +
                            "Duration: " + obj.output[i].run_time + "s" + "      " +
                            "</button>" +
                            "<div id=\"" + resultInput + "\"  class='dropdownContent'>" +
                            "<table class='resultsTable'>" +
                            "<thead>" +
                            "<tr>" +
                            "<th class='resultTitle text-wrap'>Customer<br> information</th>" +
                            "<th class='resultTitle'>Uploaded files</th>" +
                            "<th class='resultTitle'>NN1</th>" +
                            "<th class='resultTitle'>Training<br> params</th>" +
                            "<th class='resultTitle'>NN2</th>" +
                            "<th class='resultTitle'>Training<br> params</th>" +
                            "<th class='resultTitle'>Results <br> NN1 evaluation</th>" +
                            "<th class='resultTitle'>Results <br> NN2 evaluation</th>" +
                            "<th class='resultTitle' style='width: 20.5%'>Graphs</th>" +
                            "</tr>" +
                            "</thead>" +
                            "<tbody>" +
                            "<tr>" +
                            "<td class='inputData'>" + "Number: " + inputObj.numberOfCustomers + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_data_products(" + i + ")\" class='resultBtn'>Data Products</button>" + "</td>" +
                            "<td class='inputData'>" + "Input nodes: " + inputObj.inputNodesNN1 + "</td>" +
                            "<td class='inputData'>" + "Seeds: " + inputObj.seedsNN1 + "</td>" +
                            "<td class='inputData'>" + "Input nodes: " + inputObj.inputNodesNN2 + "</td>" +
                            "<td class='inputData'>" + "Seeds: " + inputObj.seedsNN2 + "</td>" +
                            "<td class='inputData'>" + "MSE: " + metricsNN1[1] + "</td>" +
                            "<td class='inputData'>" + "MSE: " + metricsNN2[1] + "</td>" +
                            "<td class='inputData' rowspan='2'>" + "<a onclick=\"shopsResults(" + i + ")\"><img class='resultIcon' src='./sources/shops.png'/></a>" + "</td>" +

                            "</tr>" +
                            "<tr>" +
                            "<td class='inputData'>" + "Mean: " + inputObj.meanOfCustomers + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_data_orders(" + i + ")\" class='resultBtn'>Data Orders</button>" + "</td>" +
                            "<td class='inputData'>" + "Hidden nodes: " + inputObj.hiddenNodesNN1 + "</td>" +
                            "<td class='inputData'>" + "nEpochs: " + inputObj.nEpochsNN1 + "</td>" +
                            "<td class='inputData'>" + "Hidden nodes: " + inputObj.hiddenNodesNN2 + "</td>" +
                            "<td class='inputData'>" + "nEpochs: " + inputObj.nEpochsNN2 + "</td>" +
                            "<td class='inputData'>" + "MAE: " + metricsNN1[2] + "</td>" +
                            "<td class='inputData'>" + "MAE: " + metricsNN2[2] + "</td>" +

                            "</tr>" +
                            "<tr>" +
                            "<td class='inputData'>" + "Std: " + inputObj.standardDeviationOfCustomers + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_data_views(" + i + ")\" class='resultBtn'>Data Views</button>" + "</td>" +
                            "<td class='inputData'>" + "Output nodes: " + inputObj.outputNodesNN1 + "</td>" +
                            "<td class='inputData'>" + "nSamples: " + inputObj.nSamplesNN1 + "</td>" +
                            "<td class='inputData'>" + "Output nodes: " + inputObj.outputNodesNN2 + "</td>" +
                            "<td class='inputData'>" + "nSamples: " + inputObj.nSamplesNN2 + "</td>" +
                            "<td class='inputData'>" + "RMSE: " + metricsNN1[3] + "</td>" +
                            "<td class='inputData'>" + "RMSE: " + metricsNN2[3] + "</td>" +
                            "<td class='inputData' rowspan='3'>" + "<a onclick=\"multiplePies(" + i + ")\" data-toggle='modal' data-target='#GSCCModal'><img class='resultIcon' src='./sources/graph.png'/></a>" + "</td>" +

                            "</tr>" +
                            "<tr>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_training_data(" + i + ")\" class='resultBtn'>Training dataset</button>" + "</td>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "Batch size: " + inputObj.batchSizeNN1 + "</td>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "Batch size: " + inputObj.batchSizeNN2 + "</td>" +
                            "<td class='inputData'>" + "RSE: " + metricsNN1[4] + "</td>" +
                            "<td class='inputData'>" + "RSE: " + metricsNN2[4] + "</td>" +
                            "</tr>" +
                            "<tr>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_testing_data(" + i + ")\" class='resultBtn'>Testing dataset</button>" + "</td>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "Learning rate: " + inputObj.learningRateNN1 + "</td>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "Learning rate: " + inputObj.learningRateNN2 + "</td>" +
                            "<td class='inputData'>" + "R<sup>2</sup>: " + metricsNN1[5] + "</td>" +
                            "<td class='inputData'>" + "R<sup>2</sup>: " + metricsNN2[5] + "</td>" +
                            "</tr>" +

                            "</tbody>" +
                            "</table>" +

                            "<div  id=\"" + shopsComparison + "\" class='piesDisplay'/>" +
                            "<div  id=\"" + lineShopsComparison + "\" class='piesDisplay'/>" +
                            "</div>" +
                            // "<span onclick=\"this.parentNode.style.visibility = 'collapse';\">" + "y" + "</span>" +
                            "</div>" +
                            "<table  class='piesContainer'/>" +
                            "<tr>" +
                            "<td>" +
                            "<div  id=\"" + recencyPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "<td>" +
                            "<div  id=\"" + frequencyPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "<td>" +
                            "<div  id=\"" + monetaryPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "</tr>" +
                            "<tr>" +

                            "<td colspan='2'>" +
                            "<div  id=\"" + pageViewsPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "<td colspan='2'>" +
                            "<div  id=\"" + timeSpentPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "</tr>" +

                            "</table>" +
                            "<div  class='piesContainer'/>" +


                            "</div>" +
                            "</div>" +
                            "<br>").insertAfter($('#result' + (i - 1)));

                        $('#' + resultInput).hide();

                    } else {

                        $('#placeholder').replaceWith(
                            "<div id=\"" + resultId + "\" class=\"mt-3\">" +
                            "<button id=\"" + resultButton + "\" class=\"dropbtn btn btn-outline-dark w-75\" onClick=\"showInput(" + i + ")\">" +
                            "Experiment: " + (i + 1) + "<pre/> " +
                            "Date: " + obj.output[i].timestamp.slice(0, -2) + "      " +
                            "Duration: " + obj.output[i].run_time + "s" + "      " +
                            "</button>" +
                            "<div id=\"" + resultInput + "\"  class='dropdownContent'>" +
                            "<table class='resultsTable'>" +
                            "<thead>" +
                            "<tr>" +
                            "<th class='resultTitle text-wrap'>Customer<br> information</th>" +
                            "<th class='resultTitle'>Uploaded files</th>" +
                            "<th class='resultTitle'>NN1</th>" +
                            "<th class='resultTitle'>Training<br> params</th>" +
                            "<th class='resultTitle'>NN2</th>" +
                            "<th class='resultTitle'>Training<br> params</th>" +
                            "<th class='resultTitle'>Results <br> NN1 evaluation</th>" +
                            "<th class='resultTitle'>Results <br> NN2 evaluation</th>" +
                            "<th class='resultTitle' style='width: 20.5%'>Graphs</th>" +
                            "</tr>" +
                            "</thead>" +
                            "<tbody>" +
                            "<tr>" +
                            "<td class='inputData'>" + "Number: " + inputObj.numberOfCustomers + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_data_products(" + i + ")\" class='resultBtn'>Data Products</button>" + "</td>" +
                            "<td class='inputData'>" + "Input nodes: " + inputObj.inputNodesNN1 + "</td>" +
                            "<td class='inputData'>" + "Seeds: " + inputObj.seedsNN1 + "</td>" +
                            "<td class='inputData'>" + "Input nodes: " + inputObj.inputNodesNN2 + "</td>" +
                            "<td class='inputData'>" + "Seeds: " + inputObj.seedsNN2 + "</td>" +
                            "<td class='inputData'>" + "MSE: " + metricsNN1[1] + "</td>" +
                            "<td class='inputData'>" + "MSE: " + metricsNN2[1] + "</td>" +
                            "<td class='inputData' rowspan='2'>" + "<a onclick=\"shopsResults(" + i + ")\"><img class='resultIcon' src='./sources/shops.png'/></a>" + "</td>" +

                            "</tr>" +
                            "<tr>" +
                            "<td class='inputData'>" + "Mean: " + inputObj.meanOfCustomers + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_data_orders(" + i + ")\" class='resultBtn'>Data Orders</button>" + "</td>" +
                            "<td class='inputData'>" + "Hidden nodes: " + inputObj.hiddenNodesNN1 + "</td>" +
                            "<td class='inputData'>" + "nEpochs: " + inputObj.nEpochsNN1 + "</td>" +
                            "<td class='inputData'>" + "Hidden nodes: " + inputObj.hiddenNodesNN2 + "</td>" +
                            "<td class='inputData'>" + "nEpochs: " + inputObj.nEpochsNN2 + "</td>" +
                            "<td class='inputData'>" + "MAE: " + metricsNN1[2] + "</td>" +
                            "<td class='inputData'>" + "MAE: " + metricsNN2[2] + "</td>" +

                            "</tr>" +
                            "<tr>" +
                            "<td class='inputData'>" + "Std: " + inputObj.standardDeviationOfCustomers + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_data_views(" + i + ")\" class='resultBtn'>Data Views</button>" + "</td>" +
                            "<td class='inputData'>" + "Output nodes: " + inputObj.outputNodesNN1 + "</td>" +
                            "<td class='inputData'>" + "nSamples: " + inputObj.nSamplesNN1 + "</td>" +
                            "<td class='inputData'>" + "Output nodes: " + inputObj.outputNodesNN2 + "</td>" +
                            "<td class='inputData'>" + "nSamples: " + inputObj.nSamplesNN2 + "</td>" +
                            "<td class='inputData'>" + "RMSE: " + metricsNN1[3] + "</td>" +
                            "<td class='inputData'>" + "RMSE: " + metricsNN2[3] + "</td>" +
                            "<td class='inputData' rowspan='3'>" + "<a onclick=\"multiplePies(" + i + ")\" data-toggle='modal' data-target='#GSCCModal'><img class='resultIcon' src='./sources/graph.png'/></a>" + "</td>" +

                            "</tr>" +
                            "<tr>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_training_data(" + i + ")\" class='resultBtn'>Training dataset</button>" + "</td>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "Batch size: " + inputObj.batchSizeNN1 + "</td>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "Batch size: " + inputObj.batchSizeNN2 + "</td>" +
                            "<td class='inputData'>" + "RSE: " + metricsNN1[4] + "</td>" +
                            "<td class='inputData'>" + "RSE: " + metricsNN2[4] + "</td>" +
                            "</tr>" +
                            "<tr>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "<button onclick=\"download_testing_data(" + i + ")\" class='resultBtn'>Testing dataset</button>" + "</td>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "Learning rate: " + inputObj.learningRateNN1 + "</td>" +
                            "<td class='inputData'>" + "&nbsp;" + "</td>" +
                            "<td class='inputData'>" + "Learning rate: " + inputObj.learningRateNN2 + "</td>" +
                            "<td class='inputData'>" + "R<sup>2</sup>: " + metricsNN1[5] + "</td>" +
                            "<td class='inputData'>" + "R<sup>2</sup>: " + +metricsNN2[5] + "</td>" +
                            "</tr>" +

                            "</tbody>" +
                            "</table>" +

                            "<div  id=\"" + shopsComparison + "\" class='piesDisplay'/>" +
                            "<div  id=\"" + lineShopsComparison + "\" class='piesDisplay'/>" +
                            "</div>" +
                            "</div>" +
                            "<table  class='piesContainer'/>" +
                            "<tr>" +
                            "<td>" +
                            "<div  id=\"" + recencyPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "<td>" +
                            "<div  id=\"" + frequencyPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "<td>" +
                            "<div  id=\"" + monetaryPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "</tr>" +
                            "<tr>" +

                            "<td colspan='2'>" +
                            "<div  id=\"" + pageViewsPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "<td colspan='2'>" +
                            "<div  id=\"" + timeSpentPie + "\" class='piesDisplay'/>" +
                            "</td>" +
                            "</tr>" +

                            "</table>" +
                            "<div  class='piesContainer'/>" +
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
<footer>
    <div class="copyrights" id="footer">
        © 2023 Copyright Eleni Charitou
        <!-- <a class="text-white" href="https://mdbootstrap.com/">MDBootstrap.com</a> -->
        <br>Student at Aristotle University of Thessaloniki 2023
    </div>
</footer>
</html>
