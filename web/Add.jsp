<%-- 
    Document   : Add
    Created on : Jul 12, 2021, 2:16:15 AM
    Author     : WacMac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <form action="add" method="get">
        <h1>Add Product </h1>
        <table border="0">
            <h1>${requestScope.error}</h1>
            <tbody>
<!--                <tr>
                    <td>ProductId</td>
                    <td>  <input type="text" name="id"></td>
                </tr>-->
 <tr>
                    <td>ProductID</td>
                    <td>  <input type="text" name="id"></td>
                </tr>
                <tr>
                    <td>ProductName</td>
                    <td>  <input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>ProductModel</td>
                    <td>  <input type="text" name="model"></td>
                </tr>
                <tr>
                    <td>Manufacturer</td>
                    <td>  <input type="text" name="manufact"></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>  <input type="text" name="price"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td>  <input type="file" name="image"></td>
                </tr>
                <tr>
                    <td>Release Date</td>
                    <td>  <input type="text" name="release"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>  <input type="text" name="descript"></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td>  <input type="text" name="quantity"></td>
                </tr>
                <tr>
                    <td>Brand</td>
                    <td>  <input type="text" name="cateid"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit">Add Product</button></td>
                </tr>
            </tbody>
        </table>
    </form>


    <%@include file="footer.jsp" %>
</body>
</html>
