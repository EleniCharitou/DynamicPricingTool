<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--  <title>Title</title>--%>
<%--  &lt;%&ndash; Bootstrap &ndash;%&gt;--%>
<%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">--%>
<%--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>--%>
<%--  &lt;%&ndash; jQuery &ndash;%&gt;--%>
<%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>
<%--  &lt;%&ndash;ploty.js&ndash;%&gt;--%>
<%--  <script src="https://cdn.plot.ly/plotly-2.14.0.min.js"></script>--%>
<%--  &lt;%&ndash; highcharts.js &ndash;%&gt;--%>
<%--  <script src="https://code.highcharts.com/highcharts.js"></script>--%>
<%--  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js"></script>--%>


<%--</head>--%>
<%--<body>--%>
<%--<nav class="navbar bg-light fixed-top">--%>
<%--  <div class="container-fluid">--%>
<%--    <a class="navbar-brand" href="#">Dynamic Pricing</a>--%>
<%--    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">--%>
<%--      <span class="navbar-toggler-icon"></span>--%>
<%--    </button>--%>
<%--    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">--%>
<%--      <div class="offcanvas-header">--%>
<%--        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>--%>
<%--      </div>--%>
<%--      <div class="offcanvas-body">--%>
<%--        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">--%>
<%--          <li class="nav-item">--%>
<%--            <a class="nav-link active" aria-current="page" href="#">Home</a>--%>
<%--          </li>--%>
<%--          <li class="nav-item">--%>
<%--            <a class="nav-link" href="/marketplace">Create--%>
<%--              Marketplace</a> &lt;%&ndash; sth like "Get start!"&ndash;%&gt;--%>

<%--          </li>--%>
<%--          <li class="nav-item dropdown">--%>
<%--            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"--%>
<%--               aria-expanded="false">--%>
<%--              Dropdown--%>
<%--            </a>--%>
<%--            <ul class="dropdown-menu">--%>
<%--              <li><a class="dropdown-item" href="#">Action</a></li>--%>
<%--              <li><a class="dropdown-item" href="#">Another action</a></li>--%>
<%--              <li>--%>
<%--                <hr class="dropdown-divider">--%>
<%--              </li>--%>
<%--              <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
<%--            </ul>--%>
<%--          </li>--%>
<%--        </ul>--%>
<%--        <form class="d-flex" role="search">--%>
<%--          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--          <button class="btn btn-outline-success" type="submit">Search</button>--%>
<%--        </form>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</nav>--%>

<%--<br style="line-height:100pt"/>--%>

<%--<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">--%>
<%--  <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000">--%>
<%--    <div class="toast-header">--%>
<%--      &lt;%&ndash;<img src="..." class="rounded me-2" alt="...">&ndash;%&gt;--%>
<%--      <strong class="me-auto">Notification</strong>--%>
<%--      <small>Just now</small>--%>
<%--      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>--%>
<%--    </div>--%>
<%--    <div id="toast_body" class="toast-body">--%>

<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>


<%--<div style="width: 25%; margin:0 auto;">--%>
<%--  <div class="form-group">--%>
<%--    <label for="first_value">First Value:</label>--%>
<%--    <input type="text" class="form-control" id="first_value">--%>
<%--  </div>--%>
<%--  <div class="form-group">--%>
<%--    <label for="second_value">Second Value:</label>--%>
<%--    <input type="text" class="form-control" id="second_value">--%>
<%--  </div>--%>
<%--  <button id="searchButton" type="button" class="btn btn-primary" style="margin-top: 10pt">Submit</button>--%>
<%--</div>--%>

<%--<div style="width: 25%; margin: 10pt auto;">--%>
<%--  File to upload:--%>
<%--  <br/>--%>
<%--  <input id="fileID" type="file" name="file" accept=".csv"/>--%>
<%--  <br/>--%>
<%--  <button id="submitFile" type="button" class="btn btn-primary" style="margin-top: 10pt">SubmitFile</button>--%>
<%--</div>--%>


