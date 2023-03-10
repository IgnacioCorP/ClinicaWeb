<%-- 
    Document   : cliente
    Created on : 08-feb-2023, 12:52:36
    Author     : Alumno Mañana
--%>
<%
    String user = "";
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("Email") != null) {
        user = (String) sesion.getAttribute("Email");
    }
    String user1 = "";
    sesion = request.getSession();
    if (sesion.getAttribute("Nif") != null) {
        user = (String) sesion.getAttribute("Nif");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Pharma &mdash; Colorlib Template</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">


        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/style.css">

    </head>

    <body>

        <div class="site-wrap">


            <div class="container-fluid ">
                <nav class="navbar navbar-expand-lg navbar-light " style="background: transparent;">
                    <div class="container-fluid">
                        <!--ÍCONO APP-->
                        <a class="navbar-brand" href="cliente.jsp"><img src="imgP/LOGO.png" class="img-fluid" style="width: 150px; height: 120px;"></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link" href="cliente.jsp">INICIO</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="Productos?accion=listarProductos" id="navbarDropdown" role="button" aria-expanded="false">PRODUCTOS</a>

                                </li>

                            </ul>


                        </div>
                        <div class="text-center">
                            <a href="index.jsp" class="btn btn-primary">CERRAR SESIÓN</a>
                        </div>
                        <div class="text-center text-dark">
                            <a  class="btn btn-primary">MI CUENTA</a>
                        </div>

                        <a text-dark> <%=user%></a>
                    </div>
                </nav>
            </div>

            <div class="site-blocks-cover" style="background-image: url('images/hero_1.jpg');">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 mx-auto order-lg-2 align-self-center">
                            <div class="site-block-cover-content text-center">
                                <h2 class="sub-title">MEDICINA BASADA EN LA EVIDENCIA</h2>
                                <h1>BIENVENIDO A KUANTUM PHARMA</h1>
                                <p>
                                    <a href="Productos?accion=listarProductos" class="btn btn-primary px-5 py-3">COMPRAR AHORA</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site-section">
                <div class="container">
                    <div class="row align-items-stretch section-overlap">
                        <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                            <div class="banner-wrap bg-primary h-100">
                                <a href="#" class="h-100">
                                    <h5>Envíos <br> Gratutios!!</h5>
                                    <p>
                                        El amor es el amor
                                        <strong>Muchas gracias, al dolor le seguirá la adipiscencia.</strong>
                                    </p>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                            <div class="banner-wrap h-100">
                                <a href="#" class="h-100">
                                    <h5>Hasta 50% <br> en nuestros productos </h5>

                                </a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                            <div class="banner-wrap bg-warning h-100">
                                <a href="#" class="h-100">
                                    <h5>Paga <br> con tarjeta sin problemas</h5>

                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="title-section text-center col-12">
                            <h2 class="text-uppercase">PRODUCTOS</h2>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 col-lg-4 text-center item mb-4">
                            <span class="tag">Sale</span>
                            <a href="compra.html"> <img src="images/product_01.png" alt="Image"></a>
                            <h3 class="text-dark"><a href="compra.html">Bioderma</a></h3>
                            <p class="price"><del>95.00</del> &mdash; $55.00</p>
                        </div>
                        <div class="col-sm-6 col-lg-4 text-center item mb-4">
                            <a href="compra.html"> <img src="images/product_02.png" alt="Image"></a>
                            <h3 class="text-dark"><a href="compra.html">Chanca Piedra</a></h3>
                            <p class="price">$70.00</p>
                        </div>
                        <div class="col-sm-6 col-lg-4 text-center item mb-4">
                            <a href="compra.html"> <img src="images/product_03.png" alt="Image"></a>
                            <h3 class="text-dark"><a href="compra.html">Umcka Cold Care</a></h3>
                            <p class="price">$120.00</p>
                        </div>

                        <div class="col-sm-6 col-lg-4 text-center item mb-4">

                            <a href="compra.html"> <img src="images/product_04.png" alt="Image"></a>
                            <h3 class="text-dark"><a href="compra.html">Cetyl Pure</a></h3>
                            <p class="price"><del>45.00</del> &mdash; $20.00</p>
                        </div>
                        <div class="col-sm-6 col-lg-4 text-center item mb-4">
                            <a href="compra.html"> <img src="images/product_05.png" alt="Image"></a>
                            <h3 class="text-dark"><a href="compra.html">CLA Core</a></h3>
                            <p class="price">$38.00</p>
                        </div>
                        <div class="col-sm-6 col-lg-4 text-center item mb-4">
                            <span class="tag">Sale</span>
                            <a href="compra.html"> <img src="images/product_06.png" alt="Image"></a>
                            <h3 class="text-dark"><a href="compra.html">Poo Pourri</a></h3>
                            <p class="price"><del>$89</del> &mdash; $38.00</p>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-12 text-center">
                            <a href="productoscliente.jsp" class="btn btn-primary px-4 py-3">Ver todos los productos</a>
                        </div>
                    </div>
                </div>
            </div>


            <div class="site-section bg-light">
                <div class="container">
                    <div class="row">
                        <div class="title-section text-center col-12">
                            <h2 class="text-uppercase">ÚLTIMOS PRODUCTOS</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 block-3 products-wrap">
                            <div class="nonloop-block-3 owl-carousel">

                                <div class="text-center item mb-4">
                                    <a href="compra.html"> <img src="images/product_03.png" alt="Image"></a>
                                    <h3 class="text-dark"><a href="compra.html">Umcka Cold Care</a></h3>
                                    <p class="price">$120.00</p>
                                </div>

                                <div class="text-center item mb-4">
                                    <a href="compra.html"> <img src="images/product_01.png" alt="Image"></a>
                                    <h3 class="text-dark"><a href="compra.html">Umcka Cold Care</a></h3>
                                    <p class="price">$120.00</p>
                                </div>

                                <div class="text-center item mb-4">
                                    <a href="compra.html"> <img src="images/product_02.png" alt="Image"></a>
                                    <h3 class="text-dark"><a href="compra.html">Umcka Cold Care</a></h3>
                                    <p class="price">$120.00</p>
                                </div>

                                <div class="text-center item mb-4">
                                    <a href="compra.html"> <img src="images/product_04.png" alt="Image"></a>
                                    <h3 class="text-dark"><a href="compra.html">Umcka Cold Care</a></h3>
                                    <p class="price">$120.00</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

          
            <div class="site-section bg-secondary bg-image" style="background-image: url('images/bg_2.jpg');">
                <div class="container">
                    <div class="row align-items-stretch">
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <a href="#" class="banner-1 h-100 d-flex" style="background-image: url('images/bg_1.jpg');">
                                <div class="banner-1-inner align-self-center">
                                    <h2>KUANTUM PHARMA</h2>
                                    <p>Somos KUANTUM PHARMA un laboratorio especializado en el desarrollo y la fabricación de medicamentos producidos a partir de componentes de origen natural y biológico.
                                    </p>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <a href="#" class="banner-1 h-100 d-flex" style="background-image: url('images/bg_2.jpg');">
                                <div class="banner-1-inner ml-auto  align-self-center">
                                    <h2>Expertos en </h2>
                                    <p>el cuidado de la salud y el bienestar de nuestros pacientes, por eso nos respaldamos en nuestra amplia experiencia, desarrollo tecnológico y un equipo humano orientado a lograr la excelencia y calidad de nuestros productos.
                                    </p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>



        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>

    </body>

</html>