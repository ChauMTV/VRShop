<%-- 
    Document   : cart
    Created on : Jul 14, 2021, 12:20:52 AM
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
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <style>
        .body{
            margin-top: 20px;
        }
    </style>
    <body>

        <!------ Include the above in your HEAD tag ---------->
        <div class="container-fluid">
            <%@include file="header.jsp" %>
            <div class="container">
                <div class="row">
                    <div class="col-xs-8">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <h5><span class="glyphicon glyphicon-shopping-cart" ></span> Shopping Cart</h5>
                                        </div>
                                        <div class="col-xs-6" >
                                            <a href="list">
                                                <button type="button" class="btn btn-primary btn-sm btn-block" >
                                                    <span class="glyphicon glyphicon-share-alt" ></span> Continue shopping
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:forEach items="${sessionScope.cartlist}" var="item">
                                <div class="panel-body">
                                   
                                        <div class="row">
                                            <div class="col-xs-2"><img class="img-responsive" src="${item.product.image}">
                                            </div>
                                            <div class="col-xs-4">
                                                <h4 class="product-name"><strong></strong></h4><h4><strong>${item.product.pname}</strong></h4>
                                            </div>
                                            <div class="col-xs-6">
                                                <div class="col-xs-6 text-right">
                                                    <h6><strong>${item.price} <span class="text-muted">x</span></strong></h6>
                                                </div>
                                                <form action="updatecart">
                                                <div class="col-xs-4">
                                                    <input type="number" name="quantity" class="form-control input-sm" value="${item.quantity}" onchange="this.form.submit()">
                                                    <input type="text" name="id" value="${item.product.pid}" style="display: none">
                                                </div>
                                                <div class="col-xs-2">
                                                    <a href="remove?id=${item.product.pid}">
                                                    <button type="button" class="btn btn-link btn-xs" >
                                                        <span class="glyphicon glyphicon-trash"> </span>
                                                    </button>
                                                    </a>
                                                </div>
                                                    </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <hr>

                                    <hr>
                                    <div class="row">
                                        <div class="text-center">
                                            <div class="col-xs-9">
                                                <h6 class="text-right">Added items?</h6>
                                            </div>
                                            <div class="col-xs-3">
                                                <button type="button" class="btn btn-default btn-sm btn-block">
                                                    Update cart
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                            </div>
                            
                                
                            <div class="panel-footer">
                                <div class="row text-center">
                                    <div class="col-xs-9">
                                        <h4 class="text-right">Total <strong><fmt:formatNumber type="number" maxFractionDigits="2" value="${sessionScope.total}"/></strong></h4>
                                    </div>
                                    
                                    <div class="col-xs-3">
                                        <button  type="button" class="btn btn-success btn-block" onclick="location.href ='checkout';">
                                            Checkout
                                        </button>
                                    </div>
                                           
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
