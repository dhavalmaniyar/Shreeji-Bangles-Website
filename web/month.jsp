<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="./js/bootstrap.js"></script>
        <link rel="stylesheet" href="./fontawesome-free-5.13.0-web/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Monthly</title>
    </head>

    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            if (session.getAttribute("uname") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-danger">
            <a class="navbar-brand" href="#"><img src="./images/logo.png" height="50px" style="margin: 0px; padding: 0px;"
                                                  alt=""><label for="name"
                                                  style="color:white; font-size:20px; font-weight:bold; font-feature-settings: 'smcp' on; margin:0 5px;">ShreeJ!</label></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="./daily.jsp">Day <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="./month.jsp">Month</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="./year.jsp">Year</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="./invest.jsp">Investments</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="./Bill.jsp"><i class="fas fa-wallet"> Bills</i> </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Logout"><i class="fa fa-sign-out"> Logout</i> </a>
                    </li>
                </ul>
            </div>
        </nav>
        <h3 style=" text-align: center;margin: 10px 0;"><strong>Monthly Collection</strong></h3>
        <section class="row justify-content-center" id="row1">
            <div class="col-md-8" style="background-color: black;">
                <div class="row" style="border: 1px solid white;">
                    <div class="col">
                        <h4> <i class="fa fa-address-book"></i> S.No.</h4>
                    </div>
                    <div class="col">
                        <h4><i class="fa fa-calendar"> Month</i></h4>
                    </div>
                    <div class="col">
                        <h4> <i class="fa fa-rupee"></i> Total</h4>
                    </div>
                </div>
            </div>
            <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://aa9v5c710cdjv1.c4szod31ycbl.ap-south-1.rds.amazonaws.com/shopsite" user="root" password="rootroot" ></sql:setDataSource>
            <sql:query dataSource="${con}" var="result" sql="select monthname(date)as month,sum(collection)as collection from dailycollection group by month(date)" ></sql:query>
            <c:forEach var="row" items="${result.rows}" varStatus="status" >
                <div class="col-md-8" id="MyRow" style="background-color:#9999994d;">
                    <div class="row" style="border-bottom: 1px solid white;">
                        <div class="col">
                            <span>${status.count}</span>
                        </div>
                        <div class="col">
                            <span>${row.month}</span>
                        </div>
                        <div class="col">
                            <span>${row.collection}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </section>
    </body>

</html>