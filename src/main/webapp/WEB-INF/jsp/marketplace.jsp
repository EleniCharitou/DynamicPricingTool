<%--
  Created by IntelliJ IDEA.
  User: eleni
  Date: 11/4/2022
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Marketplace</title>
    <%--Links for table, site: https://webdesignerwall.com/wdw-snippet/table-with-add-and-delete-and-edit-actions?fbclid=IwAR3xA6UKsPeE3ah_4bOcMcqPiGsQrHdvyTmHapgeoIKoks-7izrqifL3w5k--%>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <%-- Bootstrap --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <%--CSS--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vscStyle.css">


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <%-- jQuery --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%--plotly.js   PIE--%>
    <script src='https://cdn.plot.ly/plotly-2.18.2.min.js'></script>

</head>
<body>
<nav class="navbar fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" id="logo" href="home">LOGO</a>
        <a class="navbar-brand" id="home" href="home">Home</a>
        <a class="navbar-brand" id="dynamicPricing" href="${pageContext.request.contextPath}/marketplace">Dynamic
            Pricing</a>
        <a class="navbar-brand" id="university" href="#">Aristotle University of Thessaloniki</a>  <!--  or anything -->
    </div>
</nav>


<div class="modelBody">
    <%--Spinner-loading--%>
    <div class="loader" id="loader" style="display: none">

    </div>
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
        </div>

    </div>
        <%--Customer's input --%>
        <div class="input-marketplace" style="margin: 1%; width: 90%">
            <table class="table firstInput" id="firstInputs">
                <tbody>
                <tr>
                    <td style="text-align:center;">
                        <div class="input-group">
                            <input type="number" class="input" id="numOfCustomers" required="" autocomplete="off">
                            <label for="numOfCustomers" class="user-label">Number of customers:</label>
                        </div>
                    </td>
                    <td style="text-align:center;">
                        <div class="input-group">
                            <input type="number" class="input" id="mOfCustomers" required="" autocomplete="off">
                            <label for="mOfCustomers" class="user-label">mean:</label>
                        </div>
                    </td>
                    <td style="text-align:center;">
                        <div class="input-group">
                            <input type="number" class="input" id="stdOfCustomers" required="" autocomplete="off">
                            <label for="stdOfCustomers" class="user-label">standard deviation:</label>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <%--Shops --%>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-10"><h2>Shop Details</h2></div>
                        <div class="col-sm-1">
                            <button type="button" class="btn btn-info add-new-shop"><i class="fa fa-plus"></i> Add New
                            </button>
                        </div>
                    </div>
                </div>
                <table id="tableOfShops" class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Shop</th>
                        <th>Delivery cost [€]</th>
                        <th>Delivery time</th>
