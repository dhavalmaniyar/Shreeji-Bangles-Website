<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="./js/bootstrap.js"></script>
        <link rel="stylesheet" href="./fontawesome-free-5.13.0-web/css/all.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">       
        
        <title>Bills</title>
    </head>

    <style>
        *{
            font-feature-settings: "smcp" on;
        }

        @media only screen and (max-width: 900px){
            .card-body{
                padding-left:0px; 
                padding-right:0px; 
            }
        }
        input{
            outline: none;
            border: none;
            width: 100%;
        }
        .btn{
            font-size: 20px;
        }
        #table1 td button {
            height: 100%;
            width: 100%;
        }
        #table1 td {
            width: 90px;
            height: 60px;
        }
        .card-img-top{
            width: 90px;
            border-radius: 50%;
            float: left;
        }
        .card{
            margin-bottom: 10px;
            margin-top:20px ; 
        }
        @media print{ 

            #bill_generate,#add_row,#delete_row{ 
                display:none; 
            } 
            @media print {
                body { font-size: 17pt;
                }
            }
            @media screen {
                body { font-size: 15pt ;}
            }
            @media screen, print {
                body { line-height: 1.2 ;
                       margin:0 -150px;}
            }
            option{
                text-transform: uppercase;
            }
        }
    </style>
    <script>

        $(document).ready(function () {
            var i = 1;

            $("#add_row").click(function () {

                b = i - 1;
                $('#addr' + i).html($('#addr' + b).html()).find('th:first').html(i + 1);
                $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');
                i++;
            });
            $("#delete_row").click(function () {
                if (i > 1) {
                    $("#addr" + (i - 1)).html('');
                    i--;
                }
                calc();
            });

            $('#tab_logic tbody').on('keyup change', function () {
                calc();
            });
            $('#tax').on('keyup change', function () {
                calc_total();
            });

        });

        function calc()
        {
            $('#tab_logic tbody tr').each(function (i, element) {
                var html = $(this).html();
                if (html != '')
                {
                    var qty = $(this).find('.qty').val();
                    var price = $(this).find('.price').val();
                    $(this).find('.total').val(qty * price);

                    calc_total();
                }
            });
        }
        function calc_total()
        {
            total = 0;
            $('.total').each(function () {
                total += parseInt($(this).val());
            });
            $('#sub_total').val(total.toFixed(2));
            tax_sum = total / 100 * $('#tax').val();
            $('#tax_amount').val(tax_sum.toFixed(2));
            $('#total_amount').val((tax_sum + total).toFixed(2));
        }
        function printInfo() {
            window.focus();
            window.print();
        }
        function submitting() {
            document.getElementById("bill").submit();

        }
        function check() {
            var chk = document.forms["bill"]["sub_total"].value;
            var chk_name = document.getElementById("customer").value;
            if (chk == "" || chk == null || chk == 0) {
                alert("Please fill the required entries");
            } else {
                if (chk_name == '') {
                    alert('Please Enter the customer name');
                } else {

                    printInfo();

                    if (document.getElementById("bill")){
                        setTimeout("submitting()", 7000);
                    }

                }
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
            <a class="navbar-brand" href="#"><img src="./images/logo.png" height="50px" style="margin: 0px; padding: 0px;" alt=""><label for="name"  style="color:white; font-size:20px; font-weight:bold; font-feature-settings: 'smcp' on; margin:0 5px;">ShreeJ!</label></a>
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
                        <a class="nav-link" href="./Bill.jsp"><i class="fas fa-wallet"> Bills</i> </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Logout"><i class="fa fa-sign-out"> Logout</i> </a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="row justify-content-center">        
            <div class="col-md-8">
                <form name="bill" id="bill" action="DataInsert" method="get">
                    <div class="card w-100">
                        <div class="card-body">
                            <div id="bill-header" class="text-center " >
                                <img class="card-img-top" src="./images/shreeji_logo.png" ><br>
                                <h1 >Shree Ji</h1>
                                <p>Contact no. : 9977010680, 8889370153</p>
                            </div><br>
                            <table class="table table-striped text-center">
                                <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://aa9v5c710cdjv1.c4szod31ycbl.ap-south-1.rds.amazonaws.com/shopsite" user="root" password="rootroot"></sql:setDataSource>
                                <jsp:useBean id="now" class="java.util.Date"/>
                                <tr>
                                    <td><strong>Customer Name:</strong></td>
                                    <td><strong>Date:</strong></td>
                                    <td><strong>Bill No:</strong></td>
                                </tr>
                                <tr>
                                    <td><input id="customer" type="text" style='width:100%; text-align: center'></td>
                                    <td> <fmt:formatDate value="${now}" pattern="dd-MM-yyyy"/></td>
                                    <sql:query  dataSource="${con}" var="result" sql="select max(id) as id from dailycollection"></sql:query>
                                    <c:forEach var="row" items="${result.rows}"><td>${row.id+1}</td></c:forEach>
                                </tr>
                            </table>
                            <table class="table table-striped text-center" id="tab_logic">
                                <thead>
                                    <tr>
                                        <th width="5%" scope="col">S.NO</th>
                                        <th width="50%" scope="col">ITEMS</th>
                                        <th width="12%" scope="col">QTY</th>
                                        <th width="13%" scope="col">PRICE</th>
                                        <th width="20%" scopr="col">TOTAL</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr id="addr0">
                                        <th scope="row">1</th>
                                        <td><input type="text" class="item" list="mylist" name='item[]' style="text-align:center;" ></td>              
                                <datalist id="mylist" >
                                    <option>AD Neckless</option>
                                    <option>AD Earrings</option>
                                    <option>AD Bangle</option>
                                    <option>Bangle Ship </option>
                                    <option>Bangle Lac</option>
                                    <option>Bangle Bantex</option>
                                    <option>Bajubandh</option>
                                    <option>Bichiya</option>
                                    <option>Bracelet</option>
                                    <option>Mangalsutra</option>
                                    <option>Neckless</option>
                                    <option>Kandora</option>
                                    <option>Payal Silver</option>
                                    <option>Payal Golden</option>
                                    <option>Rajasthani Set</option>
                                    <option>Jumki</option>
                                    <option>Tops</option>
                                    <option>Western Neckless</option>
                                    <option>Western Earring</option>
                                </datalist>
                                <td><input type="number" class="qty" value="1" name='qty[]' style="text-align:center;" step="0" min="0"></td>
                                <td><input type="number" class="price" name='price[]' style="text-align:center;" step="0.00" min="0" ></td>
                                <td><input type="number" class="total" name='total[]' placeholder='0.00' style="text-align:center;"  readonly/></td>
                                </tr>
                                <tr id='addr1'></tr>
                                </tbody>
                                <tr>
                                    <th scope="row">TOTAL</th>
                                    <td colspan="3"></td>
                                    <td><input id="sub_total" name="sub_total" placeholder='0.00' style="text-align:center;" readonly ></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <button class="btn btn-success pull-right" type="button" id='add_row' style="font-size:1rem; margin:0 10px;">Add +</button>
                    <button class="btn btn-danger pull-right" type="button" id='delete_row' style="font-size:1rem ;">Delete</button>

                    <button class="btn btn-warning" type="button" id='bill_generate' onclick="check()" style="font-size:1rem ;">Generate Bill</button>
                </form>
            </div><br>

        </div>
    </body>
    <div class="spinner-border text-primary" role="status">
            <span class="sr-only">Loading...</span>
        </div>

</html>
