<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>investments</title>
    </head>
    <script>

        $(document).ready(function () {

            $(".delete").click(function () {
                myvar = this.id;
                var chk = confirm("Do you want to delete ' " + this.value + " ' ?");
                if (chk) {
                    window.location.replace("DeleteEntry?mess=" + myvar);
                }
            });
        });
        function check(){
            var invest=document.getElementById('invest').value;
            var amt=document.getElementById('amount').value;
            if(invest==='' || amt===''){
                alert('Please enter item name and amount');
            }
            else{
                document.getElementById("inv").submit();
            }
        }
    </script>
    <%
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        if (session.getAttribute("uname") == null) {
            response.sendRedirect("index.jsp");
        }
    %>
    <body>
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
        <h3 style=" text-align: center;margin: 10px 0;"><strong>Investments</strong></h3>
        <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://aa9v5c710cdjv1.c4szod31ycbl.ap-south-1.rds.amazonaws.com/shopsite" user="root" password="rootroot"></sql:setDataSource>
        <sql:query var="result" dataSource="${con}" sql="select * from invest where month(date)=month(curdate())&&delete_on is null"></sql:query>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form action="investment" id="inv">
                        <table class="table table-hover text-center">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col" colspan="2">Date</th>
                                    <th scope="col" colspan="">Investments </th>
                                    <th scope="col" class="amount" >Amount</th>
                                    <th scope="col"><i class="fa fa-trash" style="color: white;"> del. </i></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="row" items="${result.rows}">
                                <tr>
                                    <th scope="row" colspan="2" ><fmt:formatDate value="${row.date}" pattern="dd-MM-yyyy" /></th>
                                    <td colspan=""> <input type="text" value="${row.investment}" disabled style="border: none; width: 100%; text-align: center; outline: none;"></td>
                                    <td ><input type="number" value="${row.amount}" disabled style="border: none; width: 100%; text-align: center; outline: none;"></td>
                                    <td><button class="btn btn-outline-primary delete" type="button" id="${row.id}" value="${row.investment}" style="height: 100%; padding: 0px; width: 100%" > <i class="fa fa-trash"> </i></button></td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th scope="row" colspan="2">Today</th>
                                <td> <input id="invest" type="text" name="invest" style="border: none; width: 100%; text-align: center; outline: none;"></td>
                                <td><input id="amount" type="number" name="amount" style="border: none; width: 100%; text-align: center; outline: none;"></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <sql:query dataSource="${con}" var="result" sql=" select sum(amount) as sum from invest where month(date)=month(curdate())-1 && year(date)=year(date)"></sql:query>
                    <c:forEach var="row" items="${result.rows}">
                        <strong>Previous Month : ${row.sum} </strong>
                    </c:forEach>

                    <input type="button" onclick="check()" value="Add +" class="btn btn-success" style="float: right"> 
                    <!--<button class="btn btn-success" style="float: right;">Add+</button>-->
                </form>
            </div>
        </div>
    </body>
</html>