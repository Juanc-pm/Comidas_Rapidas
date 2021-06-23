<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Comidas_Rapidas.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/logo.png" sizes="32x32" />
    <link rel="icon" href="images/logo.png" sizes="192x192" />
    <link rel="apple-touch-icon-precomposed" href="images/logo.png" />
    <title>Inicio | </title>
    <!-- Bootstrap -->
    <link href="../Maestra_Estilos/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../Maestra_Estilos/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../Maestra_Estilos/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../Maestra_Estilos/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="Content/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="Content/Mensaje_Modal/sweetalert.min.js"></script>
    <!-- bootstrap-progressbar -->
    <link href="../Maestra_Estilos/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../Maestra_Estilos/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
    <!-- bootstrap-daterangepicker -->
    <link href="../Maestra_Estilos/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../Maestra_Estilos/build/css/custom.min.css" rel="stylesheet">
</head>
<body class="login" background-repeat: no-repeat; background-attachment: fixed;">
    <form id="form1" runat="server">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>

            <div class="login_wrapper" style="color: red">
                <div class="animate form login_form">
                     <div class="text-center">
                    <asp:ImageButton  runat="server" ImageUrl="~/images/logo.png" Width="200px" /></a>
                         </div>

                    <section class="login_content">
                        <form>

                            <h1>Login</h1>
                            <div>
                                <asp:TextBox ID="txtUsuario" runat="server" class="form-control" placeholder="Usuario" required="" />
                            </div>
                            <div>
                                <asp:TextBox type="password" ID="txtContras" runat="server" class="form-control" placeholder="Contraseña" required="" />
                            </div>
                            <div>
                                <a>
                                    <asp:LinkButton ID="btningresa" CssClass="btn btn-danger" runat="server" OnClick="Unnamed_Click" Text="Iniciar Sesión"></asp:LinkButton>
                                </a>
                                <%--                                <a class="reset_pass" href="#"></a>--%>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <%--        <p class="change_link">
                                    New to site?
                  <a href="#signup" class="to_register">Create Account </a>
                                </p>--%>

                                <div class="clearfix"></div>
                                <br />

                                <%--  <div>
                                    <h1><i class="fa fa-free-code-camp" aria-hidden="true"></i>Willy`s y su Sabor!</h1>
                                    <p>© Willy`s y su Sabor 2021. Todos los derechos reservados.</p>
                                </div>--%>
                            </div>
                        </form>
                    </section>
                </div>

                <%--      <div id="register" class="animate form registration_form">
                    <section class="login_content">
                        <form>
                            <h1>Create Account</h1>
                            <div>
                                <input type="text" class="form-control" placeholder="Username" required="" />
                            </div>
                            <div>
                                <input type="email" class="form-control" placeholder="Email" required="" />
                            </div>
                            <div>
                                <input type="password" class="form-control" placeholder="Password" required="" />
                            </div>
                            <div>
                                <a class="btn btn-default submit" href="index.html">Submit</a>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <p class="change_link">
                                    Already a member ?
                  <a href="#signin" class="to_register">Log in </a>
                                </p>

                                <div class="clearfix"></div>
                                <br />

                                <div>
                                    <h1><i class="fa fa-paw"></i>Gentelella Alela!</h1>
                                    <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                                </div>
                            </div>
                        </form>
                    </section>
                </div>--%>
            </div>
        </div>
    </form>
</body>
</html>