<%--<div id="container" style="width: 50%;margin: 0 auto"></div>--%>


<%--&lt;%&ndash;<div id="tester" style="width:600px;height:250px;"></div>&ndash;%&gt;--%>


<%--<script>--%>
<%--  $(document).ready(function() {--%>

<%--    $('#submitFile').on('click', function () {--%>
<%--      var file = document.getElementById('fileID').files[0]; //Files[0] = 1st file--%>
<%--      var reader = new FileReader();--%>
<%--      reader.readAsText(file, 'UTF-8');--%>

<%--      reader.onload = () => {--%>
<%--        console.log(reader.result);--%>
<%--        console.log(typeof reader.result);--%>

<%--        $.ajax({--%>
<%--          type: "POST",--%>
<%--          url: "postFile",--%>
<%--          data: {fileTest: reader.result},--%>
<%--          success: function (result) {--%>
<%--            console.log(result);--%>

<%--            let mean = result.mean;--%>
<%--            let stdDev = result.standardDeviation;--%>
<%--            let points = result.inputValues;--%>

<%--            const normalY = (x, mean, stdDev) => Math.exp((-0.5) * Math.pow((x - mean) / stdDev, 2));--%>

<%--            let seriesData = points.map(x => ({x, y: normalY(x, mean, stdDev)}));--%>

<%--            Highcharts.chart('container', {--%>
<%--              title: {--%>
<%--                text: 'Test Chart'--%>
<%--              },--%>
<%--              subtitle: {--%>
<%--                text: ''--%>
<%--              },--%>
<%--              chart: {--%>
<%--                type: 'area'--%>
<%--              },--%>
<%--              series: [{--%>
<%--                name: 'testSeries',--%>
<%--                data: seriesData,--%>
<%--                turboThreshold: 100000--%>
<%--              }],--%>
<%--              credits: {--%>
<%--                enabled: false--%>
<%--              },--%>
<%--            });--%>
<%--          },--%>
<%--          error: function (xhr) {--%>
<%--            console.log("Error getting response in AJAX");--%>
<%--          }--%>
<%--        });--%>
<%--      }--%>
<%--    });--%>

<%--// plot Normal Distribution--------------------------------------------------------------------------------------------%>
<%--    //TESTER = document.getElementById('tester');--%>
<%--    /*Plotly.newPlot( document.getElementById('tester'), [{--%>
<%--        x: [1, 2, 3, 4, 5],--%>
<%--        y: [1, 2, 4, 8, 16] }], {--%>
<%--        margin: { t: 0 } } );*/--%>


<%--//notification--------------------------------------------------------------------------------------------%>
<%--    document.addEventListener("DOMContentLoaded", function () {--%>
<%--      $('#liveToast').toast();--%>
<%--    });--%>
<%--//--------------------------------------------------------------------------------------------%>
<%--    $('#searchButton').on('click', function () {--%>
<%--      firstValue = $('#first_value').val();--%>
<%--      secondValue = $('#second_value').val();--%>

<%--      $.ajax({--%>
<%--        type: "POST",--%>
<%--        url: "getData",--%>
<%--        contentType: "application/json",--%>
<%--        data: JSON.stringify({--%>
<%--          first_value: firstValue,--%>
<%--          second_value: secondValue--%>
<%--        }),--%>
<%--        success: function (result) {--%>
<%--          console.log(result);--%>
<%--          /*alert(result.outputString);*/--%>

<%--          $('#toast_body').text(result.outputString);--%>

<%--          $('#liveToast').toast("show");--%>
<%--        },--%>
<%--        error: function (xhr) {--%>
<%--          console.log("Error getting response in AJAX");--%>
<%--        }--%>
<%--      });--%>
<%--    });--%>


<%--  });--%>
<%--</script>--%>


<%--</body>--%>
<%--</html>--%>
