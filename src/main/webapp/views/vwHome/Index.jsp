<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:main>
    <jsp:body>
        <div class="slider">
            <div id="slider" class="carousel slide carousel-fade" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://h2bcompany.files.wordpress.com/2021/04/header-bidding-auction-ss-1920_uusz3n.gif" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="https://cdn.vietnambiz.vn/2019/10/19/penny-auction-bidding-15714956459261607479526.png" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="https://d3jlwjv6gmyigl.cloudfront.net/images/2020/10/auct.jpg" class="d-block w-100">
                    </div>
                </div>
                <ol class="carousel-indicators">
                    <li data-target="#slider" data-slide-to="0" class="active"></li>
                    <li data-target="#slider" data-slide-to="1"></li>
                    <li data-target="#slider" data-slide-to="2"></li>
                </ol>
            </div>
        </div>
    </jsp:body>
</t:main>
