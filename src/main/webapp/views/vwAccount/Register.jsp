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
            // Validator({
            //     form: '#formRegister',
            //     formGroupSelector: '.form-group',
            //     errorSelector: '.form-message',
            //     rules: [
            //         Validator.isRequired('#registerName', 'Please fill your full name'),
            //         Validator.isRequired('#registerEmail', 'Please fill your mail correctly'),
            //         Validator.isRequired('#registerPassword','Please fill your password'),
            //         Validator.isRequired('#registerDob','Please fill your date of birth'),
            //         Validator.isEmail('#registerEmail','Please fill your mail correctly'),
            //         Validator.minLength('#registerPassword',6),
            //         Validator.isConfirmed('#registerConfirmPassword',function () {
            //             return document.querySelector('#formRegister #registerPassword').value;
            //         }, 'Please fill your password correctly')
            //     ],
            // });

            $('#formRegister').on('submit', function (e) {
                e.preventDefault();
                Validator({
                    form: '#formRegister',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isRequired('#registerName', 'Please fill your full name'),
                        Validator.isRequired('#registerAddress', 'Please fill your address'),
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
                let response = grecaptcha.getResponse();
                const email = $('#registerEmail').val();
                const otp = $('#registerOTP').val();
                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?email=' + email, function (data) {
                    if (data === true) {
                        if(response.length == 0) {
                            alert('Please select the Captcha');
                        } else {
                            $.getJSON('${pageContext.request.contextPath}/Account/SendOTP?email=' + email+'&otp=' +otp, function (otpData) {
                                if (otpData === false) {
                                    alert('Wrong OTP');
                                } else {
                                    $('#formRegister').off('submit').submit();
                                }
                            });
                        }
                    } else {
                        alert('Email is not available.');
                    }
                });
            });

            $('#btnOTP').on('click', function () {
                if ($('#registerEmail').val() == 0)
                {
                    alert('Please fill your email')
                } else {
                    const otp = $('#registerOTP').val();
                    const email = $('#registerEmail').val();
                    $.getJSON('${pageContext.request.contextPath}/Account/SendOTP?email=' + email+'&otp=' +otp, function (data) {
                        if (data === false) {
                            alert('Please send OTP email again.');
                        } else alert('OTP has been send to your email');
                    });
                }
            });

            $('#registerDob').datetimepicker({
                format: 'd/m/Y',
                timepicker: false,
            })

            $('registerName').select();
        </script>
    </jsp:attribute>
    <jsp:body>
        <form class="mx-auto shadow rounded-lg bg-white " action="" method="post" id="formRegister">
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

            <div class="form-group justify-content-center d-flex">
                <input type="text" placeholder="Address" class="form-control w-75" id="registerAddress" name="address">
                <span class="form-message" style="margin-right: 185px;"></span>
            </div>

            <!-- Email và password, OTP -->
            <div class="form-group justify-content-center d-flex">
                <div class="justify-content-center d-flex">
                    <input type="text" placeholder="Email" name="email" class="form-control mr-1 " style="width: 240px" id="registerEmail">
                    <button type="button" name="button" class="btn btn-info p-0" style="width: 80px" id="btnOTP">Send OTP</button>
                </div>
                <span class="form-message" style="margin-right: 215px;"></span>
            </div>
            <div class="form-group justify-content-center d-flex">
                <input type="password" name="rawpwd" placeholder="Password" class="form-control w-75" id="registerPassword">
                <span class="form-message" style="margin-right: 180px;"></span>
            </div>
            <div class="form-group justify-content-center d-flex">
                <input type="password" placeholder="Confirm password" class="form-control w-75" id="registerConfirmPassword">
                <span class="form-message" style="margin-right: 130px;"></span>
            </div>
            <div class="form-group justify-content-center d-flex">
                <input type="text" placeholder="OTP" name="otp" class="form-control w-75" id="registerOTP">
                <span class="form-message" style="margin-right: 215px;"></span>
            </div>

            <!-- reCaptcha -->
            <div class="form-group justify-content-center d-flex">
                <div class="g-recaptcha" data-sitekey="6LfnC1IdAAAAABU-jCMtW_w5y6dbyCbFHm05XZVZ"></div>
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

