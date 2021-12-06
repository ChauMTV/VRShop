<%-- 
    Document   : ProductBrand
    Created on : Jul 10, 2021, 8:13:41 PM
    Author     : WacMac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Product sort Brand</title>
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    <sctipt src="js/script.js"></sctipt>
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

        <div id="searchByBrand">


            <div class="tab "> 
                <ul class="nav justify-content-end">
                    <li class="nav-item" style="display: inline-block">
                        <c:forEach items="${requestScope.cats}" var="br">
                            <a class="${br.id==pid?"active":""}" href="brand?id=${br.id}">
                                ${br.brand} &nbsp;&nbsp;&nbsp;
                            </a>
                        </c:forEach>
                    </li>

                </ul>

                <c:set var="page" value="${requestScope.page}"/>
            </div>


            <div class="pagination" >
                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                    <a class="${i==page?"active":""}" href="brand?page=${i}&id=${id}">${i}</a> 
                </c:forEach>

            </div>


            <div class="row d-flex justify-content-center">

                <!----start-model-box---->


                <a data-toggle="modal" data-target=".bs-example-modal-md" href="#"> </a>

                <c:forEach items="${requestScope.data}" var="p">
                    <!----start-model-box---->

                    <div id="topsale" class="col-sm-5 col-md-4 col-lg-3">
                        <div class="grid">

                            <div class="portfolio app mix_all" data-cat="app" style="display: inline-block; opacity: 1;">
                                <div class="portfolio-wrapper" style="text-align: center">
                                    <c:if test="${p.quantity != 0 }">
                                        <a href="detail?id=${p.pid}" class="b-link-stripe b-animate-go  thickbox">
                                            <img class="img-responsive" src="${p.image}" style="width: 300px; height: 400px; "/>
                                            <div class="b-wrapper">
                                                <h2 class="b-animate b-from-left    b-delay03 "><img src="images/link-ico.png" alt="" /></h2>
                                            </div>
                                        </a>
                                    </c:if>
                                    <c:if test="${p.quantity == 0 }">
                                        <a class="b-link-stripe b-animate-go  thickbox">
                                            <img class="img-responsive" src="${p.image}" style="width: 300px; height: 400px; "/>
                                            <div class="b-wrapper">
                                                <h2 class="b-animate b-from-left    b-delay03 "><img src="images/link-ico.png" alt="" /></h2>
                                            </div>
                                        </a>
                                    </c:if>

                                </div>
                            </div>
                            <div  height: 181px; ">
                                  <div style=" text-overflow: ellipsis;
                                 overflow: hidden; white-space: nowrap;    ">
                                    <p class="text-center">
                                        ${p.pid}.${p.pname}</p>

                                </div>

                                <h2 class="text-center"> 
                                    <fmt:formatNumber pattern="###,###.###" value="${p.price}"/>đ
                                </h2>
                                <div style="margin: 0 auto; text-align: center">
                                    <c:if test="${sessionScope.account.role == 'user'||sessionScope.account.role == null}">
                                        <c:if test="${p.quantity != 0 }">
                                            <a class="btn btn-outline-success mt-auto" href="detail?id=${p.pid}" style="margin: 0 auto;">Details</a>
                                        </c:if>


                                        <c:if test="${p.quantity == 0 }">


                                            <a   class="btn btn-outline-warning"  style="margin: 0 auto;">Hết Hàng</a>

                                        </c:if>    
                                    </c:if>
                                    <c:if test="${sessionScope.account.role == 'admin'}">
                                        <c:if test="${p.quantity != 0 }">
                                            <a class="btn btn-outline-success mt-auto"  style="margin: 0 auto;">Còn Hàng</a>
                                        </c:if>


                                        <c:if test="${p.quantity == 0 }">
                                            <a class="btn btn-outline-warning" href="updateP?id=${p.pid}"  style="margin: 0 auto;">Hết Hàng</a>

                                        </c:if>    
                                    </c:if>

                                </div>

                            </div>

                        </div>  
                        <!--                        </form>-->
                    </div>

                </c:forEach>

                <div class="clearfix"></div>


            </div>

        </div>

        <div class="pagination" >
            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                <a class="${i==page?"active":""}" href="brand?page=${i}&id=${id}">${i}</a> 
            </c:forEach>

        </div>
        <div id="nothing">

        </div>


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
</body>
</html>
