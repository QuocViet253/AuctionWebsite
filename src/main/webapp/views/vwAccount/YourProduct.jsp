<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:useBean id="sellingProducts" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="soldProducts" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="biddingProducts" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="winningProducts" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User" />
<t:watchlist>
    <jsp:attribute name="js">
        <script src="https://cdn.tiny.cloud/1/v0ozcj27hfm49t3m4umzfpgom0bhbjjl5xxgin0phrhz3385/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            function pagination (tableSelection, quantityItem, rowSelection,navName ) {
                $(document).ready(function() {
                    $(tableSelection).after('<div id='+navName+' class="text-center"></div>');
                    let itemsShown = quantityItem;
                    let itemsTotal = $(rowSelection).length;
                    let numPages = itemsTotal / itemsShown;
                    for (let i = 0; i < numPages; i++) {
                        let pageNum = i + 1;
                        $('#'+navName+'').append('<a href="#" class="btn-outline-info btn-sm text-decoration-none rounded-lg border border-info" rel="' + i + '">&emsp;' + pageNum + '&emsp;</a> ');
                    }
                    $(rowSelection).hide();
                    $(rowSelection).slice(0, itemsShown).show();
                    $('#'+navName+' a:first').addClass('active');
                    $('#'+navName+' a').bind('click', function(e) {
                        e.preventDefault();
                        $('#'+navName+' a').removeClass('active');
                        $(this).addClass('active');
                        let currPage = $(this).attr('rel');
                        let startItem = currPage * itemsShown;
                        let endItem = startItem + itemsShown;
                        $(rowSelection).css('opacity', '0').hide().slice(startItem, endItem).
                        css('display', 'block').animate({
                            opacity: 1
                        }, 300);
                    });
                });
            }

            pagination ('.t1', 4, '.t1 .col-md-3','nav1' )
            pagination ('.t2', 4, '.t2 .col-md-3','nav2' )
            pagination ('.t3', 4, '.t3 .col-md-3','nav3' )

            tinymce.init({
                selector: '#txtFullDes',
                height: 250,
                plugins: 'paste image link autolink lists table media',
                menubar: false,
                toolbar: [
                    'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor | table link image media'
                ],
            });

            $('#addDes').on('show.bs.modal', function (event) {
                let button = $(event.relatedTarget)
                let id = button.data('id')
                let name = button.data('name')
                let des = button.data('des')
                let modal = $(this)
                modal.find('#proID').val(id)
                modal.find('#txtProname').text('Product name: '+name)
            })

        </script>
    </jsp:attribute>
    <jsp:body>
        <section class="selling">
            <div class="title-box bg-info mt-1 mb-3 w-100 justify-content-center" style="border-radius: 5px;">
                <h2>Your products</h2>
            </div>

            <%--Selling Product--%>
            <div class="container-fluid t1">
                <div class="w-100 mb-1 justify-content-between d-flex border-bottom">
                    <h3 >Selling Products</h3>
                    <c:choose>
                        <c:when test="${authUser.role != 1}">
                            <a id="btnAddPro" class="btn btn-info btn-lg mb-3" href="#" role="button">Add product</a>
                        </c:when>
                    </c:choose>
                </div>
                <div class="row mt-2">
                    <c:choose>
                        <c:when test="${sellingProducts.size()==0}">
                            <div class="card-body">
                                <p class="card-text">No data</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${sellingProducts}" var="p">
                                <div class="col-md-3 mb-4 shadow" style="border-radius: 10%">
                                    <div class="product-top mt-2">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}"><img style="width: 232px;height: 232px; object-fit: contain;" src="${pageContext.request.contextPath}/public/imgs/products/${p.proid}/main.jpg"></a>
                                        <div class="overlay-right">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proid}&catid=${p.catid}" class="btn btn-secondary" title="Detail">
                                                <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                            </a>
                                            <button type="button"  onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p.proid}&proname=${p.proname}&price_start=${p.price_start}&uid=${authUser.id}')" class="heart btn btn-secondary " title="Add to WatchList">
                                                <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                            </button>
                                            <button type="button" class="btn btn-secondary" title="Add Description" data-toggle="modal" data-target="#addDes" data-id="${p.proid}" data-name = "${p.proname}">
                                                <i class="fa fa-pencil" aria-hidden="true" style="border-radius: 50%"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="product-bottom text-center">
                                        <h3 name="proname" style="width: 250px;height: 75px; object-fit: contain">${p.proname}</h3>
                                        <h5 style="margin: 0">Giá hiện tại: ${p.price_current}</h5>
                                        <h5>Giá mua ngay: ${p.price_now}</h5>
                                        <h5>Ngày đăng:
                                            <fmt:parseDate value="${p.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                        </h5>
                                        <h5>Kết thúc:
                                            <fmt:parseDate value="${p.end_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                        </h5>
                                        <h5>Số lượt ra giá</h5>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="modal fade" id="addDes" tabindex="-1" aria-labelledby="addDesLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addDesLabel">Add Description</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form method="post" action="${pageContext.request.contextPath}/Account/EditDes">
                                        <div class="modal-body">
                                                <input type="hidden" name="uid" value="${authUser.id}">
                                                <input type="hidden" id="proID" name="proid">
                                                <div class="form-group">
                                                    <b class="text-info"><label id="txtProname" class="col-form-label"></label></b>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtModifyDate" class="col-form-label">Modify Date:</label>
                                                    <input type="text" readonly value="<fmt:formatDate value="${now}" pattern="dd/MM/yyyy hh:mm:ss"/>" name="date" class="form-control" id="txtModifyDate">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtFullDes" class="col-form-label">Full Description:</label>
                                                    <textarea class="form-control" name="fulldes" id="txtFullDes"></textarea>
                                                </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                <i class="fa fa-times" aria-hidden="true"></i> Close</button>
                                            <button type="submit" class="btn btn-info">
                                                <i class="fa fa-check" aria-hidden="true"></i> Save</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <%--Sold Product--%>
            <div class="container-fluid t2">
                <div class="w-100 mb-1 border-bottom">
                    <h3>Sold Products</h3>
                </div>
                <div class="row mt-2">
                    <c:choose>
                        <c:when test="${soldProducts.size()==0}">
                            <div class="card-body">
                                <p class="card-text">No data</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${soldProducts}" var="p3">
                                <div class="col-md-3 mb-4 shadow" style="border-radius: 10%">
                                    <div class="product-top mt-2">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p3.proid}&catid=${p3.catid}"><img style="width: 232px;height: 232px; object-fit: contain;" src="${pageContext.request.contextPath}/public/imgs/products/${p3.proid}/main.jpg"></a>
                                        <div class="overlay-right">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p3.proid}&catid=${p3.catid}" class="btn btn-secondary" title="Detail">
                                                <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                            </a>
                                            <button type="button"  onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p3.proid}&proname=${p3.proname}&price_start=${p3.price_start}&uid=${authUser.id}')" class="heart btn btn-secondary " title="Add to WatchList">
                                                <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                            </button>

                                        </div>
                                    </div>
                                    <div class="product-bottom text-center">
                                        <h3 style="width: 250px;height: 75px; object-fit: contain">${p3.proname}</h3>
                                        <h5 style="margin: 0">Giá hiện tại: ${p3.price_current}</h5>
                                        <h5>Giá mua ngay: ${p3.price_now}</h5>
                                        <h5>Ngày đăng:
                                            <fmt:parseDate value="${p3.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                        </h5>
                                        <h5>Kết thúc:
                                            <fmt:parseDate value="${p3.end_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                        </h5>
                                        <h5>Số lượt ra giá</h5>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <%--Bidding Product--%>
            <div class="container-fluid t3">
                <div class="w-100 mb-1 border-bottom">
                    <h3>Bidding Products</h3>
                </div>
                <div class="row mt-2">
                    <c:choose>
                        <c:when test="${biddingProducts.size()==0}">
                            <div class="card-body">
                                <p class="card-text">No data</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${biddingProducts}" var="p3">
                                <div class="col-md-3 mb-4 shadow" style="border-radius: 10%">
                                    <div class="product-top mt-2">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p3.proid}&catid=${p3.catid}"><img style="width: 232px;height: 232px; object-fit: contain;" src="${pageContext.request.contextPath}/public/imgs/products/${p3.proid}/main.jpg"></a>
                                        <div class="overlay-right">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p3.proid}&catid=${p3.catid}" class="btn btn-secondary" title="Detail">
                                                <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                            </a>
                                            <button type="button"  onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p3.proid}&proname=${p3.proname}&price_start=${p3.price_start}&uid=${authUser.id}')" class="heart btn btn-secondary " title="Add to WatchList">
                                                <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                            </button>

                                        </div>
                                    </div>
                                    <div class="product-bottom text-center">
                                        <h3 style="width: 250px;height: 75px; object-fit: contain">${p3.proname}</h3>
                                        <h5 style="margin: 0">Giá hiện tại: ${p3.price_current}</h5>
                                        <h5>Giá mua ngay: ${p3.price_now}</h5>
                                        <h5>Ngày đăng:
                                            <fmt:parseDate value="${p3.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                        </h5>
                                        <h5>Kết thúc:
                                            <fmt:parseDate value="${p3.end_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                        </h5>
                                        <h5>Số lượt ra giá</h5>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <%--Winning Product--%>
            <div class="container-fluid t4">
                <div class="w-100 mb-1 border-bottom">
                    <h3>Winning Products</h3>
                </div>
                <div class="row mt-2">
                    <c:choose>
                        <c:when test="${winningProducts.size()==0}">
                            <div class="card-body">
                                <p class="card-text">No data</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${winningProducts}" var="p4">
                                <div class="col-md-3 mb-4 shadow" style="border-radius: 10%">
                                    <div class="product-top mt-2">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p4.proid}&catid=${p4.catid}"><img style="width: 232px;height: 232px; object-fit: contain;" src="${pageContext.request.contextPath}/public/imgs/products/${p4.proid}/main.jpg"></a>
                                        <div class="overlay-right">
                                            <a href="${pageContext.request.contextPath}/Product/Detail?id=${p4.proid}&catid=${p4.catid}" class="btn btn-secondary" title="Detail">
                                                <i class="fa fa-eye" style="border-radius: 50%" aria-hidden="true"></i>
                                            </a>
                                            <button type="button"  onclick="add('${pageContext.request.contextPath}/Product/AddWatchList?proid=${p4.proid}&proname=${p4.proname}&price_start=${p4.price_start}&uid=${authUser.id}')" class="heart btn btn-secondary " title="Add to WatchList">
                                                <i class="fa fa-heart-o" style="border-radius: 50%"></i>
                                            </button>

                                        </div>
                                    </div>
                                    <div class="product-bottom text-center">
                                        <h3 style="width: 250px;height: 75px; object-fit: contain">${p4.proname}</h3>
                                        <h5 style="margin: 0">Giá hiện tại: ${p4.price_current}</h5>
                                        <h5>Giá mua ngay: ${p4.price_now}</h5>
                                        <h5>Ngày đăng:
                                            <fmt:parseDate value="${p4.start_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                        </h5>
                                        <h5>Kết thúc:
                                            <fmt:parseDate value="${p4.end_day }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${ parsedDateTime }" />
                                        </h5>
                                        <h5>Số lượt ra giá</h5>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>
    </jsp:body>
</t:watchlist>