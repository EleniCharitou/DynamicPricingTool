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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
    <div id="spinner" class="pt-5" style="display: none">
        <div class="spinner-border text-primary" role="status">
        </div>
    </div>

    <%--Customer's input --%>
        <div class="input-marketplace" style="margin: 3%; width: 90%">
            <table class="table firstInput" id="firstInputs">
                <tbody>
                <tr>
                    <td style="text-align:center;">
                        <label for="numOfCustomers">Number of customers:</label>
                    </td>
                    <td style="text-align:center;">
                        <input type="number" class="form-control" id="numOfCustomers" style="width: 40%" value="1000">
                    </td>
                    <td style="text-align:center;">
                        <label for="mOfCustomers">mean:</label>
                    </td>
                    <td style="text-align:center;">
                        <input type="number" class="form-control" id="mOfCustomers" style="width: 40%" value="0.95">
                    </td>
                    <td style="text-align:center;">
                        <label for="stdOfCustomers">standard deviation:</label>
                    </td>
                    <td style="text-align:center;">
                        <input type="number" class="form-control" id="stdOfCustomers" style="width: 40%" value="0.3">
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
                    <div class="col-sm-10"><h2>Shop <b>Details</b></h2></div>
                    <div class="col-sm-1">
                        <button type="button" class="btn btn-info add-new-shop"><i class="fa fa-plus"></i> Add New
                        </button>
                    </div>
                </div>
            </div>
            <table id="tableOfShops" class="table table-bordered">
                <thead>
                <tr>
                    <th>Shops</th>
                    <th>Delivery cost</th>
                    <th>Delivery time</th>
                    <th>Delivery method</th>
                    <th>Payment method</th>
                    <th>Seller reviews</th>
                    <th>Seller reputation</th>
                    <th>Average profit difference</th>
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
                   style="text-align: center; border-radius: 40px; width: 20%; font-size: 16px;"/>
            <p class="card-text" style="width: 45%; font-size: 16px; margin-left: 50px;">| Product ID | Base cost |
                Brand power | Price | </p>
        </div>
        <div class="card2">
            <h5 class="card-title" style="font-weight: bold; width: 20%; font-size: 20px; ">Orders</h5>
            <input type="file" id="dataOrdersID" class="form-control" name="file2" accept=".csv"
                   style="text-align: center; border-radius: 40px; width: 20%; font-size: 16px;"/>
            <p class="card-text" style="width: 45%; font-size: 16px; margin-left: 50px;">| Order ID | date of purchase |
                customer ID | Total of order |</p>
        </div>
        <div class="card3">
            <h5 class="card-title" style="font-weight: bold; width: 20%; font-size: 20px; ">Data Views</h5>
            <input type="file" id="dataViewsID" class="form-control" name="file3" accept=".csv"
                   style="text-align: center; border-radius: 40px; width: 20%; font-size: 16px;"/>
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
                <input type="number" id="nn1Seed" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2Seed"> Seed :</td>
            <td>
                <input type="number" id="nn2Seed" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
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
                <input type="number" id="nn1NSamples" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2NSamples">nSamples:</td>
            <td>
                <input type="number" id="nn2NSamples" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
            </td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1BatchSize">Batch size :</td>
            <td>
                <input type="number" id="nn1BatchSize" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2BatchSize">Batch size :</td>
            <td>
                <input type="number" id="nn2BatchSize" name="nnInputs" class="nnInputs" value="1" style="width: 30%;">
            </td>
        </tr>
        <tr>
            <td style="text-align:center" for="nn1LearningRate">Learning Rate :</td>
            <td>
                <input type="number" id="nn1LearningRate" name="nnInputs" class="nnInputs" value="1"
                       style="width: 30%;">
            </td>
            <td style="text-align:center" for="nn2LearningRate">Learning Rate :</td>
            <td>
                <input type="number" id="nn2LearningRate" name="nnInputs" class="nnInputs" value="1"
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
            var index = $("#tableOfShops tbody tr:last-child").index();
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

            console.log(testArray);

            let tableColumnNames = [];

            //gets table
            var oTable = document.getElementById('tableOfShops');
            console.log(oTable);

            var oCells = oTable.rows.item(0).cells;

            //gets amount of cells of current row
            var cellLength = oCells.length;

            //loops through each cell in current row
            for (var j = 0; j < cellLength - 1; j++) {

                // get your cell info here
                var cellVal = oCells.item(j).innerHTML;
                tableColumnNames.push(cellVal);

                console.log("Value of j is: " + j + " | value of cell is: " + cellVal);
            }

            //gets rows of table
            var rowLength = oTable.rows.length;


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

                    console.log("Value of j is: " + j + " | value of cell is: " + cellVal);
                }

                console.log("ΓΡΑΜΜΗ ΠΙΝΑΚΑ: " + tempRow);

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

                console.log(tempObj);


                tableContents.push(tempObj);

                console.log("ΠΙΝΑΚΑΣ ΜΕΧΡΙ ΤΩΡΑ: " + tableContents);

                console.log(JSON.stringify({
                    dataProducts: testArray[0],
                    dataOrders: testArray[1],
                    dataViews: testArray[2],
                    dataShops: tableContents

                }));
                console.log("ΠΙΝΑΚΑΣ wtp: " + testArray);


                console.log(JSON.stringify({
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
                }));


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

                },
                error: function (xhr) {
                    console.log("Error getting response in AJAX");
                }
            });


        });


        $('#submitFile').on('click', function () {
            var file = document.getElementById('dataProductsID').files[0];
            var reader = new FileReader();
            reader.readAsText(file, 'UTF-8');

            reader.onload = () => {
                console.log(reader.result);
                console.log(typeof reader.result);

                $.ajax({
                    type: "POST",
                    url: "postFile",
                    data: {fileTest: reader.result},
                    success: function (result) {
                        console.log(result);
                    },
                    error: function (xhr) {
                        console.log("Error getting response in AJAX");
                    }
                });
            }
        });
    });

    $(document).ajaxStart(function () {
        $('#spinner').show();
    });
    $(document).ajaxComplete(function () {
        $('#spinner').hide();
    });
    $(document).ajaxError(function () {
        $('#spinner').hide();
    });
</script>


</body>
</html>
