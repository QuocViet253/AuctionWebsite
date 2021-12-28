<%--
  Created by IntelliJ IDEA.
  User: Tri
  Date: 12/6/2021
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User" />
<t:main>
    <jsp:attribute name="js">
        <script>
            $(document).ready(function() {
                $('.t1').after('<div id="nav" class="text-center"></div>');
                let itemsShown = 8;
                let itemsTotal = $('.t1 .col-md-3').length;
                let numPages = itemsTotal / itemsShown;
                for (let i = 0; i < numPages; i++) {
                    let pageNum = i + 1;
                    $('#nav').append('<a href="#" class="btn-outline-warning btn-sm text-decoration-none rounded-lg border border-warning" rel="' + i + '">&emsp;' + pageNum + '&emsp;</a> ');
                }
                $('.t1 .col-md-3').hide();
                $('.t1 .col-md-3').slice(0, itemsShown).show();
                $('#nav a:first').addClass('active');
                $('#nav a').bind('click', function(e) {
                    e.preventDefault();
                    $('#nav a').removeClass('active');
                    $(this).addClass('active');
                    let currPage = $(this).attr('rel');
                    let startItem = currPage * itemsShown;
                    let endItem = startItem + itemsShown;
                    $('.t1 .col-md-3').css('opacity', '0').hide().slice(startItem, endItem).
                    css('display', 'block').animate({
                        opacity: 1
                    }, 300);
                });
            });
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
            window.onload = function () {
                var url_string = window.location.href; //window.location.href
                var url = new URL(url_string);
                var c = url.searchParams.get("search");
                $('#resSearch').text(c)
                $('#search').val(c)
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="right col-sm-10 mt-1" >
            <div class="d-flex justify-content-between align-items-center ">
                <div>
                    <h5 class="mt-4 ml-2">Result for search: <span class="text-primary" id="resSearch"></span> </h5>
                </div>
                <div class="dropdown mt-1 " style="width: 91px">
                    <a class="btn btn-outline-secondary font-weight-bold dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-filter" aria-hidden="true"></i>
                        Sort
                    </a>
                    <div class="dropdown-menu dropdown-menu-right mt-0 " aria-labelledby="dropdownMenuLink">
                        <button class="dropdown-item" onclick="SortInc('${pageContext.request.contextPath}')">
                            <i class="fa fa-arrow-up" aria-hidden="true"></i>
                            Price Increase
                        </button>
                        <button class="dropdown-item" onclick="SortDecPrice('${pageContext.request.contextPath}')">
                            <i class="fa fa-arrow-down" aria-hidden="true"></i>
                            Price Decrease
                        </button>
                        <button class="dropdown-item" onclick="SortIncTime('${pageContext.request.contextPath}')">
                            <i class="fa fa-arrow-up" aria-hidden="true"></i>
                            Time Increase
                        </button>
                        <button class="dropdown-item" onclick="SortDec('${pageContext.request.contextPath}')">
                            <i class="fa fa-arrow-down" aria-hidden="true"></i>
                            Time Decrease
                        </button>

                    </div>
                </div>
            </div>
                <div class="container-fluid t1">
                    <div class="row">
                        <c:choose>
                            <c:when test="${products.size()==0}">
                                <div class="card-body">
                                    <p class="card-text">No data</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${products}" var="p">
                                    <div class="col-md-3 mb-4 mt-3">
                                        <div class="product-top mt-3 text-center">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}"><img style="width: 232px;height: 232px; object-fit: contain;" src="${pageContext.request.contextPath}/public/imgs/products/${p.proid}/main.jpg"></a>
                                            <div class="overlay-right">
                                                <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}" class="btn btn-secondary" title="Detail">
                                                    <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                                </a>
                                                <button type="button" onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=${authUser.id}&catid=${p.catid}')" class="heart btn btn-secondary " title="Add to WatchList">
                                                    <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                                </button>
                                            </div>
                                            <div class="d-none">
                                                <fmt:parseDate value="${p.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="start" type="both" />
                                                <fmt:formatDate type="time" value="${start}"/>
                                            </div>
                                            <fmt:parseNumber type="number" pattern="##" var="date" value="${((now.time - start.time) / (1000*60*60*24)) }" integerOnly="true" />
                                            <c:if test="${date <1}">
                                                <c:if test="${(((now.time - start.time) % (1000 * 60 * 60))/ (1000 * 60)) <30}">
                                                    <span class="new-title"></span>
                                                </c:if>
                                            </c:if>
                                        </div>
                                        <div class="product-bottom text-center">
                                            <h3 class="mx-auto mt-4" style="width: 250px;height: 75px; object-fit: contain">${p.proname}</h3>
                                            <h5><b>Price Current:</b>
                                                <span class="text-danger font-weight-bold" style="font-size: 30px">$<fmt:formatNumber value="${p.price_current}" type="number" /></span>
                                            </h5>
                                            <c:if test="${p.price_now!=0}">
                                                <h5> <b>Price Buy Now:</b>
                                                    <span class="text-primary" style="font-size: larger">$<fmt:formatNumber value="${p.price_now}" type="number"/></span>
                                                </h5>
                                            </c:if>
                                            <h5><b>Start Date</b> :
                                                <fmt:parseDate value="${p.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                                <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                            </h5>
                                            <h5><b>  End Date:</b>
                                                <fmt:parseDate value="${p.end_day}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="end" type="both" />
                                                <span class="text-success" data-countdown="<fmt:formatDate pattern="MM/dd/yyyy HH:mm:ss" value="${end }" />"></span>
                                            </h5>
                                            <h5><b>Sum of bids:</b> ${p.bid_count}</h5>
                                            <h5><b>Highest bidder: </b>
                                                <c:choose>
                                                <c:when test="${empty p.name}">
                                                    Nobody bidding.
                                                </c:when>
                                                <c:otherwise>
                                                <span class="text-danger">
                                                <c:set var="nameParts" value="${fn:split(p.name, ' ')}"/>
                                                <c:choose>
                                                    <c:when test="${nameParts[0].length() <=3}">
                                                        *****${nameParts[0].substring(1)}***
                                                    </c:when>
                                                    <c:when test="${nameParts[0].length() >5}">
                                                        ***${nameParts[0].substring(0,1)}*${nameParts[0].substring(3,4)}x${nameParts[0].substring(5)}*
                                                    </c:when>
                                                    <c:otherwise>
                                                        ***${nameParts[0].substring(0,2)}*${nameParts[0].substring(3,4)}***
                                                    </c:otherwise>
                                                </c:choose>
                                                </span></h5>
                                            </c:otherwise>
                                            </c:choose>
                                            </h5>
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
