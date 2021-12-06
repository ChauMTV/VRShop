<%-- 
    Document   : register
    Created on : Jun 17, 2021, 2:31:12 PM
    Author     : WacMac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {

            }
            .panel-login {
                border-color: #ccc;
                -webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
                -moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
                box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
            }
            .panel-login>.panel-heading {
                color: #00415d;
                background-color: #fff;
                border-color: #fff;
                text-align:center;
            }
            .panel-login>.panel-heading a{
                text-decoration: none;
                color: #666;
                font-weight: bold;
                font-size: 15px;
                -webkit-transition: all 0.1s linear;
                -moz-transition: all 0.1s linear;
                transition: all 0.1s linear;
            }
            .panel-login>.panel-heading a.active{
                color: #029f5b;
                font-size: 18px;
            }
            .panel-login>.panel-heading hr{
                margin-top: 10px;
                margin-bottom: 0px;
                clear: both;
                border: 0;
                height: 1px;
                background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
                background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
                background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
                background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
            }
            .panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
                height: 45px;
                border: 1px solid #ddd;
                font-size: 16px;
                -webkit-transition: all 0.1s linear;
                -moz-transition: all 0.1s linear;
                transition: all 0.1s linear;
            }
            .panel-login input:hover,
            .panel-login input:focus {
                outline:none;
                -webkit-box-shadow: none;
                -moz-box-shadow: none;
                box-shadow: none;
                border-color: #ccc;
            }
            .btn-login {
                background-color: #59B2E0;
                outline: none;
                color: #fff;
                font-size: 14px;
                height: auto;
                font-weight: normal;
                padding: 14px 0;
                text-transform: uppercase;
                border-color: #59B2E6;
            }
            .btn-login:hover,
            .btn-login:focus {
                color: #fff;
                background-color: #53A3CD;
                border-color: #53A3CD;
            }
            .forgot-password {
                text-decoration: underline;
                color: #888;
            }
            .forgot-password:hover,
            .forgot-password:focus {
                text-decoration: underline;
                color: #666;
            }

            .btn-register {
                background-color: #1CB94E;
                outline: none;
                color: #fff;
                font-size: 14px;
                height: auto;
                font-weight: normal;
                padding: 14px 0;
                text-transform: uppercase;
                border-color: #1CB94A;
            }
            .btn-register:hover,
            .btn-register:focus {
                color: #fff;
                background-color: #1CA347;
                border-color: #1CA347;
            }
        </style>
        <script>
               function validateForm() {
                var name = document.createForm.name.value;
                var dob = document.createForm.dob.value;
                var phone = document.createForm.phone.value;
                var address = document.createForm.address.value;
                var user = document.createForm.user.value;
//                var pass = document.createForm.pass.value;

                if (user === "" || user === null) {
                    alert('Bạn chưa nhập tài khoản');
                }

                checkPass();
                
                if (name === "" || dob === "" || phone === "" || address === "" || name === null || dob === null || phone === null || address === null) {
                    alert('Bạn chưa nhập đầy đủ thông tin cá nhân');
                } else {
                    return true;
                }
                return false;
            }
            ;
        </script>
            
 <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Icons -->
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel ="stylesheet" href="css/styleindex.css" >
        <title>Register</title>
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="login.jsp"  id="login-form-link">Đăng Nhập</a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="register.jsp" class="active" id="register-form-link">Đăng Ký</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3 style="color:red" >${requestScope.errorRegister}</h3>
                                    <h3 style="color:red" >${requestScope.error}</h3>
                                    <h3 style="color:red" >${requestScope.error1}</h3>
                                    <h3 style="color:red" >${requestScope.error2}</h3>
                                    <h3 style="color:red" >${requestScope.error3}</h3>

                                    <form id="register-form" action="register" method="post" role="form" style="display: block;" >

                                        <div class="form-group">
                                            <input type="text" name="fullname" id="fullname" tabindex="2" class="form-control" placeholder="Tên">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="number" name="phone" id="phone" tabindex="2" class="form-control" placeholder="Điện thoại">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="address" id="address" tabindex="2" class="form-control" placeholder="Địa Chỉ">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="user" id="username" tabindex="1" class="form-control" placeholder="Tài Khoản" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pass" id="password" tabindex="2" class="form-control" placeholder="Mật khẩu">
                                        </div>
                                         <div class="form-group">
                                            <input type="password" name="re_pass" id="re_password" tabindex="2" class="form-control" placeholder="Xác thực Mật khẩu">
                                        </div>
                                      
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>







        <!--        <div id="loginOutside">
            <div id="none">
                <form action="login" method="post">
                    <input placeholder="Tài khoản" type="text" name="user" class="login">
                    <input placeholder="Mật khẩu" type="password" name="pass" class="login">
                    <input type="submit" id="loginBtn" value="Đăng nhập">
                    <div style="color:red" >${requestScope.error}</div>
                </form>
            </div>
        </div>-->
        <%@include file="footer.jsp" %>
    </body>
    
</html>
