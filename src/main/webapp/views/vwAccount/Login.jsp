<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:account>
    <jsp:attribute name="js">
        <script>
            // Log in form
            Validator({
                form: '#formLogin',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#loginName', 'Please fill your mail'),
                    Validator.isRequired('#loginPassword','Please fill your password'),
                ],
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <form class=" mx-auto shadow rounded-lg bg-white " id="formLogin">
            <!-- Logo -->
            <div class="text-center mb-3">
                <h3>Login</h3>
            </div>

            <!-- Email và password -->
            <div class="form-group justify-content-center d-flex">
            <input type="text" placeholder="Email" class="form-control w-75" id="loginName" aria-describedby="emailHelp">
            <span class="form-message" style="margin-right: 215px;"></span>
            </div>
            <div class="form-group justify-content-center d-flex">
                <input type="password" placeholder="Password" class="form-control w-75" id="loginPassword">
                <span class="form-message" style="margin-right: 185px;"></span>
            </div>
            <!-- Button đăng nhập -->
            <div class="text-center">
                <button type="submit" class="btn btn-info w-75" id="btnLogIn">Login</button>
            </div>
            <div class="text-center mt-2">
                <a class="text-info" href="#">
                    Forgot password?
                </a>
            </div>

            <hr class="w-75 mx-auto bg-info">
            <!-- Đăng nhập với Google -->
            <div class="text-center">
                <a class="btn btn-outline-info" href="#" role="button">
                    <i class="fa fa-google-plus mr-3" aria-hidden="true"></i>
                    Login with Google
                </a>
            </div>
            <div class="text-center mt-3">
                Don't have an account?
                <a class="btn btn-outline-info" id="switchRegister" href="${pageContext.request.contextPath}/Account/Register" role="button">
                    Register now
                </a>
            </div>
        </form>
    </jsp:body>
</t:account>
