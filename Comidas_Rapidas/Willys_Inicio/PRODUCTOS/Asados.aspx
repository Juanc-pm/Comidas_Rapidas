<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaPrincipal.Master" AutoEventWireup="true" CodeBehind="Asados.aspx.cs" Inherits="Comidas_Rapidas.Willys_Inicio.PRODUCTOS.Asados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <asp:Panel runat="server">
        <div class="alert alert-warning text-center" role="alert">
            <a class="alert-link">ASADOS</a>
        </div>
        <section class="content">
            <div class="well">
                <div class="card border-warning mb-3" style="width: 18rem;">
                    <div class="row no-gutters">
                        <div class="card-img-top">
                            <img src="../images/picada.jpg" height="100%" class="card-img" alt="...">
                        </div>
                    </div>
                    <div class="card bg-light mb-3" style="max-width: 18rem;">
                        <div class="card-header text-xl-center bg-danger" style="color: white">
                            PICADA MIXTA
                        </div>
                        <div class="card-body alert-warning">
                            <p class="card-text">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="background: yellow; color: black">Cras justo odio</li>
                                    <li class="list-group-item" style="background: yellow; color: black">Dapibus ac facilisis in</li>
                                    <li class="list-group-item" style="background: yellow; color: black">Vestibulum at eros</li>
                                </ul>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                                <p>
                                </p>
                            </p>
                        </div>
                        <div class="card-footer bg-transparent border-warning text-center">
                            <asp:LinkButton CssClass="btn btn-warning fa fa-info-circle" ID="btnReservar" runat="server" Text=" Mas Detalles" />
                            <asp:LinkButton CssClass="btn btn-success fa fa-shopping-cart" ID="LinkButton2" runat="server" Text=" Comprar" />



                        </div>

                    </div>
                </div>
            </div>
        </section>
    </asp:Panel>

</asp:Content>
