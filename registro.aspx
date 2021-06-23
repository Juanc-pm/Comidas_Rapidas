<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="Comidas_Rapidas.registro" %>

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
<body class="registro" style="background-image:url(images/logo.png); background-position-x:50%; background-repeat: no-repeat; background-attachment: fixed;">
     <section class="login_content">
                        <form>
                            <h1>Create Account</h1>
                             <div>
                                <asp:TextBox  id="txtNombres" runat="server" class="form-control" placeholder="Nombre" required="" />
                            </div>
                            <div>
                                <asp:TextBox type="text" id="txtApellidos" runat="server" class="form-control" placeholder="Apellidos" required="" />
                            </div>
                             <div>
                                <asp:TextBox  id="txtCedula" runat="server" class="form-control" placeholder="Cedula" required="" />
                            </div>
                            <div>
                                <asp:TextBox type="text" id="txtDireccion" runat="server" class="form-control" placeholder="Direccion" required="" />
                            </div>
                           <div>
                                <asp:TextBox type="text" id="txtCorreo" runat="server" class="form-control" placeholder="Correo" required="" />
                            </div>
                             <div>
                                <asp:TextBox type="pasword" id="txtContraseña" runat="server" class="form-control" placeholder="Contraseña" required="" />
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

                               
                            </div>
                        </form>
                    </section>
</body>
</html>
