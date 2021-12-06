<%-- 
    Document   : header
    Created on : Jun 15, 2021, 3:00:39 PM
    Author     : WacMac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/script.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Icons -->
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel ="stylesheet" href="css/styleindex.css" >
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid ">

            <!--menu content-->
            <div class="row">

                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="home">Home <span class="sr-only">(current)</span></a></li>
                            <li><a href="https://scontent-hkt1-2.xx.fbcdn.net/v/t1.6435-9/57548424_10219779057573373_779678813540843520_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=174925&_nc_ohc=qlHtdd0LG5sAX_ukhbi&_nc_ht=scontent-hkt1-2.xx&oh=f6fac26cbec1ba46497706966a0360b8&oe=60F4FC72">About</a></li>
                            <li><a href="list">Product</a></li>
                            <li><a href="#">Contact</a></li>
                            <li>
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Brand
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="brand?id=1">Oculus</a></li>
                                    <li><a href="brand?id=4">Valve</a></li>
                                    <li><a href="brand?id=3">HTC Vive</a></li>
                                    <li><a href="brand?id=2">Windows Mixed Reality</a></li>
                                </ul>
                            </li>
                            <li> <c:if test="${sessionScope.account.role == 'admin'}">



                            <a  href="crud">Edit</a>


                        </c:if></li>
                        </ul>



                        

                        <form class="navbar-form navbar-right" action="search" method="get">
                              <c:if test="${sessionScope.account.role=='user'}">


                        <a href="cart" class="nav-item nav-link">
                            <i class="fa fa-fw fa-shopping-cart">

                            </i></a>
                        </c:if>
                        <c:if test="${sessionScope.account==null || sessionScope.account.role == 'admin'}">
                           
                                    <a href="cart.jsp" class="nav-item nav-link">
                            <i class="fa fa-fw fa-shopping-cart">

                            </i></a>
                       
                        </c:if>

                            <div class="form-group">
                                <input type="search" class="form-control" placeholder="Search" name="key">
                            </div>
                            <button type="submit" class="btn btn-default" onclick="this.form.submit">Search</button>
                            <c:if test="${sessionScope.account==null}">

                               



                            
                            <ul class="nav navbar-nav navbar-right">

                                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                            </ul>

                        </c:if>

                        <c:if test="${sessionScope.account!=null}">


                            Hello 

                            <span class="glyphicon glyiconuser"></span>
                            ${sessionScope.account.username}
                            &nbsp;
                            &nbsp;

                            <a href="logout">
                                Logout
                            </a>

                        </c:if>
</form>






                    </div>

                </nav>

            </div>
        </div>
    </body>
</html>
