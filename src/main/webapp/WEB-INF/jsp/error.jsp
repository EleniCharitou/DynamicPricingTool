<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Home</title>
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
  <script src="https://cdn.plot.ly/plotly-2.14.0.min.js"></script>
  <%-- highcharts.js --%>
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js"></script>
  <%--CSS--%>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/error.css">


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
<main>
  <div style="width: 100%; margin: auto;text-align: center;">
    <img src="./sources/Oops.svg" style="width: 30%; margin-top: 12%"/>
    <p> The page you were looking for does not exist! Click
      <a class="navbar-link" id="backHome" href="${pageContext.request.contextPath}/home" style="color: #2199e8">
        here </a>
      to return to the Home Page.
    </p>
  </div>
</main>

</body>
</html>
