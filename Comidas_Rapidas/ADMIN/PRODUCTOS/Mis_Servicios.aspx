<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Mis_Servicios.aspx.cs" Inherits="Comidas_Rapidas.ADMIN.PRODUCTOS.Mis_Servicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content">

        <div class="jumbotron">
            <h1 class="display-4">Menú</h1>
            <p class="lead">¡Ingresa en el sistema las mejores comidas rapidas, no tienen comparación! Sabor que se disfruta, ¡Simplemente Perfecto!</p>
            <hr class="my-4">

            <div class="container-fluid">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-lg-6 col-6">
                        <!-- small box -->
                        <div class="small-box bg-purple">
                            <div class="inner">
                                <h3>Asados<sup style="font-size: 20px"></sup></h3>

                                <p></p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="ASADOS/Consultar_Crear_Asados.aspx" class="small-box-footer">Mas Información <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-6 col-6">
                        <!-- small box -->
                        <div class="small-box bg-olive ">
                            <div class="inner">
                                <h3>Pollo Broaster<sup style="font-size: 20px"></sup></h3>


                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="POLLO_BROASTER/Crear_Pollo_Bros.aspx" class="small-box-footer">Mas Información <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-6">
                        <!-- small box -->
                        <div class="small-box  badge-danger">
                            <div class="inner">
                                <h3>Chuzos<sup style="font-size: 20px"></sup></h3>


                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="CHUZOS/Crear_Chuzos.aspx" class="small-box-footer">Mas Información <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-6">
                        <!-- small box -->
                        <div class="small-box bg-blue">
                            <div class="inner">
                                <h3>Hamburguesas<sup style="font-size: 20px"></sup></h3>


                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="HAMBURGESAS/Crear_Hamburguesas.aspx" class="small-box-footer">Mas Información <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-6">
                        <!-- small box -->
                        <div class="small-box bg-fuchsia ">
                            <div class="inner">
                                <h3>Salchipapas<sup style="font-size: 20px"></sup></h3>


                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="SALCHIPAPAS/Crear_Salchipapas.aspx" class="small-box-footer">Mas Información <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-6">
                        <!-- small box -->
                        <div class="small-box bg-dark">
                            <div class="inner">
                                <h3>Perros Calientes<sup style="font-size: 20px"></sup></h3>


                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="PERROS_CALIENTES/Crear_Perros_Calientes.aspx" class="small-box-footer">Mas Información <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-6">
                        <!-- small box -->
                        <div class="small-box bg-cyan">
                            <div class="inner">
                                <h3>Mazorca<sup style="font-size: 20px"></sup></h3>


                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="MAZORCA/Crear_Mazorca.aspx" class="small-box-footer">Mas Información <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-6">
                        <!-- small box -->
                        <div class="small-box bg-lightblue">
                            <div class="inner">
                                <h3>Sandiwch<sup style="font-size: 20px"></sup></h3>


                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="SANDIWCH/Crear_ Sandiwch.aspx" class="small-box-footer">Mas Información <i class="fas fa-arrow-circle-right"></i></a>
                        </div>

                    </div>
                    <div class="col-lg-12">
                        <!-- small box -->
                        <div class="small-box badge-success">
                            <div class="inner">
                                <h3>Pizzas<sup style="font-size: 20px"></sup></h3>


                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="PIZZAS/Crear_Pizzas.aspx" class="small-box-footer">Mas Información <i class="fas fa-arrow-circle-right"></i></a>
                        </div>

                    </div>

                </div>
            </div>
        </div>


    </section>
</asp:Content>
