<%--
  Created by IntelliJ IDEA.
  User: Tri
  Date: 11/22/2021
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="product" scope="request" type="com.ute.auctionwebapp.beans.Product"/>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User" />
<t:main>
    <jsp:attribute name="js">
        <script>
            window.onload=()=>{
                if(!${auth})
                    $('.heart').attr("onclick","location.href='${pageContext.request.contextPath}/Account/Login'")
            }
            function add (otp){
                {
                    $.getJSON(otp, function (data) {
                        if (data === 'false') {
                            alert('Not Added');
                        } else alert("successfully");
                    });
                }
            }
        </script>
    </jsp:attribute>

    <jsp:body>
        <div class="right col-sm-9 ml-3 ">
            <div class="card mt-2">
                <div class="card-header bg-warning">
                    <h4 style="cursor:pointer;" class="text-center">${product.proname}</h4>
                </div>
                <div class="card-body">
                    <div class="all" style="margin-left: 150px">
                        <div>
                            <ul class="list-img mt-2">
                                <li class="img mb-3">
                                    <img id="one" onclick="changeImage('one')" style="width:80px ;" src="${pageContext.request.contextPath}/public/imgs/products/${product.proid}/main.jpg" alt="">
                                </li>
                                <li class="img mb-3">
                                    <img id="two"  onclick="changeImage('two')" style="width:80px ;" src="${pageContext.request.contextPath}/public/imgs/products/${product.proid}/sub1.jpg" alt="">
                                </li>
                                <li class="img mb-3">
                                    <img id="three"  onclick="changeImage('three')" style="width:80px ;"  src="${pageContext.request.contextPath}/public/imgs/products/${product.proid}/sub2.jpg" alt="">
                                </li>
                                <li class="img">
                                    <img id="four"  onclick="changeImage('four')" style="width:80px ;"  src="${pageContext.request.contextPath}/public/imgs/products/${product.proid}/sub3.jpg" alt="">
                                </li>
                            </ul>
                        </div>
                        <div id="main_img" style="margin-left: 10px">
                            <img id="img_main"  src="${pageContext.request.contextPath}/public/imgs/products/${product.proid}/main.jpg" style="width: 400px;height: 400px; object-fit: contain;" alt="">
                        </div>
                    </div>
                    <h4 style="cursor:pointer;" class="text-success text-center mt-3">Giá khởi điểm: ${product.price_start}</h4>
                    <h4 style="cursor:pointer;" class="text-danger text-center mt-3">Giá mua ngay: ${product.price_now}</h4>
                    <h4 class="card-title mt-3 ml-4">Thông tin sản phẩm</h4>
                    <p class="ml-5">
                        Số lượng: ${product.quantity}
                    </p>
                    <p class="ml-5">${product.fulldes}</p>
                    <p class="ml-5">${product.start_day}</p>
                    <p class="ml-5">${product.end_day}</p>
                </div>
                <div class="card-footer text-muted bg-warning d-flex justify-content-center">
                    <a class="btn btn-primary mr-5" href="#" role="button">
                        <i class="fa fa-gavel" aria-hidden="true"></i>
                        Auction now
                    </a>
                    <button class="heart btn btn-danger mr-5" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${product.proid}&proname=${product.proname}&price_start=${product.price_start}&uid=${authUser.id}')" role="button">
                        <i class="fa fa-heart" aria-hidden="true"></i>
                        Love
                    </button>
                </div>
            </div>
            <hr>
            <h3>Similar products</h3>
                <div class="container-fluid">
                    <div class="row mt-2">
                        <c:choose>
                            <c:when test="${products.size()==0}">
                                <div class="card-body">
                                    <p class="card-text">No data</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${products}" var="p">
                                    <div class="col-md-3 mb-4" >
                                        <div class="product-top">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}"><img style="width: 232px;height: 232px; object-fit: contain;" src="${pageContext.request.contextPath}/public/imgs/products/${p.proid}/main.jpg"></a>
                                            <div class="overlay-right">
                                                <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}" class="btn btn-secondary" title="Detail">
                                                    <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                                </a>
                                                <button type="button"  href="${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=${authUser.id}" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=${authUser.id}')" class="heart btn btn-secondary " title="Add to WatchList">
                                                    <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                                </button>

                                            </div>
                                        </div>
                                        <div class="product-bottom text-center">
                                            <h3 name="proname">${p.proname}</h3>
                                            <p name="price_start" style="margin: 0">Start price: ${p.price_start}</p>
                                            <a class="btn btn-success btn-sm" href="#" role="button">
                                                <i class="fa fa-gavel text-light fa-2x" aria-hidden="true"></i>
                                                Auction now
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
        </div>

    </jsp:body>
</t:main>

