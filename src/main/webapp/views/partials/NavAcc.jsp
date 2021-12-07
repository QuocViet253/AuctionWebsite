<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User" />

<div class="header">
    <!-- Top Nav -->
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <div class="collapse navbar-collapse justify-content-lg-between" id="navbarSupportedContent">
            <img src="${pageContext.request.contextPath}/public/imgs/logo.png" class="img-fluid rounded-top" alt="No Loading" style=" width:140px ;height: 70px">
        </div>
    </nav>
</div>