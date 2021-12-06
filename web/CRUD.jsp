<%-- 
    Document   : CRUD
    Created on : Jul 12, 2021, 2:16:27 AM
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
        <script src="js/Jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    <sctipt src="js/script.js"></sctipt>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Icons -->
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel ="stylesheet" href="css/styleindex.css" >
</head>
<body>
    <%@include file="header.jsp" %>

    <div id="CRUD" >

        <a href="Add.jsp">ADD</a>
        <table class="table" border="2px" style=" ">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Image</th>
                <th scope="col">price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Description</th>
                <th scope="col">brand</th>

                <th scope="col"></th>
            </tr>
            <c:forEach items="${requestScope.listCRUD}" var="p">
                <tr>
                    <td>${p.pid}</td>
                    <td>${p.pname}</td>
                    <td><img src="${p.image}" width="150px" height="175px"/></td>
                    <td>
                <fmt:formatNumber pattern="###,###.###" value="${p.price}"/>đ
                </td>
                <td>${p.quantity}</td>
                <td>${p.descript}</td>
                <td>${p.cid}</td>

                <td>
                    <a href="update?id=${p.pid}">Update</a>
                </td>
                <td>
                    <a href="delete?id=${p.pid}">Delete</a>
                </td>
                </tr>

            </c:forEach>

        </table>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
