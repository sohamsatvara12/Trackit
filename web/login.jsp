<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Login-Register</title>

        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    </head>

    <body style="background: white;">


        <%@include file="component/msg.jsp" %>
        <%@include file="component/header.jsp" %>




        <section class="login" id="login" style="padding: 0rem 0%;">
            <div class="account-container">
                <div class="forms-container">
                    <div class="signin-signup">

                        <form action="LoginServlet" method="post" class="sign-in-form" onsubmit="return validateLoginForm()" name="signinForm">


                            <h2 class="title">Sign in</h2>

                            <div class="input-field">
                                <i class="fas fa-user"></i>
                                <input type="text" placeholder="Username" name="username" style="text-transform:none;" />
                            </div>
                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <input type="password" placeholder="Password" name="password" />
                            </div>
                            <input type="submit" value="Login" class="account-btn solid" name="login" />
                            <p class="social-text">forgot your password?<a href="#"  style="color:#DA70D6;">Click Here.</a></p>
                            <p class="social-text">Or Sign in with social platforms</p>

                            <div class="social-media">
                                <a href="#" class="social-icon">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                                <a href="#" class="social-icon">
                                    <i class="fab fa-twitter"></i>
                                </a>
                                <a href="#" class="social-icon">
                                    <i class="fab fa-google"></i>
                                </a>
                                <a href="#" class="social-icon">
                                    <i class="fab fa-linkedin-in"></i>
                                </a>
                            </div>
                            <br>

                        </form>

                        <!-- Javascript Validation for Login implemented in app.js -->
                        
                        <form action="LoginServlet" method="post" class="sign-up-form" style="text-transform:none;margin-bottom: 5rem;" name="signupForm" onsubmit="return validateForm()">

                            <h2 class=" title" style="margin-top: 12rem;">Sign up</h2>
                            <div class="input-field">
                                <i class="fas fa-user"></i>
                                <input type="text" placeholder="Your Name" name="name" />
                            </div>
                            <div class="input-field">
                                <i class="fas fa-envelope"></i>
                                <input type="email" placeholder="Email" name="email" style=" text-transform:none;" />
                            </div>
                            <div class="input-field">
                                <i class="fas fa-user"></i>
                                <input type="text" placeholder="Username" name="username" style=" text-transform:none; " />
                            </div>

                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <input type="password" placeholder="Password" name="password" style=" text-transform:none;" />
                            </div>
                            <div class="input-field">
                                <i class="fas fa-lock"></i>
                                <input type="password" placeholder="Confirm Password" name="confirmPassword" style=" text-transform:none;" />
                            </div>
                            <input type="submit" class="account-btn" value="Sign up" name="signup" />
                            <p class="social-text">Or Sign up with social platforms</p>
                            <div class="social-media">
                                <a href="#" class="social-icon">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                                <a href="#" class="social-icon">
                                    <i class="fab fa-twitter"></i>
                                </a>
                                <a href="#" class="social-icon">
                                    <i class="fab fa-google"></i>
                                </a>
                                <a href="#" class="social-icon">
                                    <i class="fab fa-linkedin-in"></i>
                                </a>
                            </div>
                            <br>
                        </form>
                    </div>
                </div>

                <!-- Javascript validation for Sign up impemented in app.js-->

                <div class="panels-container">
                    <div class="panel left-panel">
                        <div class="content">
                            <h3 style="margin-top: 2rem;">New here ?</h3>

                            <button class="btn transparent" id="sign-up-btn" style="border: 2px solid #fff;color:#fff;">
                                Sign up
                            </button>
                        </div>

                        <img src="css/loginimg/log.svg" class="image" alt="" />
                    </div>
                    <div class="panel right-panel">
                        <div class="content">
                            <h3 style="margin-top: 3rem;">One of us ?</h3>

                            <button class="btn transparent" id="sign-in-btn" style="color:white;">
                                Sign in
                            </button>
                        </div>


                        <img src=" css/loginimg/register.svg" class="image" alt="" />
                    </div>
                </div>
            </div>
        </section>
        <script src="js/app.js"></script>

        <!-- Footer Section -->
        <%@include file="component/footer.html" %>

        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

    </body>
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    
</html>

