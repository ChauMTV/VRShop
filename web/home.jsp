<%-- 
    Document   : home
    Created on : Jun 14, 2021, 10:35:16 PM
    Author     : WacMac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> VR World</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Icons -->
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel ="stylesheet" href="css/styleindex.css" >


    </head>

    <body>

        <div class="container-fluid ">

            <!--menu content-->

            <!--slider content-->
            <%@include file="header.jsp" %>

            <div class="row">
                <div>
                    <h1>Best  Products</h1>
                </div>
            </div>
            <div class="row" class="col-sm-6">

                <c:forEach items="${requestScope.home}" var="home">
                    <!----start-model-box---->

                    <div id="topsale" class="col-sm-5 col-md-4 col-lg-3">
                        <div class="grid">
                            <div class="portfolio app mix_all" data-cat="app" style="display: inline-block; opacity: 1;">
                                <div class="product">
                                    <div class="product-img">
                                    <a  href="detail?id=${home.pid}" >
                                        <img class="img-responsive" src="${home.image}" style="width: 300px; height: 400px"/>
                                      
                                    </a>
                                </div>
                                </div>
                            </div>
                            <p class="text-center">
                                ${home.pname}</p>
                            <h2 class="text-center"><fmt:formatNumber pattern="###,###.###" value="${home.price}"/>VND</h2>
                            <div class="text-center">
                                    <a type="button" class="btn btn-info" href="detail?id=${home.pid}" >Info</a>
                                </div>
                            
                            <c:if test="${sessionScope.account.role != 'admin' }">
                                <form action="buy">
                                    
                                    <p class="text-center"><a type="submit" href="buy?id=${home.pid}&quantity=1">Buy</a></p>
                                </form>
                            </c:if>
                                
                        </div>
                    </div>
                </c:forEach>

                <!--        
                                <div class="row" class="col-md-12">
                                
                                        <div class="col-md-3">
                                                <img src="images/product_01.jpg" class="img-responsive" />
                                                <h2 > Oculus Go (32 Gb)</h2>
                                                <p>Price: $159</p>
                                        </div>
                                        
                                        <div class="col-md-3"> 
                                                <img  src="images/product_02.jpg" class="img-responsive"/>
                                                <h2>Oculus Rift</h2>
                                                <p >Price: $499</p>
                                        </div>
                                
                                
                                        <div class="col-md-3">
                                                <img  src="images/product_03.jpg" class="img-responsive"/>
                                                <h2>Oculus Quest 2 (64 Gb) </h2>
                                                <p >Price : $299</p>
                                        </div>
                                        
                                        <div class="col-md-3">
                                                <img  src="images/product_04.jpg" class="img-responsive"/>
                                                <h2 >Oculus Quest (64 Gb)</h2>
                                                <p >Price: $399</p>
                                        </div>
                                        
                        </div>-->
            </div>
            <%@include file="footer.jsp" %>
        </div>


        <!-- JavaScript libs are placed at the end of the document so the pages load faster -->
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>


    </body>
</html>
