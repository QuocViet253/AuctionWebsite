<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:admin>
    <jsp:body>
        <h3 class="text-center mb-3 mt-3 bg-primary text-light" style="font-family: 'Bauhaus 93'">Welcome To Control Manager</h3>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner" style="width: 50%; height: 50%; margin-left: auto; margin-right: auto">
                <img class='tet tet-left' src='https://1.bp.blogspot.com/-jnoHkZl5_AM/YBgnvWeDMmI/AAAAAAAADy0/R-kqgeeWA5YxmPoN7oZWG4SQeyHYtSoQACLcBGAsYHQ/s522/caudoitet1.webp' style="position:fixed;top:0;left:0;z-index:9999; margin-top: 88px"/>
                <img class='tet tet-right' src='https://1.bp.blogspot.com/-l49qL0RM4Qg/YBgnvdfRExI/AAAAAAAADyw/o0av3DGxSfY7jrzMHxoTuoC1u8FPSYlCgCLcBGAsYHQ/s522/caudoitet2.webp' style="position:fixed;top:0;right:0;z-index:9999; margin-top: 88px"/>
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/public/imgs/AdminMainImage.png" class="d-block w-100" alt=“Decoration” style="height:345px">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/public/imgs/AdManager.png" class="d-block w-100" alt=“Decoration” style="height:350px">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/public/imgs/AdManager1.png" class="d-block w-100" alt=“Decoration” style="height:350px">
                </div>
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </button>
            </div>
    </jsp:body>
</t:admin>



