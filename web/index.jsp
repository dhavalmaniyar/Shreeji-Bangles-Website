<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,user-scalable=no">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="./js/bootstrap.js"></script>
        <title>Login</title>
    </head>
    <%
        if (session.getAttribute("wrong_uname_pass") != null) {
    %>
    <script>

        alert("wrong user name or password");
    </script>

    <%
            session.removeAttribute("wrong_uname_pass");
        }

    %>

    <%        if (session.getAttribute("wrong_npass_cpass") != null) {
    %>
    <script>

        alert("Different : password,confirm password");
    </script>

    <%
            session.removeAttribute("wrong_npass_cpass");
        }

    %>

    <body>
        <section id="desktop" class="row">
            <div class="col-md-6" style="margin: 0px;">
                <img src="./images/shreeji_front_logo.jpg" style="height:100vh;" alt="">
            </div>

            <div class="col-md-6" style="margin: 0px;">
                <div class="card" style="top:50px">
                    <img src="./images/shreeji.png" class="card-img-top" alt="">
                    <div class="card-body">
                        <form action="Login" method="post">
                            <div class="form-group">
                                <span id="valid" style="color: red;padding:0 22%; display: none;">incorrect Email or password</span><br>
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                       placeholder="Enter email" name="email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pass" required>
                            </div>
                            <button type="submit" class="btn btn-success">Submit</button>&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#exampleModalCenter">change password</a>
                        </form>                        
                    </div>
                </div>
            </div>
        </section>


        <!--Modal-->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Change Password</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="ChangePassword">
                            <div class="form-row">
                                <div class="form-group col-md-11">
                                    <label for="inputEmail">Email:</label>
                                    <input class="form-control" type="email" name="email" id="inputEmail" placeholder="Email" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="currentPassword">Current Password:</label>
                                    <input class="form-control" type="password" name="pass" id="currentPassword" placeholder="Current Password" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="newPassword">New Password:</label>
                                    <input class="form-control" type="password" name="npass" id="newPassword" placeholder="Password" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="confirmPassword">Confirm Password:</label>
                                    <input class="form-control" type="password" name="cpass" id="confirmPassword" placeholder="Confirm Password" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="adminPassword">Admin Password:</label>
                                    <input class="form-control" type="password" name="apass" id="adminPassword" placeholder="Admin Password" required>
                                </div>
                            </div>    
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        
                    </div>
                </div>
            </div>
        </div>

        <section id="mobile">
            <div id="myCarousel" class="carousel slide " data-interval="2000"  data-wrap="false" data-ride="carousel">
                <div class="carousel-inner ">
                    <div class="carousel-item active" data-interval="1000">
                        <img class="d-block w-100 " style="height: 100vh;" src="./images/shreeji_logo.png" alt="First slide">
                    </div>

                    <div class="carousel-item ">           
                        <div class="card" style="top:50px;">
                            <img src="./images/shreeji.png" class="card-img-top" alt="">
                            <div class="card-body">
                                <form action="Login" method="post" >
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                                               placeholder="Enter email" name="email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                                            else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pass" required>
                                    </div>
                                    <button type="submit" class="btn btn-success">Submit</button>&nbsp;&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#exampleModalCenter">change password</a>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </section>
    </body>
</html>
