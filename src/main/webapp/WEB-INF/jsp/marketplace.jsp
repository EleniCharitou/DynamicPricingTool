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
    <link rel="stylesheet" type="text/css" href="../../CSS/styles.css">
    <%-- Bootstrap --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <%-- jQuery --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<nav class="navbar bg-light fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="home">Dynamic Pricing</a>
    </div>
</nav>

<br style="line-height:100pt"/>

<div style="width: 30%; margin:0 auto;">
    <div class="input-marketplace">
        <label for="numOfCustomers">Total number of customers:</label>
        <input type="number" class="form-control" id="numOfCustomers">
    </div>

    <%--    https://codepen.io/ruslantau/pen/vRwjNP--%>
    <table class="table data" id="shopTable">
        <thead>
        <tr>
            <th>Νumber Of Products</th>
            <th>Delivery cost</th>
            <th>Delivery time</th>
            <th>Delivery method</th>
            <th>Payment method</th>
            <th>Seller reviews</th>
            <th>Seller reputation</th>
            <th>Average profit difference</th>
            <th>
                <button class="add">Add new</button>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="data">12883</td>
            <td class="data">5</td>
            <td class="data">2.5</td>
            <td class="data">true</td>
            <td class="data">false</td>
            <td class="data">5</td>
            <td class="data">4</td>
            <td class="data">0</td>
            <td>
                <button class="save">Save</button>
                <button class="edit">Edit</button>
                <button class="delete">Delete</button>
            </td>
        </tr>
        </tbody>
    </table>

</div>

<div style="width: 25%; margin: 10pt auto;">
    File with products to upload :
    <br/>
    <input id="dataProductsID" type="file" name="file1" accept=".csv" style="margin-top: 10pt"/>
    <br/>
    File with orders to upload :
    <input id="dataOrdersID" type="file" name="file2" accept=".csv" style="margin-top: 10pt"/>
    <br/>
    File with dataViews to upload :
    <input id="dataViewsID" type="file" name="file3" accept=".csv" style="margin-top: 10pt"/>
    <br/>
    <button id="submitFile" type="button" class="btn btn-primary" style="margin-top: 10pt">Submit File</button>
    <button id="test" type="button" class="btn btn-primary" style="margin-top: 10pt">test</button>
    <br/>
</div>

<script>

    $(document).on('click', '.edit', function () {
        $(this).parent().siblings('td.data').each(function () {
            var content = $(this).html();
            console.log(content);
            $(this).html('<input style="width: 100%" value="' + content + '" />');

        });
        console.log("something was editted");
        $(this).siblings('.save').show();
        $(this).siblings('.delete').hide();
        $(this).hide();
    });

    $(document).on('click', '.save', function () {

        let counter = 0;

        $('input').each(function () {
            counter++;
            console.log(counter);
            var content = $(this).val();
            console.log(content);
            $(this).html(content);
            $(this).contents().unwrap();
        });
        $(this).siblings('.edit').show();
        console.log("something was saved");
        $(this).siblings('.delete').show();
        $(this).hide();

    });


    $(document).on('click', '.delete', function () {
        $(this).parents('tr').remove();
    });

    $('.add').click(function () {
        $(this).parents('table').append(
            '<tr>' +
            '<td class="data"></td>' +
            '<td class="data"></td>' +
            '<td class="data"></td>' +
            '<td class="data"></td>' +
            '<td class="data"></td>' +
            '<td class="data"></td>' +
            '<td class="data"></td>' +
            '<td class="data"></td>' +
            '<td>' +
            '   <button class="save">Save</button>' +
            '   <button class="edit">Edit</button> ' +
            '   <button class="delete">Delete</button>' +
            '</td>' +
            '</tr>');
    });

    $(document).ready(function () {

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


        $('#test').on('click', function () {

            console.log(testArray);

            let tableColumnNames = [];

            //gets table
            var oTable = document.getElementById('shopTable');

            //gets rows of table
            var rowLength = oTable.rows.length;

            var oCells = oTable.rows.item(0).cells;

            //gets amount of cells of current row
            var cellLength = oCells.length;

            //loops through each cell in current row
            for (var j = 0; j < cellLength - 1; j++) {

                // get your cell info here

                var cellVal = oCells.item(j).innerHTML;
                tableColumnNames.push(cellVal);

                /*console.log("Value of j is: " + j + " | value of cell is: " + cellVal);*/
            }


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

                console.log(tempRow);

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

                console.log(JSON.stringify({
                    dataProducts: testArray[0],
                    dataOrders: testArray[1],
                    dataViews: testArray[2],
                    dataShops: tableContents
                }));


            }

            $.ajax({

                type: "POST",
                url: "getUserInput",
                contentType: "application/json",
                data: JSON.stringify({
                    numberOfCustomers: $('#numOfCustomers').val(),
                    dataProducts: testArray[0],
                    dataOrders: testArray[1],
                    dataViews: testArray[2],
                    dataShops: tableContents
                }),
                success: function (result) {
                    console.log(result);

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
    })

</script>


</body>
</html>
