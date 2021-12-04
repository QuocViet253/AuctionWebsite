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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="com.ute.auctionwebapp.beans.Product"/>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User" />
<t:main>
    <jsp:attribute name="js">
        <script>
            window.onload=()=>{
                if(!${auth})
                {
                    $('.heart').attr("onclick","location.href='${pageContext.request.contextPath}/Account/Login'")
                    $('#btn-auction').attr("onclick","location.href='${pageContext.request.contextPath}/Account/Login'")
                }
            }
            if(${auth})
            {
                $('#btn-auction').on('click',function (){
                    let step =$('#step').val();
                    let price =$('#price').val();
                    let price_start=$('#price_start').val();
                    let email = $('#email').val();
                    if(price===''|| price<price_start)
                    {
                        alert("Please enter your price again")
                    }
                    else{
                        $.getJSON('${pageContext.request.contextPath}/Product/Bidding?proid=${product.proid}&proname=${product.proname}&step='+step+'&price='+price+'&uid=${authUser.id}&email='+email, function (data) {
                            if (data === false) {
                                alert('No');
                            } else{
                                alert('OK');
                                location.reload();
                            }

                        });
                    }
                });
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
                    <h4 style="cursor:pointer;" class="text-success text-center mt-3">Giá hiện tại: ${product.price_current}</h4>
                    <h4 style="cursor:pointer;" class="text-danger text-center mt-3">Giá mua ngay: ${product.price_now}</h4>
                    <input id="price_start" name="price_start" type="hidden" value="${product.price_start}">
                    <input id="step" name="step" type="hidden" value="${product.price_step}">
                    <input id="email" name="email" type="hidden" value="${authUser.email}">
                    <div class="ml-5">
                        <h4>Thông tin người bán</h4>
                        <h4>Thông tin người đặt giá cao nhất</h4>
                        <h4>Thời điểm đăng:
                            <fmt:parseDate value="${product.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                        </h4>
                        <h4>Thời điểm kết thúc:
                            <fmt:parseDate value="${product.end_day}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                        </h4>
                        <h4>Chi tiết sản phẩm</h4>
                        <p class="ml-5">${product.fulldes}</p>

                    </div>

                    <h4 class="ml-5">Mời bạn đặt giá:</h4>
                    <form action="" method="post">
                        <div class="input-group flex-nowrap">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="addon-wrapping">
                                <i class="fa fa-hand-o-right" aria-hidden="true"></i>
                            </span>
                            </div>
                            <input id="price" type="text" name="price" class="form-control min-vh-75" placeholder="Your Price" aria-label="price" aria-describedby="addon-wrapping">
                        </div>


                <div class="card-footer text-muted bg-warning d-flex justify-content-center">

                    <button type="button" id="btn-auction" class="btn btn-primary mr-5" role="button">
                        <i class="fa fa-gavel" aria-hidden="true"></i>
                        Auction now
                    </button>
                    <button class="heart btn btn-danger mr-5" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${product.proid}&proname=${product.proname}&price_start=${product.price_start}&uid=${authUser.id}&catid=${product.catid}')" type="button">
                        <i class="fa fa-heart" aria-hidden="true"></i>
                        Love
                    </button>
                </div>
                    </form>
                    <h4>Lịch sử ra giá</h4>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Thời gian</th>
                            <th scope="col">Người mua</th>
                            <th scope="col">Giá</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        </tbody>
                    </table>
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
                                    <div class="col-lg-3 mb-4 shadow" style="border-radius: 10%" >
                                        <div class="product-top mt-3">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}"><img style="width: 232px;height: 232px; object-fit: contain;" src="${pageContext.request.contextPath}/public/imgs/products/${p.proid}/main.jpg"></a>
                                            <div class="overlay-right">
                                                    <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}" class="btn btn-secondary" title="Detail">
                                                        <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                                    </a>
                                                    <button type="button"   href="${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=${authUser.id}&catid=${p.catid}" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=${authUser.id}')" class="heart btn btn-secondary " title="Add to WatchList">
                                                        <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                                    </button>

                                            </div>
                                        </div>
                                        <div class="product-bottom text-center">
                                            <h3 name="proname" style="width: 232px;height: 75px; object-fit: contain">${p.proname}</h3>
<%--                                            <p name="price_start" style="margin: 0">Start price: ${p.price_start}</p>--%>
<%--                                            <a class="btn btn-success btn-sm" href="#" role="button">--%>
<%--                                                <i class="fa fa-gavel text-light fa-2x" aria-hidden="true"></i>--%>
<%--                                                Auction now--%>
<%--                                            </a>--%>
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