<%--                        //duration-waiting--%>
                        <th>Classic or Advantage</th>
                        <%--                        //Delivery method--%>
                        <th>COD</th>
                        <%--                        //Payment method--%>
                        <th>Reviews' average</th>
                        <%--                        //Average reviews for a specific store/seller--%>
                        <th>Seller reputation</th>
                        <th>!!!Average profit difference</th>
                        <%--                        //pricing strategy--%>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="data">1</td>
                        <td class="data">5</td>
                        <td class="data">2.5</td>
                        <td class="data">true</td>
                        <td class="data">false</td>
                        <td class="data">5</td>
                    <td class="data">4</td>
                    <td class="data">0</td>
                    <td class="tableButton">
                        <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                        <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                        <a class="delete #c62828 red darken-3" title="Delete" data-toggle="tooltip"><i
                                class="material-icons">&#xE872;</i></a>
                    </td>
                </tr>
                <tr>
                    <td class="data">2</td>
                    <td class="data">5.5</td>
                    <td class="data">3</td>
                    <td class="data">true</td>
                    <td class="data">false</td>
                    <td class="data">4</td>
                    <td class="data">4</td>
                    <td class="data">0.03</td>
                    <td>
                        <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                        <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                        <a class="delete" title="Delete" data-toggle="tooltip"><i
                                class="material-icons">&#xE872;</i></a>
                    </td>
                </tr>
                <tr>
                    <td class="data">3</td>
                    <td class="data">6</td>
                    <td class="data">2</td>
                    <td class="data">true</td>
                    <td class="data">true</td>
                    <td class="data">4</td>
                    <td class="data">5</td>
                    <td class="data">0.03</td>
                    <td>
                        <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                        <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                        <a class="delete" title="Delete" data-toggle="tooltip"><i
                                class="material-icons">&#xE872;</i></a>
                    </td>
                </tr>
                <tr>
                    <td class="data">4</td>
                    <td class="data">4.5</td>
                    <td class="data">3.5</td>
                    <td class="data">true</td>
                    <td class="data">false</td>
                    <td class="data">2</td>
                    <td class="data">3</td>
                    <td class="data">0.005</td>
                    <td>
                        <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                        <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                        <a class="delete" title="Delete" data-toggle="tooltip"><i
                                class="material-icons">&#xE872;</i></a>
                    </td>
                </tr>
                <tr>
                    <td class="data">5</td>
                    <td class="data">5</td>
                    <td class="data">4</td>
                    <td class="data">true</td>
                    <td class="data">false</td>
                    <td class="data">5</td>
                    <td class="data">4</td>
                    <td class="data">0.05</td>
                    <td>
                        <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                        <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                        <a class="delete" title="Delete" data-toggle="tooltip"><i
                                class="material-icons">&#xE872;</i></a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>


        <%--Upload files--%>
    <h2>Upload files</h2>
    <div class="card1">
        <h5 class="card-title" style="font-weight: bold; width: 20%; font-size: 20px; ">Products</h5>
        <input type="file" id="dataProductsID" class="form-control" name="file1" accept=".csv"
               style="text-align: center; border-radius: 40px; width: 40%; font-size: 17px;"/>
        <p class="card-text" style="width: 45%; font-size: 16px; margin-left: 50px;">| Product ID | Base cost |
            Brand power | Price | </p>
    </div>
    <div class="card2">
        <h5 class="card-title" style="font-weight: bold; width: 20%; font-size: 20px; ">Orders</h5>
        <input type="file" id="dataOrdersID" class="form-control" name="file2" accept=".csv"
               style="text-align: center; border-radius: 40px; width: 40%; font-size: 17px;"/>
        <p class="card-text" style="width: 45%; font-size: 16px; margin-left: 50px;">| Order ID | date of purchase |
            customer ID | Total of order |</p>
    </div>
    <div class="card3">
        <h5 class="card-title" style="font-weight: bold; width: 20%; font-size: 20px; ">Data Views</h5>
        <input type="file" id="dataViewsID" class="form-control" name="file3" accept=".csv"
               style="text-align: center; border-radius: 40px; width: 40%; font-size: 17px;"/>
        <p class="card-text" style="width: 45%; font-size: 16px; margin-left: 50px;">| Customer ID | Timestamp</p>
    </div>

    <%--NN inputs--%>
    <table class="table" id="nnTable">

        <tbody>
        <tr>
            <td style="font-weight: bold; text-align:center;"> NN1</td>
            <td style="text-align:center;"></td>
            <td style="font-weight: bold; text-align:center;"> NN2</td>
            <td style="text-align:center;"></td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1InputNodes">Input nodes:</td>
            <td>
                <input type="number" class="nnInputs" id="nn1InputNodes" name="nnInputs" value="9" style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2InputNodes">Input nodes:</td>
            <td>
                <input type="number" class="nnInputs" id="nn2InputNodes" name="nnInputs" value="6" style="width: 30%;">
            </td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1HiddenNodes">Hidden nodes:</td>
            <td>
                <input type="number" id="nn1HiddenNodes" name="nnInputs" class="nnInputs" value="6" style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2HiddenNodes">Hidden nodes:</td>
            <td>
                <input type="number" id="nn2HiddenNodes" name="nnInputs" class="nnInputs" value="6" style="width: 30%;">
            </td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1OutputNodes">Output nodes:</td>
            <td>
                <input type="number" id="nn1OutputNodes" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2OutputNodes">Output nodes:</td>
            <td>
                <input type="number" id="nn2OutputNodes" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
            </td>
        </tr>

        <tr>
            <td style="font-weight: bold">
                Training & evaluation params
            </td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1Seed">Seed :</td>
            <td>
                <input type="number" id="nn1Seed" name="nnInputs" class="nnInputs" value="1234" style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2Seed"> Seed :</td>
            <td>
                <input type="number" id="nn2Seed" name="nnInputs" class="nnInputs" value="1234" style="width: 30%;">
            </td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1NEpochs">nEpochs :</td>
            <td>
                <input type="number" id="nn1NEpochs" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2NEpochs">nEpochs :</td>
            <td>
                <input type="number" id="nn2NEpochs" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
            </td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1NSamples">nSamples:</td>
            <td>
                <input type="number" id="nn1NSamples" name="nnInputs" class="nnInputs" value="1000" style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2NSamples">nSamples:</td>
            <td>
                <input type="number" id="nn2NSamples" name="nnInputs" class="nnInputs" value="1000" style="width: 30%;">
            </td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1BatchSize">Batch size :</td>
            <td>
                <input type="number" id="nn1BatchSize" name="nnInputs" class="nnInputs" value="1000"
                       style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2BatchSize">Batch size :</td>
            <td>
                <input type="number" id="nn2BatchSize" name="nnInputs" class="nnInputs" value="1000"
                       style="width: 30%;">
            </td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1LearningRate">Learning Rate :</td>
            <td>
                <input type="number" id="nn1LearningRate" name="nnInputs" class="nnInputs" value="0.000000011"
                       style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2LearningRate">Learning Rate :</td>
            <td>
                <input type="number" id="nn2LearningRate" name="nnInputs" class="nnInputs" value="0.00000001"
                       style="width: 30%;">
            </td>
        </tr>

        </tbody>
    </table>
        <div class="HomeButtons">
            <button id="test" type="button" class="button3" style="margin-top: 10pt" ,>Submit</button>
        </div>

