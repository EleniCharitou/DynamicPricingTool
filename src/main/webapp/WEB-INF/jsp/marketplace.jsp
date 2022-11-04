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
    <div class="input-marketpalce">
        <label for="shops">Total number of shops:</label>
        <input type="text" class="form-control" id="shops">
    </div>
    <div class="input-marketpalce">
        <label for="products">Total number of products:</label>
        <input type="text" class="form-control" id="products">
    </div>
    <div class="input-marketplace">
        <label for="customers">Total number of customers:</label>
        <input type="text" class="form-control" id="customers">
    </div>
    <button id="submitButton" type="button" class="btn btn-primary" style="margin-top: 10pt">Submit</button>
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


</script>


</body>
</html>
