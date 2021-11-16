<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<%--&lt;%&ndash;<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.ute.ecwebapp.beans.Category>"/>&ndash;%&gt;--%>

<%--<div class="card">--%>
<%--  <h4 class="card-header">--%>
<%--    Categories--%>
<%--  </h4>--%>
<%--  <div class="list-group list-group-flush">--%>
<%--    <c:forEach items="${categoriesWithDetails}" var="c">--%>
<%--      <a href="${pageContext.request.contextPath}/Product/ByCat?id=${c.catID}" class="list-group-item list-group-item-action">--%>
<%--        <i class="fa fa-caret-right" aria-hidden="true"></i>--%>
<%--        ${c.catName}--%>
<%--      </a>--%>
<%--    </c:forEach>--%>
<%--    &lt;%&ndash;<a href="#" class="list-group-item list-group-item-action active" aria-current="true">&ndash;%&gt;--%>
<%--    &lt;%&ndash;  The current link item&ndash;%&gt;--%>
<%--    &lt;%&ndash;</a>&ndash;%&gt;--%>
<%--  </div>--%>
<%--</div>--%>

<%--<div class="card mt-3">--%>
<%--  <h4 class="card-header">--%>
<%--    Featured--%>
<%--  </h4>--%>
<%--  <div class="list-group list-group-flush">--%>
<%--    <a href="#" class="list-group-item list-group-item-action active" aria-current="true">--%>
<%--      The current link item (edited)--%>
<%--    </a>--%>
<%--    <a href="#" class="list-group-item list-group-item-action">A second link item</a>--%>
<%--    <a href="#" class="list-group-item list-group-item-action">A third link item</a>--%>
<%--    <a href="#" class="list-group-item list-group-item-action">A fourth link item</a>--%>
<%--    <a href="#" class="list-group-item list-group-item-action disabled" tabindex="-1" aria-disabled="true">A disabled link item</a>--%>
<%--  </div>--%>
<%--</div>--%>

    <div class="side-menu" id="side-menu">
        <ul>
            <li>On sale <i class="fa fa-angle-right"></i>
                <ul>
                    <li>Sub Menu-1</li>
                    <li>Sub Menu-1</li>
                    <li>Sub Menu-1</li>
                    <li>Sub Menu-1</li>
                </ul>
            </li>

            <li>Mobiles<i class="fa fa-angle-right"></i>
                <ul>
                    <li>Sub Menu-2</li>
                    <li>Sub Menu-2</li>
                    <li>Sub Menu-2</li>
                    <li>Sub Menu-2</li>
                </ul>
            </li>

            <li>Computers <i class="fa fa-angle-right"></i>
                <ul>
                    <li>Sub Menu-3</li>
                    <li>Sub Menu-3</li>
                    <li>Sub Menu-3</li>
                    <li>Sub Menu-3</li>
                </ul>
            </li>
        </ul>
    </div>