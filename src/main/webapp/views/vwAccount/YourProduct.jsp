<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.auctionwebapp.beans.Product>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.auctionwebapp.beans.User" />
<t:watchlist>
    <jsp:attribute name="js">
        <script>
            function pagination (tableSelection, quantityItem, rowSelection,navName ) {
                $(document).ready(function() {
                    $(tableSelection).after('<div id='+navName+' class="text-center"></div>');
                    let itemsShown = quantityItem;
                    let itemsTotal = $(rowSelection).length;
                    let numPages = itemsTotal / itemsShown;
                    for (i = 0; i < numPages; i++) {
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

        </script>
    </jsp:attribute>
    <jsp:body>
        <section class="selling">
            <div class="title-box bg-info mt-1 w-100 justify-content-center" style="border-radius: 5px;">
                <h2>Your products</h2>
            </div>
                    <c:choose>
                        <c:when test="${authUser.role != 1}">
                            <div class="container-fluid t1">
                                <div class="w-100 mb-1 justify-content-between d-flex border-bottom">
                                    <h3>Selling</h3>
                                    <a class="btn btn-primary mb-1" href="#" role="button">Add product</a>
                                </div>
                                <div class="row mt-2">

                                </div>
                            </div>
                        </c:when>
                    </c:choose>
        </section>
    </jsp:body>
</t:watchlist>