<%--<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Daily Collection</title>
    </head>
    <style>
        @media only screen and (max-width: 900px){
            h4{
                padding-left: 3px;
            }
            span{
                padding:0px;
            }
            .span{
                margin-left: 10px;
            }
        }
    </style>
    <script>
        function changeDate() {
            myDate = document.getElementById("inputState").value;
            location.assign("daily.jsp?mess=" + myDate);
        }
    </script>

    <body>
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            if (session.getAttribute("uname") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-danger">
            <a class="navbar-brand" href="#"><img src="./images/logo.png" height="50px" style="margin: 0px; padding: 0px;" alt=""><label for="name" style="color:white; font-size:20px; font-weight:bold; font-feature-settings: 'smcp' on; margin:0 5px;">ShreeJ!</label></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                        <a class="nav-link" href="./Bill.jsp"><i class="fas fa-wallet"> Bills </i> </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Logout"><i class="fa fa-sign-out"> Logout</i> </a>
                    </li>
                </ul>
            </div>
        </nav>

        <h3 style=" text-align: center; margin: 10px 0;"><strong>Daily Collection</strong></h3>
        <%
            String s = request.getParameter("mess");
            pageContext.setAttribute("newDate", s);
        %>
        <form class="form-group">
            <div class="row justify-content-center">
                <div class="form-group col-md-1 text-center" >
                    <h5 style="margin:5px 0 0 0;">Select Date:</h5>
                </div>
                <div class="col-md-1" style="margin:0px;">
                    <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://aa9v5c710cdjv1.c4szod31ycbl.ap-south-1.rds.amazonaws.com/shopsite" user="root" password="rootroot"></sql:setDataSource>
                    <sql:query var="result" dataSource="${con}" sql="select date from dailycollection where month(date)= month(curdate()) group by date" ></sql:query>
                        <select id="inputState" class="form-control" onchange ="changeDate()">
                        <c:if test="${newDate==null}">
                            <option value="${newDate} selected">Today</option> 
                        </c:if>
                        <c:if test="${newDate != null}">
                            <option value="${newDate} selected">${newDate}</option> 
                        </c:if>
                        <c:forEach var="row" items="${result.rows}" >
                            <option value="${row.date}"> <fmt:formatDate value="${row.date}" pattern="dd-MM-yyyy" />  </option>
                        </c:forEach>
                    </select>   
                </div>
            </div>
        </form> 
        <section class="row justify-content-center" id="row1">
            <div class="col-md-8" style="background-color: black;">
                <div class="row" style="border: 1px solid white;">
                    <div class="col">
                        <h4> <i class="fa fa-hashtag "> ID</i></h4>
                    </div>
                    <div class="col">
                        <h4><i class="fa fa-calendar"> Date</i></h4>
                    </div>
                    <div class="col">
                        <h4> <i class="fa fa-history"> </i> Time</h4>
                    </div>
                    <div class="col">
                        <h4> <i class="fa fa-rupee"></i> Total</h4>
                    </div>
                </div>
            </div>
            <c:if test="${newDate != null}">
                <sql:query dataSource="${con}" sql="select * from dailycollection where date = ?" var="result">
                    <sql:param value="${newDate}"/>
                </sql:query>
            </c:if>
            <c:if test="${newDate ==null}">
                <sql:query dataSource="${con}" sql="select * from dailycollection where date = curdate()" var="result"></sql:query>
            </c:if>

            <c:set var="timeZone" value="GMT+5:30"/>

            <c:forEach items="${result.rows}" var="row">
                <div class="col-md-8" id="MyRow" style="background-color:#9999994d;">
                    <div class="row" style="border-bottom: 1px solid white;">
                        <div class="col">
                            <span class="span">${row.id}</span>
                        </div>
                        <div class="col">
                            <span><fmt:formatDate type="date" value="${row.date}" pattern="dd-MM-yyyy" /></span>
                        </div>
                        <div class="col">
                            <fmt:timeZone  value="${timeZone}">
                                <span class="span"><fmt:formatDate type="time" timeZone="${timeZone}" value="${row.time}" pattern="hh : mm : ss" /></span>
                            </fmt:timeZone>
                        </div>
                        <div class="col">
                            <span class="span">${row.collection}</span>
                        </div>
                    </div>   
                </div>
            </c:forEach>
        </section>
        <div class="row justify-content-center">
            <div class="col-md-8" style="background-color: #5a5a5a4d;">
                <div class="row" style="border-bottom: 1px solid white;">
                    <div class="col">
                        <strong><span style=" padding: 9%;">Total</span></strong>
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                        <c:choose >
                            <c:when test="${newDate != null}">
                                <sql:query dataSource="${con}" sql="select sum(collection) as sum from dailycollection where date=?" var="total">
                                    <sql:param value="${newDate}"/>
                                </sql:query>
                            </c:when>
                            <c:otherwise>
                                 <sql:query dataSource="${con}" sql="select sum(collection) as sum from dailycollection where date=curdate()" var="total"></sql:query>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="row" items="${total.rows}"><span class="span"> ${row.sum}</span></c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </body>
</html>