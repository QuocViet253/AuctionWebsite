<%--
  Created by IntelliJ IDEA.
  User: Tri
  Date: 12/9/2021
  Time: 8:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="histories" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.History>"/>

<t:history>
     <jsp:attribute name="js">
        <script></script>
    </jsp:attribute>
    <jsp:body>
        <div class="title-box bg-warning mt-1 w-100 justify-content-center mb-3" style="border-radius: 5px;background-image: url('https://images.squarespace-cdn.com/content/v1/5be4abdf0dbda37a57d6b5cd/1542130803615-0392V5SC5CWYPEEA1FTH/Header-bgr-V1.jpg?format=1500w'); background-size: cover">
            <h2 style="font-family: Russo One,serif" ;>History</h2>
        </div>
        <div class="tableFixHistory w-75 mx-auto" style="cursor: pointer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col" style="background-color: black; color: white">Time</th>
                    <th scope="col" style="background-color: black; color: white">Product</th>
                    <th scope="col" style="background-color: black; color: white">Price</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${histories.size()==0}">
                        <div class="card-body">
                            <p class="card-text">No data</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${histories}" var="h">
                            <tr>
                                <td>
                                    <fmt:parseDate value="${h.buy_day}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                    <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                </td>
                                <td>${h.proname}</td>
                                <td>$ <fmt:formatNumber value="${h.price}" type="number" /></td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </jsp:body>
</t:history>