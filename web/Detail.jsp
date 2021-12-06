<%-- 
    Document   : Detail
    Created on : Jul 12, 2021, 9:51:13 PM
    Author     : WacMac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Icons -->
        <link rel="stylesheet" href="css/font-awesome.css">

        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    <sctipt src="js/script.js"></sctipt>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css"/>

        
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="container-fluid">

        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="${requestScope.product.image}" alt="">
                            </div>


                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <!--                        <div id="product-imgs">
                                                    <div class="product-preview">
                                                        <img src="./img/product01.png" alt="">
                                                    </div>
                        
                                                    <div class="product-preview">
                                                        <img src="./img/product03.png" alt="">
                                                    </div>
                        
                                                    <div class="product-preview">
                                                        <img src="./img/product06.png" alt="">
                                                    </div>
                        
                                                    <div class="product-preview">
                                                        <img src="./img/product08.png" alt="">
                                                    </div>
                                                </div>-->
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <form action="buy">
                    <div class="col-md-5">
                        <div class="product-details">
                            <h3 class="product-name">${requestScope.product.pname}</h3>
                            
                            <div>
                                <h3 class="product-price"><fmt:formatNumber type="number" maxFractionDigits="2" value="${requestScope.product.price}"/>VND</h3>

                            </div>

                            <div class="add-to-cart">
                                    
                                    
                                <div class="qty-label">
                                    PRODUCTID: ${requestScope.product.pid}
                                    <input type="text" name="Id" value="${requestScope.product.pid}" readonly > <br></br>
                                     In Stock:  ${requestScope.product.quantity} </br>
                                    Qty
                                    <div class="input-number">
                                        <input type="number" name="quantity" value="1">
                                        <span type="button" class="qty-up">+</span>
                                        <span type="button" class="qty-down">-</span>
                                    </div>
                                </div> <c:if test="${sessionScope.account.role != 'admin' }">
                                            <c:if test="${sessionScope.product.quantity != 0 }">
                     
                                        <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                        </c:if>
                                         </c:if>
                            </div>
                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                               
                                <li class="active"><a data-toggle="tab" href="#tab2">Details</a> </li>
                               
                            </ul>
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>${requestScope.product.descript}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                        </form>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </div>
</body>

</html>