</div>

<script>
    //Shops actions
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
        let actions = $("#tableOfShops td:last-child").html();
        let lineCounter = 5;
// Append table with add row form on add new button click
        $(".add-new-shop").click(function () {
            $(this).attr("disabled", "disabled");
            let index = $("#tableOfShops tbody tr:last-child").index();
            let row = '<tr>' +
                '<td><input type="text" class="form-control" name="shops" id="shops"></td>' +
                '<td><input type="text" class="form-control" name="deliveryCost" id="deliveryCost"></td>' +
                '<td><input type="text" class="form-control" name="deliveryTime" id="deliveryTime"></td>' +
                '<td><input type="text" class="form-control" name="deliveryMethod" id="deliveryMethod"></td>' +
                '<td><input type="text" class="form-control" name="paymentMethod" id="phone"></td>' +
                '<td><input type="text" class="form-control" name="sellerReviews" id="sellerReviews"></td>' +
                '<td><input type="text" class="form-control" name="sellerReputation" id="sellerReputation"></td>' +
                '<td><input type="text" class="form-control" name="AverageProfitDiff" id="AverageProfitDiff"></td>' +
                '<td>' + actions + '</td>' +
                '</tr>';
            $("#tableOfShops").append(row);
            $("#tableOfShops tbody tr").eq(index + 1).find(".add, .edit").toggle();
            $('[data-toggle="tooltip"]').tooltip();
        });
