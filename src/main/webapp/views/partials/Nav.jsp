<div class="header">
    <!-- Top Nav -->
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <div class="collapse navbar-collapse justify-content-lg-between" id="navbarSupportedContent">
            <img src="${pageContext.request.contextPath}/public/imgs/logo.png" class="img-fluid rounded-top" alt="No Loading" style=" width:140px ;height: 70px">
            <nav class="navbar navbar-light bg-info d-inline">
                <form class="form-inline">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown-toggle-split">
                            <select class="nav-link text-dark bg-light mr-2" style="border: 0; border-radius: 5px;">
                                <option value="Product">Product</option>
                                <option value="Category">Category</option>
                            </select>
                        </li>
                    </ul>
                    <input class="form-control mr-sm-3" type="search" placeholder="Search" aria-label="Search" style="width: 500px">
                    <button class="btn btn-outline-success text-light bg-success my-2 my-sm-0 " type="submit">
                        <i class="fa fa-search"></i>
                        Search
                    </button>
                </form>
            </nav>
            <ul class="navbar-nav">
                <li class="nav-item active mr-4"><a href="${pageContext.request.contextPath}/WatchList" class="text-light">
                    <i class="fa fa-heart text-danger" aria-hidden="true"></i>
                    WatchList
                </a>
                </li>
<%--                <li class="nav-item active mr-4"><a href="" class="text-light"><i class="fa fa-shopping-cart text-warning" aria-hidden="true"></i>--%>
<%--                    Cart--%>
<%--                </a></li>--%>
                <li class="nav-item active mr-4 dropdown">
                    <a href="" class="text-light">
                        <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                        Account
                    </a>
                    <ul class="dropdown-menu mt-0 float-left" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Account/Login">Log In</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Account/Register">Register</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Nav Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light mt-1 ">
        <div class="collapse navbar-collapse justify-content-around" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link mr-5 ml-5 text-success" href="${pageContext.request.contextPath}/Home">
                        <i class="fa fa-home text-success" aria-hidden="true"></i>
                        Home <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mr-5 ml-5 text-danger" href="${pageContext.request.contextPath}/Home#hot">
                        <i class="fa fa-newspaper-o text-danger" aria-hidden="true"></i>
                        Hot
                    </a>
                </li>
                <li class="nav-item mr-5 ml-5">
                    <a class="nav-link text-warning" href="#">
                        <i class="fa fa-history text-warning" aria-hidden="true"></i>
                        History</a>
                </li>
                <li class="nav-item mr-5 ml-5">
                    <a class="nav-link text-info" href="#">
                        <i class="fa fa-info-circle text-info" aria-hidden="true"></i>
                        About</a>
                </li>
                <li class="nav-item mr-5 ml-5">
                    <a class="nav-link" href="#contact">
                        <i class="fa fa-address-card" aria-hidden="true"></i>
                        Contact us</a>
                </li>
            </ul>
        </div>
    </nav>
</div>