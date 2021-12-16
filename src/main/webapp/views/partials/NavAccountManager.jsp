<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User" />
<div class="header">
    <!-- Top Nav -->
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <div class="collapse navbar-collapse justify-content-lg-between" id="navbarSupportedContent">
            <a href="${pageContext.request.contextPath}/Home">
                <img src="${pageContext.request.contextPath}/public/imgs/logo.png" class="img-fluid rounded-top" alt="No Loading" style=" width:140px ;height: 70px">
            </a>

        </div>
    </nav>

    <nav class="navbar navbar-expand-lg navbar-light bg-light mt-1 ">
        <div class="collapse navbar-collapse justify-content-around" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link mr-5 ml-5 text-success" href="#">
                        <i class="fa fa-address-book-o" aria-hidden="true"></i>
                        See List <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mr-5 ml-5 text-danger" href="${pageContext.request.contextPath}/WatchList?uid=${authUser.id}">
                        <<i class="fa fa-plus" aria-hidden="true"></i>
                        Add
                    </a>
                </li>
                <li class="nav-item mr-5 ml-5">
                    <a class="nav-link text-warning" href="${pageContext.request.contextPath}/Account/YourProduct?uid=${authUser.id}">
                        <i class="fa fa-eraser" aria-hidden="true"></i>
                        Delete</a>
                </li>
                <li class="nav-item mr-5 ml-5">
                    <a class="nav-link text-info" href="${pageContext.request.contextPath}/Account/YourProduct?uid=${authUser.id}">
                        <i i class="fa fa-check-circle" aria-hidden="true"></i>
                        Update</a>
                </li>

                <li class="nav-item mr-5 ml-5">
                    <a class="nav-link" href="#">
                        <i class="fa fa-ellipsis-h" aria-hidden="true"></i>
                        Other</a>
                </li>
            </ul>
        </div>
    </nav>
</div>

