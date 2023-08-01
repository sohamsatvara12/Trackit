

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About us</title>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/team.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        


        <link rel="stylesheet" href="css/swiper-bundle.min.css">
    </head>

    <body>

        <%@include file="component/header.jsp" %>

        <section class="team" id="team" style="margin-top: 7.5rem;">

            <h1 class="heading" >Our<span>Team</span></h1>

            <div class="slide-container swiper">
                <div class="slide-content">
                    <div class="card-wrapper swiper-wrapper">


                        <div class="card swiper-slide">
                            <div class="image-content">
                                <span class="overlay"></span>
                                <div class="card-image">
                                    <img src="css/soham.jpg" alt="" class="card-img">
                                </div>
                            </div>

                            <div class="card-content">
                                <h2 class="name">Soham Satvara</h2>
                                <p class="description">Enrollment No. : 200280107018</p>

                                <div class="icons">
                                    <a href="#">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fab fa-linkedin"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fab fa-instagram"></i>
                                    </a>

                                    <a href="#">
                                        <i class="fab fa-facebook"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="card swiper-slide">
                            <div class="image-content">
                                <span class="overlay"></span>
                                <div class="card-image">
                                    <img src="css/smit.jpg" alt="" class="card-img">
                                </div>
                            </div>

                            <div class="card-content">
                                <h2 class="name">Smit Patel</h2>
                                <p class="description">Enrollment No. : 200280107046</p>

                                <div class="icons">
                                    <a href="#">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fab fa-linkedin"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fab fa-instagram"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fab fa-facebook"></i>
                                    </a>
                                </div>
                            </div>
                        </div>


                        <div class="card swiper-slide">
                            <div class="image-content">
                                <span class="overlay"></span>

                                <div class="card-image">
                                    <img src="css/deep.jpg" alt="" class="card-img">
                                </div>
                            </div>

                            <div class="card-content">
                                <h2 class="name">Deep Patel</h2>
                                <p class="description">Enrollment No. : 200280107010</p>

                                <div class="icons">
                                    <a href="#">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fab fa-linkedin"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fab fa-instagram"></i>
                                    </a>

                                    <a href="#">
                                        <i class="fab fa-facebook"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="swiper-button-next swiper-navBtn"></div>
                <div class="swiper-button-prev swiper-navBtn"></div>
                <div class="swiper-pagination"></div>
            </div>
        </section>

        <script >
            

             
//team.jsp

var swiper = new Swiper(".slide-content", {
                slidesPerView: 3,
                spaceBetween: 25,
                centerSlide: 'true',
                fade: 'true',
                grabCursor: 'true',
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                    dynamicBullets: true,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },

                breakpoints: {
                    0: {
                        slidesPerView: 1,
                    },
                    520: {
                        slidesPerView: 2,
                    },
                    950: {
                        slidesPerView: 3,
                    },
                },
            });
        </script>

        <%@include file="component/footer.html" %>

    </body>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/swiper-bundle.min.js"></script>


</html>