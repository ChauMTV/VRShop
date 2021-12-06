<%-- 
    Document   : Update
    Created on : Jul 12, 2021, 2:16:20 AM
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
           
           
        <form action="update" method="post">
            <c:set var="p"  value="${requestScope.product}"  />
            <table border="0">
                <h3>Add a Product</h3>
                <tbody>
              <tr>
                        <td>ProductID</td>
                        <td>  <input type="text" name="id" value="${p.pid}" readonly></td>
                    </tr>
                    <tr>
                        <td>ProductName</td>
                        <td>  <input type="text" name="name" value="${p.pname}"></td>
                    </tr>
                    <tr>
                        <td>ProductModel</td>
                        <td>  <input type="text" name="model" value="${p.pmodel}" ></td>
                    </tr>
                    <tr>
                        <td>Manufacturer</td>
                        <td>  <input type="text" name="manufact" value="${p.manufacturer}" ></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>  <input type="text" name="price" value="${p.price}" ></td>
                    </tr>
                    <tr>
                        <td>Image</td>
                        <td>  <input type="file" name="image" value="${p.image}" ></td>
                    </tr>
                    <tr>
                        <td>Release Date</td>
                        <td>  <input type="text" name="release" value="${p.releaseDate}"></td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td>  <input type="text" name="descript" value="${p.descript}"></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td>  <input type="text" name="quantity" value="${p.quantity}"></td>
                    </tr>
                    <tr>
                        <td>Brand</td>
                        <td>  <input type="text" name="cateid" value="${p.cid}" readonly></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit">Update </button></td>
                    </tr>
                </tbody>
            </table>
     
            
        </form>
        
        
                <%@include file="footer.jsp" %>
    </body>
</html>
