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
    <button id="submitButton" type="button" class="btn btn-primary" style="margin-top: 10pt">Submit</button>

    <%--    https://codepen.io/ruslantau/pen/vRwjNP--%>
    <table class="table data" id="shopTable">
        <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Number</th>
            <th>Actions
                <button class="add">Add new</button>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="data">John Doe</td>
            <td class="data">johndoe@john.com</td>
            <td class="data">666-666-666</td>
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
    <input id="dataOrdersID" type="file" name="file2" accept=".csv" style="margin-top: 10pt"/>
    <br/>
    <input id="dataViewsID" type="file" name="file3" accept=".csv" style="margin-top: 10pt"/>
    <br/>
    <button id="submitFile" type="button" class="btn btn-primary" style="margin-top: 10pt">Submit File</button>
    <button id="test" type="button" class="btn btn-primary" style="margin-top: 10pt">test</button>
    <br/>


</div>

<script>
    $('#submitButton').on('click', function () {

        let shops = $('#shops').val();
        let products = $('#products').val();
        let customers = $('#customers').val();

        $.ajax({
            type: "POST",
            url: "getParams",
            contentType: "application/json",
            data: JSON.stringify({
                numberOfShops: shops,
                numberOfProducts: products,
                numberOfCustomers: customers
            }),
            success: function (result) {
                console.log(result);

                $('#toast_body').text(result.outputMarket);

                $('#liveToast').toast("show");
            },
            error: function (xhr) {
                console.log("Error getting response in AJAX");
            }
        });
    });


    $(document).on('click', '.edit', function () {
        $(this).parent().siblings('td.data').each(function () {
            var content = $(this).html();
            $(this).html('<input value="' + content + '" />');

        });
        console.log("something was editted");
        $(this).siblings('.save').show();
        $(this).siblings('.delete').hide();
        $(this).hide();
    });

    $(document).on('click', '.save', function () {

        $('input').each(function () {
            var content = $(this).val();
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
            '<td>' +
            '   <button class="save">Save</button>' +
            '   <button class="edit">Edit</button> ' +
            '   <button class="delete">Delete</button>' +
            '</td>' +
            '</tr>');
    });

    $(document).ready(function () {


        $('#test').on('click', function () {
            var ajaxData = new FormData();

            $.each($("input[type=file]"), function (i, obj) {
                console.log("File with index: " + i)
                $.each(obj.files, function (j, file) {
                    ajaxData.append('file[' + j + ']', file);
                })
            });
            console.log(ajaxData)
            let counter = 0;

            var fileArray = [];

            for (let value of ajaxData.values()) {
                let reader = new FileReader();
                console.log(value)
                counter++;
                console.log(counter)

                reader.onload = function () {
                    testJSON.push(reader.result);
                }

                reader.readAsText(value, "UTF-8");
            }

            console.log(fileArray);
            console.log($("#numOfCustomers").val());

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

                console.log("Value of j is: " + j + " | value of cell is: " + cellVal);
            }

            console.log(tableColumnNames);


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

                tableContents.push(tempRow);


            }

            console.log(tableContents);

            console.log(JSON.stringify(tableContents));


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
