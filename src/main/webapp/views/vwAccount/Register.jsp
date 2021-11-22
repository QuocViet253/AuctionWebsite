<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:account>
    <jsp:attribute name="css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            //Register form
            Validator({
                form: '#formRegister',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#registerName', 'Please fill your full name'),
                    Validator.isRequired('#registerEmail', 'Please fill your mail correctly'),
                    Validator.isRequired('#registerPassword','Please fill your password'),
                    Validator.isRequired('#registerDob','Please fill your date of birth'),
                    Validator.isEmail('#registerEmail','Please fill your mail correctly'),
                    Validator.minLength('#registerPassword',6),
                    Validator.isConfirmed('#registerConfirmPassword',function () {
                        return document.querySelector('#formRegister #registerPassword').value;
                    }, 'Please fill your password correctly')
                ],
            });
            $('#registerDob').datetimepicker({
                format: 'd/m/Y',
                timepicker: false,
            })
        </script>
    </jsp:attribute>
    <jsp:body>
        <form class=" mx-auto shadow rounded-lg bg-white " id="formRegister">
            <!-- Logo -->
            <div class="text-center mb-3">
                <h3 class="text-info">Register</h3>
            </div>

            <!-- Họ và tên va dob -->
            <div class="form-group justify-content-center d-flex">
            <input type="text" placeholder="Full name" class="form-control w-75" id="registerName" name="name">
            <span class="form-message" style="margin-right: 185px;"></span>
            </div>
            <div class="form-group justify-content-center d-flex">
                <input type="text" name="dob" placeholder="Date of birth (dd/mm/yyyy)" class="form-control w-75" id="registerDob">
                <span class="form-message" style="margin-right: 160px;"></span>
            </div>

            <!-- Email và password -->
            <div class="form-group justify-content-center d-flex">
            <input type="text" name="email" placeholder="Email" class="form-control w-75" id="registerEmail" aria-describedby="emailHelp">
            <span class="form-message" style="margin-right: 155px;"></span>
            </div>
            <div class="form-group justify-content-center d-flex">
                <input type="password" name="rawpwd" placeholder="Password" class="form-control w-75" id="registerPassword">
                <span class="form-message" style="margin-right: 180px;"></span>
            </div>
            <div class="form-group justify-content-center d-flex">
                <input type="password" placeholder="Confirm password" class="form-control w-75" id="registerConfirmPassword">
                <span class="form-message" style="margin-right: 130px;"></span>
            </div>
            <!-- Button đăng ký -->
            <div class="text-center">
                <button type="submit" class="btn btn-info w-75" id="btnRegister">Register</button>
            </div>

            <hr class="w-75 mx-auto bg-info">
            <!-- Đăng ký với Google -->
            <div class="text-center">
                <a class="btn btn-outline-info" href="#" role="button">
                    <i class="fa fa-google-plus mr-3" aria-hidden="true"></i>
                    Register with Google
                </a>
            </div>
            <div class="text-center mt-3">
                You already have an account?
                <a class="btn btn-outline-info" id="switchLogin"  href="${pageContext.request.contextPath}/Account/Login" role="button">
                    Login now
                </a>
            </div>
        </form>
    </jsp:body>
</t:account>

