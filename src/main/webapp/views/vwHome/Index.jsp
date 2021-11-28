<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="products1" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="products2" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<t:main>
    <jsp:attribute name="js">
        <script>
            function add (otp){
                $.getJSON(otp, function (data) {
                    if (data === 'false') {
                        alert('Not Added');
                    } else alert("successfully");
                });
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="right col-sm-10 mt-1" >
            <section class="on-sale">
                <div class="container-fluid">
                    <div class="title-box bg-danger mt-1 w-100 justify-content-center" style="border-radius: 5px;">
                        <h2 style="cursor: pointer;">Top expire</h2>
                    </div>
                    <div class="row">
                            <c:forEach items="${products1}" var="p1">
                                <div class="col-md-3" >
                                    <div class="product-top">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p1.proid}"><img src="${pageContext.request.contextPath}/public/imgs/products/${p1.proid}/main.jpg" style="width: 232px;height: 232px; object-fit: contain;"></a>
                                        <div class="overlay-right">
                                                <a href="${pageContext.request.contextPath}/Product/Detail?id=${p1.proid}" type="button" class="btn btn-secondary" title="Detail">
                                                    <i class="fa fa-eye" aria-hidden="true" style="border-radius: 50%"></i>
                                                </a>
                                                    <button type="button" href="${pageContext.request.contextPath}/Product/AddWatchList?proid=${p1.proid}&proname=${p1.proname}&price_start=${p1.price_start}&uid=1" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p1.proid}&proname=${p1.proname}&price_start=${p1.price_start}&uid=1')" class="btn btn-secondary" title="Add to WatchList">
                                                        <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                                    </button>
                                        </div>
                                    </div>
                                        <div class="product-bottom text-center">
                                            <h3>${p1.proname}</h3>
                                            <h5>Giá khởi điểm: ${p1.price_start}</h5>
                                            <h5>Giá mua ngay: ${p1.price_now}</h5>
                                        </div>
                                    </div>
                                </c:forEach>
                    </div>
                    <div class="title-box bg-danger mt-1 w-100 justify-content-center" style="border-radius: 5px;">
                        <a name="hot"></a>
                        <h2 style="cursor: pointer;">Top Price</h2>
                    </div>
                    <div class="row">
                        <c:forEach items="${products2}" var="p2">
                            <div class="col-md-3" >
                                <div class="product-top">
                                    <a href="${pageContext.request.contextPath}/Product/Detail?id=${p2.proid}"><img src="${pageContext.request.contextPath}/public/imgs/products/${p2.proid}/main.jpg" style="width: 232px;height: 232px; object-fit: contain;"></a>
                                    <div class="overlay-right">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p2.proid}" type="button" class="btn btn-secondary" title="Detail">
                                            <i class="fa fa-eye" aria-hidden="true" style="border-radius: 50%"></i>
                                        </a>
                                        <button  href="${pageContext.request.contextPath}/Product/AddWatchList?proid=${p2.proid}&proname=${p2.proname}&price_start=${p2.price_start}&uid=1" type="button" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p2.proid}&proname=${p2.proname}&price_start=${p2.price_start}&uid=1')" class="btn btn-secondary" title="Add to WatchList">
                                            <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                        </button>
<%--                                        <a type="button" class="btn btn-secondary" title="Add to Cart">--%>
<%--                                            <i class="fa fa-shopping-cart" style="border-radius: 50%"></i>--%>
<%--                                        </a>--%>
                                    </div>
                                </div>
                                <div class="product-bottom text-center">
                                    <h3>${p2.proname}</h3>
                                    <h5>Giá khởi điểm: ${p2.price_start}</h5>
                                    <h5>Giá mua ngay: ${p2.price_now}</h5>
                                    <h5>Giá hiện tại: ${p2.price_current}</h5>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>
    </jsp:body>
</t:main>
