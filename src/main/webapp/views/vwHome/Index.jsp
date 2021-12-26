<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="products1" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="products2" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="products3" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<t:main>
    <jsp:attribute name="js">
        <script>
            //Return to login if guest click add to watchlist
            window.onload=()=>{
                if(!${auth})
                    $('.heart').attr("onclick","location.href='${pageContext.request.contextPath}/Account/Login'")
            }

            // Scroll to top of page
            window.addEventListener("scroll", function () {
                let scroll = document.querySelector('.scrollTop');
                scroll.classList.toggle('active',window.scrollY > 250);
                // let nav = document.querySelector('.nav-fix');
                // nav.classList.toggle('active',window.scrollY > 80);
            });

            //Add to watchlist
            function add (otp){
                {
                    $.getJSON(otp, function (data) {
                        if (data === false) {
                            swal({
                                title: "Failed!",
                                text: "Failed added to your watchlist!",
                                icon: "error",
                                button: "OK!",
                                dangerMode: true,
                                closeOnClickOutside: false,
                            });
                        } else swal({
                            title: "Successfully!",
                            text: "Successfully added to your watchlist!",
                            icon: "success",
                            button: "OK!",
                            closeOnClickOutside: false,
                        });
                    });
                }
            }
            //Countdown timer in product
            $(function(){
                $('[data-countdown]').each(function() {
                    let $this = $(this), finalDate = $(this).data('countdown');
                    $this.countdown(finalDate, function(event) {
                        $this.html(event.strftime('%D days %H:%M:%S'))}).on('finish.countdown', function() {
                        $this.text('EXPIRED');
                    });
                });
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="right col-sm-10 mt-1 bg-white">
            <a name ="top" ></a>
            <a href="#top"><i class="fa fa-arrow-up fa-2x scrollTop" aria-hidden="true"></i></a>
            <section class="on-sale">
                <div class="container-fluid">
                    <div class="title-box bg-danger mt-1 w-100 justify-content-center" style="border-radius: 5px;">
                        <h2 style="cursor: pointer; font-family: 'Bauhaus 93'">Top Expired</h2>
                    </div>
                    <div class="row">
                            <c:forEach items="${products1}" var="p1">
                                <div class="col-md-3 mt-3" data-aos="zoom-in" data-aos-duration="1000" >
                                    <div class="product-top mt-3 text-center">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p1.proid}&catid=${p1.catid}"><img src="${pageContext.request.contextPath}/public/imgs/products/${p1.proid}/main.jpg" style="width: 232px;height: 232px; object-fit: contain;"></a>
                                        <div class="overlay-right">
                                                <a href="${pageContext.request.contextPath}/Product/Detail?id=${p1.proid}&catid=${p1.catid}" type="button" class="btn btn-secondary" title="Detail">
                                                    <i class="fa fa-eye" aria-hidden="true" style="border-radius: 50%"></i>
                                                </a>
                                                    <button type="button" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p1.proid}&proname=${p1.proname}&price_start=${p1.price_start}&uid=${authUser.id}&catid=${p1.catid}')" class="heart btn btn-secondary" title="Add to WatchList">
                                                        <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                                    </button>
                                        </div>
                                    </div>
                                        <div class="product-bottom text-center" >
                                            <h3 class="mx-auto mt-4" style="width: 250px;height: 75px; object-fit: contain;">${p1.proname}</h3>
                                            <h5><b>Price Current:</b>
                                                <span class="text-danger font-weight-bold" style="font-size: 30px">$<fmt:formatNumber value="${p1.price_current}" type="number" /></span>
                                            </h5>
                                            <c:if test="${p1.price_now!=0}">
                                                <h5> <b>Price Buy Now:</b>
                                                    <span class="text-primary" style="font-size: larger">$<fmt:formatNumber value="${p1.price_now}" type="number"/></span>
                                                </h5>
                                            </c:if>
                                            <h5><b>Start Date</b> :
                                                <fmt:parseDate value="${p1.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                                <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                            </h5>
                                            <h5><b>  End Date:</b>
                                                <fmt:parseDate value="${p1.end_day}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="end" type="both" />
                                                <span class="text-success" data-countdown="<fmt:formatDate pattern="MM/dd/yyyy HH:mm:ss" value="${end }" />"></span>
                                            </h5>
                                            <h5><b>Sum of bids:</b> ${p1.bid_count}</h5>
                                            <h5><b>Highest bidder: </b>
                                                <c:choose>
                                                    <c:when test="${empty p1.name}">
                                                        Nobody bidding.
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-danger">${p1.name}</span></h5>
                                                    </c:otherwise>
                                                </c:choose>
                                        </div>
                                    </div>
                                </c:forEach>
                    </div>
                    <div class="title-box bg-danger mt-3 w-100 justify-content-center" style="border-radius: 5px;">
                        <h2 style="cursor: pointer; font-family: 'Bauhaus 93'">Top Price</h2>
                    </div>
                    <div class="row">
                        <c:forEach items="${products2}" var="p2">
                            <div class="col-md-3 mt-3" data-aos="fade-up" data-aos-duration="1000" >
                                <div class="product-top mt-3 text-center">
                                    <a href="${pageContext.request.contextPath}/Product/Detail?id=${p2.proid}&catid=${p2.catid}"><img src="${pageContext.request.contextPath}/public/imgs/products/${p2.proid}/main.jpg" style="width: 232px;height: 232px; object-fit: contain;"></a>
                                    <div class="overlay-right">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p2.proid}&catid=${p2.catid}" type="button" class="btn btn-secondary" title="Detail">
                                            <i class="fa fa-eye" aria-hidden="true" style="border-radius: 50%"></i>
                                        </a>
                                        <button  type="button" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p2.proid}&proname=${p2.proname}&price_start=${p2.price_start}&uid=${authUser.id}&catid=${p2.catid}')" class=" heart btn btn-secondary" title="Add to WatchList">
                                            <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="product-bottom text-center">
                                    <h3 class="mx-auto mt-4" style="width: 250px;height: 75px; object-fit: contain">${p2.proname}</h3>
                                    <h5><b>Price Current:</b>
                                        <span class="text-danger font-weight-bold" style="font-size: 30px">$<fmt:formatNumber value="${p2.price_current}" type="number" /></span>
                                    </h5>
                                    <c:if test="${p2.price_now!=0}">
                                        <h5> <b>Price Buy Now:</b>
                                            <span class="text-primary" style="font-size: larger">$<fmt:formatNumber value="${p2.price_now}" type="number"/></span>
                                        </h5>
                                    </c:if>
                                    <h5><b>Start Date</b> :
                                        <fmt:parseDate value="${p2.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                        <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                    </h5>
                                    <h5><b>  End Date:</b>
                                        <fmt:parseDate value="${p2.end_day}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="end" type="both" />
                                        <span class="text-success" data-countdown="<fmt:formatDate pattern="MM/dd/yyyy HH:mm:ss" value="${end }" />"></span>
                                    </h5>
                                    <h5><b>Sum of bids:</b> ${p2.bid_count}</h5>
                                    <h5><b>Highest bidder: </b>
                                        <c:choose>
                                        <c:when test="${empty p2.name}">
                                            Nobody bidding.
                                        </c:when>
                                        <c:otherwise>
                                        <span class="text-danger">${p2.name}</span></h5>
                                    </c:otherwise>
                                    </c:choose>
                                    </h5>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="title-box bg-danger mt-3 w-100 justify-content-center" style="border-radius: 5px;">
                        <a name="hot"></a>
                        <h2 style="cursor: pointer;font-family: 'Bauhaus 93'">Top Bidding</h2>
                    </div>
                    <div class="row">
                        <c:forEach items="${products3}" var="p3">
                            <div class="col-md-3 mt-3" data-aos="fade-left" data-aos-duration="1500" >
                                <div class="product-top mt-3 text-center">
                                    <a href="${pageContext.request.contextPath}/Product/Detail?id=${p3.proid}&catid=${p3.catid}"><img src="${pageContext.request.contextPath}/public/imgs/products/${p3.proid}/main.jpg" style="width: 232px;height: 232px; object-fit: contain;"></a>
                                    <div class="overlay-right">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p3.proid}&catid=${p3.catid}" type="button" class="btn btn-secondary" title="Detail">
                                            <i class="fa fa-eye" aria-hidden="true" style="border-radius: 50%"></i>
                                        </a>
                                        <button  type="button" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p3.proid}&proname=${p3.proname}&price_start=${p3.price_start}&uid=${authUser.id}&catid=${p3.catid}')" class=" heart btn btn-secondary" title="Add to WatchList">
                                            <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="product-bottom text-center">
                                    <h3 class="mx-auto mt-4" style="width: 250px;height: 75px; object-fit: contain">${p3.proname}</h3>
                                    <h5><b>Price Current:</b>
                                        <span class="text-danger font-weight-bold" style="font-size: 30px">$<fmt:formatNumber value="${p3.price_current}" type="number" /></span>
                                    </h5>
                                    <c:if test="${p3.price_now!=0}">
                                        <h5> <b>Price Buy Now:</b>
                                            <span class="text-primary" style="font-size: larger">$<fmt:formatNumber value="${p3.price_now}" type="number"/></span>
                                        </h5>
                                    </c:if>
                                    <h5><b>Start Date</b> :
                                        <fmt:parseDate value="${p3.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                        <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                    </h5>
                                    <h5><b>  End Date:</b>
                                        <fmt:parseDate value="${p3.end_day}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="end" type="both" />
                                        <span class="text-success" data-countdown="<fmt:formatDate pattern="MM/dd/yyyy HH:mm:ss" value="${end }" />"></span>
                                    </h5>
                                    <h5><b>Sum of bids:</b> ${p3.count}</h5>
                                    <h5><b>Highest bidder: </b>
                                        <c:choose>
                                        <c:when test="${empty p3.name}">
                                            Nobody bidding.
                                        </c:when>
                                        <c:otherwise>
                                        <span class="text-danger">${p3.name}</span></h5>
                                    </c:otherwise>
                                    </c:choose>
                                    </h5>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>
    </jsp:body>
</t:main>