// Add row on add button click
        $(document).on("click", ".add", function () {
            let empty = false;
            let input = $(this).parents("tr").find('input[type="text"]');
            input.each(function () {
                if (!$(this).val()) {
                    $(this).addClass("error");
                    empty = true;
                } else {
                    $(this).removeClass("error");
                }
            });
            $(this).parents("tr").find(".error").first().focus();
            if (!empty) {
                input.each(function () {
                    $(this).parent("td").html($(this).val());
                });
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new-shop").removeAttr("disabled");
            }
        });
// Edit row on edit button click
        $(document).on("click", ".edit", function () {
            $(this).parents("tr").find("td:not(:last-child)").each(function () {
                $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
            });
            $(this).parents("tr").find(".add, .edit").toggle();
            $(".add-new-shop").attr("disabled", "disabled");
        });
// Delete row on delete button click
        $(document).on("click", ".delete", function () {
            $(this).parents("tr").remove();
            $(".add-new-shop").removeAttr("disabled");
        });
    });

    //read files
    $(document).ready(function () {

//other inputs

        let dataProducts;
        let testArray = [];

        $("#dataProductsID").on("change", function () {
            let fileReader = new FileReader();

            fileReader.onload = function () {
                console.log("dataProducts " + fileReader.result);
                testArray[0] = fileReader.result;
            }

            fileReader.readAsText(this.files[0]);
        });

        $("#dataOrdersID").on("change", function () {
            let fileReader = new FileReader();

            fileReader.onload = function () {
                console.log("dataOrders " + fileReader.result);
                testArray[1] = fileReader.result;
            }

            fileReader.readAsText(this.files[0]);
        });

        $("#dataViewsID").on("change", function () {
            let fileReader = new FileReader();

            fileReader.onload = function () {
                console.log("dataViews " + fileReader.result);
                testArray[2] = fileReader.result;
            }

            fileReader.readAsText(this.files[0]);
        });

//Submit all inputs
        $('#test').on('click', function () {

            $('#modalData').html("<b>Hello</b>");

            $('#loader').show();
            $("#cover").fadeIn(100);

            console.log(testArray);
// -----------------------------------------------------------------------Visualization of input  data-----------------------------------------------------------------------

//Read data from data_products.csv, so I can print middle results/stats
            let lines = testArray[0].split("\r\n");

            let dataProducts = [];
            let prodID = [];
            let baseCost = [];
            let brandPower = [];
            let price = [];
            for (let i = 0; i < lines.length; i++) {
                dataProducts = lines[i].split(",");

                prodID.push(dataProducts[0]);
                baseCost.push(dataProducts[1]);
                brandPower.push(dataProducts[2]);
                price.push(parseFloat(dataProducts[3]));            //price values ready for use
            }
            dataProducts = [];
            dataProducts.push(prodID);
            dataProducts.push(baseCost);
            dataProducts.push(brandPower);
            dataProducts.push(price);


// range of Price-pies
            let range_1 = 0;     //0-10
            let range_2 = 0;     //10-50
            let range_3 = 0;     //50++
            let averageBaseCost = 0;
            let averagePrice = 0;
            let sumBaseCost = 0;
            let sumOfPrices = 0;
            let margin = [];
            let xArray = [];
            for (let i = 0; i < baseCost.length; i++) {
                xArray.push(i + 1);       // array for x axis-margin |here xArray=12883
                sumBaseCost += parseFloat(baseCost[i]);
                sumOfPrices += price[i];
//Price ranges for pie
                if (price[i] < 10) {
                    range_1 += 1;
                } else if (price[i] >= 10 && price[i] < 50) {
                    range_2++;
                } else {
                    range_3++;
                }
//margin=price/baseCost
                margin.push(price[i] / parseFloat(baseCost[i]));
            }
//pie price data
            let data = [{
                values: [range_1, range_2, range_3],
                labels: ['0-10€', '10-50€', '50€ or more '],
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
                font: {size: 11},
                title: ''
            };
            Plotly.newPlot('piePrice', data, layout);

// linear chart
            let trace1 = {
                x: xArray,
                y: price,
                type: 'scatter',
                name: 'Price'
            };
            let trace2 = {
                x: xArray,
                y: baseCost,
                type: 'scatter',
                name: 'Base cost'
            };
            let trace3 = {
                x: xArray,
                y: margin,
                type: 'scatter',
                name: 'Margin'
            };
            let dataLinear = [trace1, trace2, trace3];
            let layoutLinear = {
                width: 500,
                height: 300,
                margin: {
                    l: 50,
                    r: 50,
                    b: 50,
                    t: 65
                },
                font: {size: 11}
            }
            Plotly.newPlot('marginPriceBaseCost', dataLinear, layoutLinear, {scrollZoom: true});

            averageBaseCost = sumBaseCost / baseCost.length;
            averagePrice = sumOfPrices / price.length;

// print alert NumberOfProducts in modal
            //alert("Number of Products " + lines.length);
            $('#modalData').html("Number of Products: " + lines.length);
            $('#averageBaseCost').html("Average base cost: " + averageBaseCost.toFixed(2));
            $('#averagePrice').html("Average price per product: " + averagePrice.toFixed(2));
// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Read data from data_orders.csv
            let orders = testArray[1].split("\r\n");

            let dataOrders = [];
            let orderID = [];
            let datePurchased = [];
            let customerId = [];
            let orderTotal = [];
            for (let i = 0; i < orders.length; i++) {
                dataOrders = orders[i].split(",");

                orderID.push(dataOrders[0]);
                datePurchased.push(dataOrders[1]);
                customerId.push(dataOrders[2]);
                orderTotal.push(parseFloat(dataOrders[3]));
            }
            dataOrders = [];
            dataOrders.push(orderID);
            dataOrders.push(datePurchased);
            dataOrders.push(customerId);
            dataOrders.push(orderTotal);

// ranges for pie, based on the total of orders(euros)
            let rangeOrder_1 = 0;
            let rangeOrder_2 = 0;
            let rangeOrder_3 = 0;
            let rangeOrder_4 = 0;
            let rangeOrder_5 = 0;
            let rangeOrder_6 = 0;
            let rangeOrder_7 = 0;
            let rangeOrder_8 = 0;
            let rangeOrder_9 = 0;
            let rangeOrder_10 = 0;

            let averageTotal = 0;
            let sumTotal = 0;
            let datePur = [];
            let timePur = [];
            let timeRange_1 = 0;
            let timeRange_2 = 0;
            let timeRange_3 = 0;
            let timeRange_4 = 0;
            let timeRange_5 = 0;
            let timeRange_6 = 0;
            let timeRange_7 = 0;
            let timeRange_8 = 0;
            let timeRange_9 = 0;
            let timeRange_10 = 0;
            let timeRange_11 = 0;
            let timeRange_12 = 0;

            for (let i = 0; i < orderID.length; i++) {
                sumTotal += orderTotal[i];
//Order total ranges for pie
                if (orderTotal[i] < 10) {
                    rangeOrder_1 += 1;
                } else if (orderTotal[i] >= 10 && orderTotal[i] < 20) {
                    rangeOrder_2++;
                } else if (orderTotal[i] >= 20 && orderTotal[i] < 30) {
                    rangeOrder_3++;
                } else if (orderTotal[i] >= 30 && orderTotal[i] < 40) {
                    rangeOrder_4++;
                } else if (orderTotal[i] >= 40 && orderTotal[i] < 50) {
                    rangeOrder_5++;
                } else if (orderTotal[i] >= 50 && orderTotal[i] < 60) {
                    rangeOrder_6++;
                } else if (orderTotal[i] >= 60 && orderTotal[i] < 70) {
                    rangeOrder_7++;
                } else if (orderTotal[i] >= 70 && orderTotal[i] < 80) {
                    rangeOrder_8++;
                } else if (orderTotal[i] >= 80 && orderTotal[i] < 90) {
                    rangeOrder_9++;
                } else {
                    rangeOrder_10++;
                }

                datePur[i] = datePurchased[i].split(" ");
                timePur[i] = datePur[i][1].split(":");
                if (timePur[i][0] < 2) {
                    timeRange_1++;
                } else if (timePur[i][0] >= 2 && timePur[i][0] < 4) {
                    timeRange_2++;
                } else if (timePur[i][0] >= 4 && timePur[i][0] < 6) {
                    timeRange_3++;
                } else if (timePur[i][0] >= 6 && timePur[i][0] < 8) {
                    timeRange_4++;
                } else if (timePur[i][0] >= 8 && timePur[i][0] < 10) {
                    timeRange_5++;
                } else if (timePur[i][0] >= 10 && timePur[i][0] < 12) {
                    timeRange_6++;
                } else if (timePur[i][0] >= 12 && timePur[i][0] < 14) {
                    timeRange_7++;
                } else if (timePur[i][0] >= 14 && timePur[i][0] < 16) {
                    timeRange_8++;
                } else if (timePur[i][0] >= 16 && timePur[i][0] < 18) {
                    timeRange_9++;
                } else if (timePur[i][0] >= 18 && timePur[i][0] < 20) {
                    timeRange_10++;
                } else if (timePur[i][0] >= 20 && timePur[i][0] < 22) {
                    timeRange_11++;
                } else if (timePur[i][0] >= 22 && timePur[i][0] < 24) {
                    timeRange_12++;
                }
            }

            averageTotal = sumTotal / orderTotal.length;
//pie order total data
            let dataTotal = [{
                values: [rangeOrder_1, rangeOrder_2, rangeOrder_3, rangeOrder_4, rangeOrder_5, rangeOrder_6],
                labels: ['0-10€', '10-20€', '20-30€', '30-40€', '40-50€', '50-60€', '60-70€', '70-80€', '80-90€', '90€ or more '],
                type: 'pie'
            }];
// https://plotly.com/javascript/setting-graph-size/
            let layoutOrder = {
                autosize: false,
                width: 350,
                height: 350,
                margin: {
                    l: 50,
                    r: 50,
                    b: 50,
                    t: 65
                },
                title: "Ranges of order total",
                font: {size: 11}
            };
            Plotly.newPlot('pieTotal', dataTotal, layoutOrder);
//time of orders
            let traceTime = {
                type: 'bar',
                x: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                y: [timeRange_1, timeRange_2, timeRange_3, timeRange_4, timeRange_5, timeRange_6, timeRange_7, timeRange_8, timeRange_9, timeRange_10, timeRange_11, timeRange_12],
                marker: {
                    color: 'lightsalmon',
                    line: {
                        width: 0.5
                    }
                }
            };
            let dataTime = [traceTime];
            let layoutTime = {
                width: 600,
                title: 'Time of purchase',
                font: {size: 11}
            };
            let config = {responsive: true}

            Plotly.newPlot('scatterTime', dataTime, layoutTime, config);

// print in modal
            $('#orders').html("Number of Orders: " + orders.length);
            $('#averageTotal').html("Average total of order: " + averageTotal.toFixed(2));       //mean of orders euros
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Read data from data_views.csv
            let views = testArray[2].split("\r\n");

            let dataViews = [];
            let custID = [];
            let date = [];
            let time = [];
            let hours = [];
            let h_1 = 0;
            let h_2 = 0;
            let h_3 = 0;
            let h_4 = 0;
            let h_5 = 0;
            let h_6 = 0;
            let h_7 = 0;
            let h_8 = 0;
            let h_9 = 0;
            let h_10 = 0;
            let h_11 = 0;
            let h_12 = 0;

            for (let i = 0; i < views.length; i++) {
                dataViews = views[i].split(",");

                custID.push(dataViews[0]);
                date.push(dataViews[1]);
                time[i] = new Date(date[i]);
                hours[i] = time[i].getHours();

                if (hours[i] < 2) {
                    h_1++;
                } else if (hours[i] >= 2 && hours[i] < 4) {
                    h_2++;
                } else if (hours[i] >= 4 && hours[i] < 6) {
                    h_3++;
                } else if (hours[i] >= 6 && hours[i] < 8) {
                    h_4++;
                } else if (hours[i] >= 8 && hours[i] < 10) {
                    h_5++;
                } else if (hours[i] >= 10 && hours[i] < 12) {
                    h_6++;
                } else if (hours[i] >= 12 && hours[i] < 14) {
                    h_7++;
                } else if (hours[i] >= 14 && hours[i] < 16) {
                    h_8++;
                } else if (hours[i] >= 16 && hours[i] < 18) {
                    h_9++;
                } else if (hours[i] >= 18 && hours[i] < 20) {
                    h_10++;
                } else if (hours[i] >= 20 && hours[i] < 22) {
                    h_11++;
                } else if (hours[i] >= 22 && hours[i] < 24) {
                    h_12++;
                }
            }

//bubble plot
            let traceViews = {
                type: 'bar',
                x: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                y: [h_1, h_2, h_3, h_4, h_5, h_6, h_7, h_8, h_9, h_10, h_11, h_12],
                marker: {
                    color: 'lightsalmon',
                    line: {
                        width: 0.5
                    }
                }
            };
            let dataView = [traceViews];
            let layoutViews = {
                width: 600,
                title: 'Views',
                font: {size: 11}
            };
            let configV = {responsive: true}

            Plotly.newPlot('views', dataView, layoutViews, configV);
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
            let tableColumnNames = [];

            //gets table
            let oTable = document.getElementById('tableOfShops');
            /*
                        console.log(oTable);
            */

            let oCells = oTable.rows.item(0).cells;

            //gets amount of cells of current row
            let cellLength = oCells.length;

            //loops through each cell in current row
            for (let j = 0; j < cellLength - 1; j++) {

                // get your cell info here
                let cellVal = oCells.item(j).innerHTML;
                tableColumnNames.push(cellVal);
            }

            //gets rows of table
            let rowLength = oTable.rows.length;


            let tableContents = [];

            //loops through rows
            for (let i = 1; i < rowLength; i++) {

                let tempRow = [];

                //gets cells of current row
                oCells = oTable.rows.item(i).cells;

                //gets amount of cells of current row
                cellLength = oCells.length;

                //loops through each cell in current row
                for (let j = 0; j < cellLength - 1; j++) {

                    // get your cell info here

                    cellVal = oCells.item(j).innerHTML;
                    tempRow.push(cellVal);

                    /*
                                        console.log("Value of j is: " + j + " | value of cell is: " + cellVal);
                    */
                }

                /*console.log("ΓΡΑΜΜΗ ΠΙΝΑΚΑ: " + tempRow);*/

                let tempObj = {
                    numberOfShops: tempRow[0],
                    deliveryCost: tempRow[1],
                    deliveryTime: tempRow[2],
                    deliveryMethod: tempRow[3],
                    paymentMethod: tempRow[4],
                    sellerReviews: tempRow[5],
                    sellerReputation: tempRow[6],
                    avgProfitDiff: tempRow[7]
                }

                /*console.log(tempObj);*/


                tableContents.push(tempObj);

                /*console.log("ΠΙΝΑΚΑΣ ΜΕΧΡΙ ΤΩΡΑ: " + tableContents);

                console.log(JSON.stringify({
                    dataProducts: testArray[0],
                    dataOrders: testArray[1],
                    dataViews: testArray[2],
                    dataShops: tableContents

                }));
                console.log("ΠΙΝΑΚΑΣ wtp: " + testArray);*/


                /*console.log(JSON.stringify({
                    NN1InputNodes: $('#nn1InputNodes').val(),
                    NN1HiddenNodes: $('#nn1HiddenNodes').val(),
                    NN1OutputNodes: $('#nn1OutputNodes').val()
                }));
                console.log(JSON.stringify({
                    NN2InputNodes: $('#nn2InputNodes').val(),
                    NN2HiddenNodes: $('#nn2HiddenNodes').val(),
                    NN2OutputNodes: $('#nn2OutputNodes').val()
                }));
                console.log(JSON.stringify({
                    seed1: $('#nn1Seed').val(),
                    nEpochs1: $('#nn1NEpochs').val(),
                    nSamples1: $('#nn1NSamples').val(),
                    batchSize1: $('#nn1BatchSize').val(),
                    learningRate1: $('#nn1LearningRate').val(),
                    seed2: $('#nn2Seed').val(),
                    nEpochs2: $('#nn2NEpochs').val(),
                    nSamples2: $('#nn2NSamples').val(),
                    batchSize2: $('#nn2BatchSize').val(),
                    learningRate2: $('#nn2LearningRate').val()
                }));*/


            }


            $.ajax({

                type: "POST",
                url: "getUserInput",
                contentType: "application/json",
                data: JSON.stringify({
                    numberOfCustomers: $('#numOfCustomers').val(),
                    meanOfCustomers: $('#mOfCustomers').val(),
                    standardDeviationOfCustomers: $('#stdOfCustomers').val(),
                    dataProducts: testArray[0],
                    dataOrders: testArray[1],
                    dataViews: testArray[2],
                    inputNodesNN1: $('#nn1InputNodes').val(),
                    hiddenNodesNN1: $('#nn1HiddenNodes').val(),
                    outputNodesNN1: $('#nn1OutputNodes').val(),
                    inputNodesNN2: $('#nn2InputNodes').val(),
                    hiddenNodesNN2: $('#nn2HiddenNodes').val(),
                    outputNodesNN2: $('#nn2OutputNodes').val(),
                    dataShops: tableContents,
                    seedsNN1: $('#nn1Seed').val(),
                    nEpochsNN1: $('#nn1NEpochs').val(),
                    nSamplesNN1: $('#nn1NSamples').val(),
                    batchSizeNN1: $('#nn1BatchSize').val(),
                    learningRateNN1: $('#nn1LearningRate').val(),
                    seedsNN2: $('#nn2Seed').val(),
                    nEpochsNN2: $('#nn2NEpochs').val(),
                    nSamplesNN2: $('#nn2NSamples').val(),
                    batchSizeNN2: $('#nn2BatchSize').val(),
                    learningRateNN2: $('#nn2LearningRate').val()
                }),
                success: function (result) {
                    console.log(result[0] + ' ' + result[1]);
                    // let final = 'Column MSE MAE RMSE RSE R^2 col_0 1.00908e-08 1.00908e-08 1.00453e-04 1.00000e+00 4.69345e-04 ,Column MSE MAE RMSE RSE R^2 col_0 1.00256e-08 1.00256e-08 1.00128e-04 1.00000e+00 4.64134e-04';
                    // let finalTable = final.split(",");
                    // console.log(final);
                    // console.log(finalTable);
                    //
                    // $('#final').html("Final results: " + finalTable);
                    let nn1Results = result[0];
                    let nn2Results = result[1];

                    let newWindow = window.open();
                    newWindow.document.write(result[0] + "\n" + result[1]);

                },
                error: function (xhr) {
                    console.log("Error getting response in AJAX");
                }
            });


        });



    $(document).ajaxStart(function () {
        $('#myModal').show();
    });
        $(document).ajaxComplete(function () {
            $('#loader').hide();
            $("#cover").fadeOut(100);
            $('#myModal').hide();
        });
        $(document).ajaxError(function () {
            $('#loader').hide();
            $("#cover").fadeOut(100);
            $('#myModal').hide();
        });
    })
</script>


</body>
</html>
