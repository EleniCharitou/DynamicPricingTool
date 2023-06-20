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
    const customer_data = [];

    const training_data = [];
    const testing_data = [];

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

    function createPieChart(recency, id) {
        // let hiddenElement = document.createElement('a');
        // hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(customer_data[id]);
        //
        // let customers = customer_data[id].split("\n");
        //
        // let customerData = [];
        // let neuralPrice = [];
        // let recency = [];
        // let frequency = [];
        // let monetary = [];
        // let pageViews = [];
        // let timeSpent = [];
        // let personalPrice = [];
        // for (let i = 0; i < customers.length; i++) {
        //     customerData = customers[i].split(",");
        //
        //     // neuralPrice.push(customerData[0]);
        //     recency.push(customerData[1]);
        //     frequency.push(customerData[2]);
        //     monetary.push(customerData[3]);
        //     pageViews.push(customerData[4]);
        //     timeSpent.push(customerData[5]);
        //     // personalPrice.push(customerData[6]);
        // }
        // // customerData = [];
        // // // customerData.push(neuralPrice);
        // // customerData.push(recency);
        // // customerData.push(frequency);
        // // customerData.push(monetary);
        // // customerData.push(pageViews);
        // // customerData.push(timeSpent);
        // // // customerData.push(personalPrice);

        let range_1 = 0;
        let range_2 = 0;
        let range_3 = 0;
        let range_4 = 0;
        let range_5 = 0;
        let range_6 = 0;
        let range_7 = 0;
        let range_8 = 0;
        for (let i = 0; i < 1000; i++) {
            if (recency[i] <= 9.0) {
                range_1++;
            } else if (recency[i] > 9.0 && recency[i] <= 24.0) {
                range_2++;
            } else if (recency[i] > 24 && recency[i] <= 39) {
                range_3++;
            } else if (recency[i] > 39 && recency[i] <= 59) {
                range_4++;
            } else if (recency[i] > 59 && recency[i] <= 89) {
                range_5++;
            } else if (recency[i] > 89 && recency[i] <= 139) {
                range_6++;
            } else if (recency[i] > 139 && recency[i] <= 730) {
                range_7++;
            } else {
                range_8++;
            }

            //pie price data
            let data = [{
                values: [range_1, range_2, range_3, range_4, range_5, range_6, range_7, range_8],
                labels: ['0-9', '10-24', '25-39', '40-59', '60-89', '90-139', '140-730', '731 and more'],
                type: 'pie'
            }];
// https://plotly.com/javascript/setting-graph-size/
            let layout = {
                autosize: false,
                width: 350,
                height: 300,
                margin: {
                    l: 50,
                    r: 50,
                    b: 50,
                    t: 65
                },
                title: "Recency (days)",
                font: {size: 11},
            };
            Plotly.newPlot('recencyPie' + id, data, layout);
        }

    }

    function createFrequencyPie(frequency, id) {
        // let hiddenElement = document.createElement('a');
        // hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(customer_data[id]);
        //
        // let customers = customer_data[id].split("\n");
        // let customerData = [];
        // let frequency = [];
        //
        // for (let i = 0; i < customers.length; i++) {
        //     customerData = customers[i].split(",");
        //     frequency.push(customerData[2]);
        // }
        // customerData = [];
        // customerData.push(frequency);

        let range_1 = 0;
        let range_2 = 0;
        let range_3 = 0;
        let range_4 = 0;
        let range_5 = 0;
        let range_6 = 0;
        let range_7 = 0;
        let range_8 = 0;
        for (let i = 0; i < 1000; i++) {
            if (frequency[i] <= 1) {
                range_1++;
            } else if (frequency[i] > 1 && frequency[i] <= 4.0) {
                range_2++;
            } else if (frequency[i] > 4 && frequency[i] <= 7) {
                range_3++;
            } else if (frequency[i] > 7 && frequency[i] <= 10) {
                range_4++;
            } else if (frequency[i] > 10 && frequency[i] <= 15) {
                range_5++;
            } else if (frequency[i] > 15 && frequency[i] <= 30) {
                range_6++;
            } else if (frequency[i] > 30 && frequency[i] <= 60) {
                range_7++;
            } else {
                range_8++;
            }

            //pie price data
            let data = [{
                values: [range_1, range_2, range_3, range_4, range_5, range_6, range_7, range_8],
                labels: ['0-1', '1-4', '4-7', '7-10', '10-15', '15-30', '30-60', '60 and more'],
                type: 'pie'
            }];
            let layout = {
                autosize: false,
                width: 350,
                height: 300,
                margin: {
                    l: 50,
                    r: 50,
                    b: 50,
                    t: 65
                },
                title: "Frequency (orders/year)",
                font: {size: 11},
            };
            Plotly.newPlot('frequencyPie' + id, data, layout);
        }

    }

    function createMonetaryPie(monetary, id) {
        // let hiddenElement = document.createElement('a');
        // hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(customer_data[id]);
        //
        // let customers = customer_data[id].split("\n");
        // let customerData = [];
        // let monetary = [];
        //
        // for (let i = 0; i < customers.length; i++) {
        //     customerData = customers[i].split(",");
        //     monetary.push(customerData[3]);
        // }
        // customerData = [];
        // customerData.push(monetary);

        let range_1 = 0;
        let range_2 = 0;
        let range_3 = 0;
        let range_4 = 0;
        let range_5 = 0;
        let range_6 = 0;
        let range_7 = 0;
        let range_8 = 0;
        for (let i = 0; i < 1000; i++) {
            if (monetary[i] <= 49.99) {
                range_1++;
            } else if (monetary[i] > 49.99 && monetary[i] <= 99.99) {
                range_2++;
            } else if (monetary[i] > 99.99 && monetary[i] <= 149.99) {
                range_3++;
            } else if (monetary[i] > 149.99 && monetary[i] <= 199.99) {
                range_4++;
            } else if (monetary[i] > 199.99 && monetary[i] <= 299.99) {
                range_5++;
            } else if (monetary[i] > 299.99 && monetary[i] <= 499.99) {
                range_6++;
            } else if (monetary[i] > 499.99 && monetary[i] <= 999.99) {
                range_7++;
            } else {
                range_8++;
            }
            //pie price data
            let data = [{
                values: [range_1, range_2, range_3, range_4, range_5, range_6, range_7, range_8],
                labels: ['0-49.99', '49.99-99.99', '99.99-149.99', '149.99-199.99', '149.99-199.99', '149.99-199.99', '149.99-199.99', '149.99-199.99', '149.99-199.99'],
                type: 'pie'
            }];
// https://plotly.com/javascript/setting-graph-size/
            let layout = {
                autosize: false,
                width: 350,
                height: 300,
                margin: {
                    l: 50,
                    r: 50,
                    b: 50,
                    t: 65
                },
                title: "Monetary (€)",
                font: {size: 11},
            };
            Plotly.newPlot('monetaryPie' + id, data, layout);
        }
    }

    function createPageViewsPie(pageViews, id) {
        // let hiddenElement = document.createElement('a');
        // hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(customer_data[id]);
        //
        // let customers = customer_data[id].split("\n");
        // let customerData = [];
        // let pageViews = [];
        //
        // for (let i = 0; i < customers.length; i++) {
        //     customerData = customers[i].split(",");
        //     pageViews.push(customerData[4]);
        // }
        // customerData = [];
        // customerData.push(pageViews);

        let range_1 = 0;
        let range_2 = 0;
        let range_3 = 0;
        let range_4 = 0;
        let range_5 = 0;
        let range_6 = 0;
        let range_7 = 0;
        let range_8 = 0;
        let range_9 = 0;
        for (let i = 0; i < 1000; i++) {
            if (pageViews[i] <= 199) {
                range_1++;
            } else if (pageViews[i] > 199 && pageViews[i] <= 499) {
                range_2++;
            } else if (pageViews[i] > 499 && pageViews[i] <= 999) {
                range_3++;
            } else if (pageViews[i] > 999 && pageViews[i] <= 1499) {
                range_4++;
            } else if (pageViews[i] > 1499 && pageViews[i] <= 1999) {
                range_5++;
            } else if (pageViews[i] > 1999 && pageViews[i] <= 2999) {
                range_6++;
            } else if (pageViews[i] > 2999 && pageViews[i] <= 4999) {
                range_7++;
            } else if (pageViews[i] > 4999 && pageViews[i] <= 9999) {
                range_8++;
            } else {
                range_9++;
            }
            //pie price data
            let data = [{
                values: [range_1, range_2, range_3, range_4, range_5, range_6, range_7, range_8, range_9],
                labels: ['0-199', '200-499', '500-999', '1000-1499', '1500-1999', '2000-2999', '3000-4999', '5000-9999', '10000 and more'],
                type: 'pie'
            }];
// https://plotly.com/javascript/setting-graph-size/
            let layout = {
                autosize: false,
                width: 350,
                height: 300,
                margin: {
                    l: 50,
                    r: 50,
                    b: 50,
                    t: 65
                },
                title: "Page views per product sold",
                font: {size: 11},
            };
            Plotly.newPlot('pageViewsPie' + id, data, layout);
        }
    }

    function createTimeSpentPie(timeSpent, id) {
        // let hiddenElement = document.createElement('a');
        // hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(customer_data[id]);
        //
        // let customers = customer_data[id].split("\n");
        // let customerData = [];
        // let timeSpent = [];
        //
        // for (let i = 0; i < customers.length; i++) {
        //     customerData = customers[i].split(",");
        //     timeSpent.push(customerData[5]);
        // }
        // customerData = [];
        // customerData.push(timeSpent);

        let range_1 = 0;
        let range_2 = 0;
        let range_3 = 0;
        let range_4 = 0;
        let range_5 = 0;
        let range_6 = 0;
        let range_7 = 0;
        let range_8 = 0;
        let range_9 = 0;
        for (let i = 0; i < 1000; i++) {
            if (timeSpent[i] <= 9) {
                range_1++;
            } else if (timeSpent[i] > 10 && timeSpent[i] <= 29) {
                range_2++;
            } else if (timeSpent[i] > 30 && timeSpent[i] <= 49) {
                range_3++;
            } else if (timeSpent[i] > 50 && timeSpent[i] <= 99) {
                range_4++;
            } else if (timeSpent[i] > 100 && timeSpent[i] <= 199) {
                range_5++;
            } else if (timeSpent[i] > 200 && timeSpent[i] <= 499) {
                range_6++;
            } else if (timeSpent[i] > 500 && timeSpent[i] <= 999) {
                range_7++;
            } else if (timeSpent[i] > 1000 && timeSpent[i] <= 4999) {
                range_8++;
            } else {
                range_9++;
            }
            //pie price data
            let data = [{
                values: [range_1, range_2, range_3, range_4, range_5, range_6, range_7, range_8, range_9],
                labels: ['0-9', '10-29', '30-49', '50-99', '100-199', '200-499', '500-999', '1000-4999', '5000 and more'],
                type: 'pie'
            }];
// https://plotly.com/javascript/setting-graph-size/
            let layout = {
                autosize: false,
                width: 350,
                height: 300,
                margin: {
                    l: 50,
                    r: 50,
                    b: 50,
                    t: 65
                },
                title: "Time spent per order (minutes/order)",
                font: {size: 11},
            };
            Plotly.newPlot('timeSpentPie' + id, data, layout);
        }
    }

    function multiplePies(id) {
        let hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(customer_data[id]);

        let customers = customer_data[id].split("\n");

        let neuralPrice = [];
        let recency = [];
        let frequency = [];
        let monetary = [];
        let pageViews = [];
        let timeSpent = [];
        let personalPrice = [];
        for (let i = 0; i < customers.length; i++) {
            customerData = customers[i].split(",");

            // neuralPrice.push(customerData[0]);
            recency.push(customerData[1]);
            frequency.push(customerData[2]);
            monetary.push(customerData[3]);
            pageViews.push(customerData[4]);
            timeSpent.push(customerData[5]);
            // personalPrice.push(customerData[6]);
        }

        createPieChart(recency, id);
        createFrequencyPie(frequency, id);
        createMonetaryPie(monetary, id);
        createPageViewsPie(pageViews, id);
        createTimeSpentPie(timeSpent, id);
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

                    let resultId = "result" + i;
                    let resultButton = "resultBtn" + i;
                    let resultInput = "resultInput" + i;
                    let recencyPie = "recencyPie" + i;
                    let frequencyPie = "frequencyPie" + i;
                    let monetaryPie = "monetaryPie" + i;
                    let pageViewsPie = "pageViewsPie" + i;
                    let timeSpentPie = "timeSpentPie" + i;


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
                            "<button onclick=\"download_training_data(" + i + ")\" class='tableResult'>Training dataset</button>" +
                            "<button onclick=\"download_testing_data(" + i + ")\" class='tableResult'>Testing dataset</button>" +
                            "SeedsNN1: " + inputObj.seedsNN1 +
                            "Customers' characteristics: " +
                            "<button onclick=\"multiplePies(" + i + ")\" class='tableResult'>Customers</button>" +
                            "<div  id=\"" + recencyPie + "\" class='piesDisplay'/>" +
                            "<div  id=\"" + frequencyPie + "\" class='piesDisplay'/>" +
                            "<div  id=\"" + monetaryPie + "\" class='piesDisplay'/>" +
                            "<div  id=\"" + pageViewsPie + "\" class='piesDisplay'/>" +
                            "<div  id=\"" + timeSpentPie + "\" class='piesDisplay'/>" +
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
                            "<button onclick=\"download_training_data(" + i + ")\" class='tableResult'>Training dataset</button>" +
                            "<button onclick=\"download_testing_data(" + i + ")\" class='tableResult'>Testing dataset</button>" +
                            "<button onclick=\"createPieChart(" + i + ")\" class='tableResult'>Recen</button>" +
                            "<button onclick=\"createFrequencyPie(" + i + ")\" class='tableResult'>Freq</button>" +
                            "<button onclick=\"createMonetaryPie(" + i + ")\" class='tableResult'>Mon</button>" +
                            "<div id=\"" + recencyPie + "\"/>" +
                            "<div id=\"" + frequencyPie + "\"/>" +
                            "<div id=\"" + monetaryPie + "\"/>" +
                            "Number of customer: " + inputObj.numberOfCustomers +
                            "Mean: " + inputObj.meanOfCustomers +
                            "Standard deviation: " + inputObj.standardDeviationOfCustomers +
                            "Percentage of training data: " + inputObj.dataTrainingPercentage +
                            "SeedsNN1: " + inputObj.seedsNN1 +
                            "nEpochsNN1: " + inputObj.nEpochsNN1 +
                            "nSamplesNN1: " + inputObj.nSamplesNN1 +
                            "Batch sizeNN1: " + inputObj.batchSizeNN1 +
                            "Learning rateNN1: " + inputObj.learningRateNN1 +
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
