<%@ Page Title="" Language="C#" MasterPageFile="~/Productos.Master" AutoEventWireup="true" CodeBehind="Mazorca_Disponibles.aspx.cs" Inherits="Comidas_Rapidas.Willys_Inicio.PRODUCTOS.Mazorca_Disponibles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="../../Content/Mensaje_Modal/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content">
        <h3 class="text-center">MAZORCAS DISPONIBLES</h3>
        <div class="row">
            <div class="form-group">
                <asp:Button ID="btncancelar" CssClass="btn btn-warning" runat="server" OnClick="btncancelar_Click" Text="Volver al Menú" UseSubmitBehavior="False" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="col-auto">
                    <label></label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text alert-danger">Producto</div>
                        </div>
                        <asp:TextBox runat="server" class="form-control" ID="txtBuscarProdcuto" placeholder="Nombre Producto" />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <br />
                <asp:LinkButton ID="btnbuscarProdcuto" OnClick="btnbuscarProdcuto_Click" Text="<i class='fa fa-search'></i>Buscar" CssClass="btn btn-bitbucket  bg-blue" runat="server"></asp:LinkButton>

            </div>
            <%--<div class="col-md-2">
                <div class="box-body">
                    <div class="form-group">
                        <br />
                        <asp:LinkButton ID="btnNuevoElemento" runat="server" OnClick="btnNuevoElemento_Click" CssClass="btn btn-primary  form-control" Text="<i class='fas fa-plus-circle'></i>Nuevo Registro" />

                    </div>
                </div>
            </div>--%>
        </div>

        <br />
        <asp:Panel ID="PanelProductos" Visible="true" Height="100%" ScrollBars="Auto" runat="server">
            <asp:ListView runat="server" ID="ListView1"
                GroupItemCount="4" ItemPlaceholderID="itemPlaceholder" OnItemCommand="ListView1_ItemCommand">

                <ItemTemplate>
                    <div class="form-row">
                        <div class="card border-primary mb-3 alert-danger" style="max-width: 18rem;">
                            <div class="row no-gutters">
                                <div class="col-md-4">

                                    <asp:Label Visible="false" runat="server" ID="txtIDPROCUTO" class="card-text" Text='<%# Bind("ID") %>'>  </asp:Label>

                                    <div class="card-img-top">
                                        <asp:Image ID="Image2" runat="server"
                                            ImageUrl='<%# ((Eval("FOTO") is System.DBNull) ? "[Path to blank image]" : "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("FOTO"))) %>' Width="280px" Height="200px" />

                                    </div>
                                </div>
                                <div class="card bg-light mb-3" style="max-width: 18rem;">
                                    <div class="card-header text-xl-center bg-danger" style="color: white">
                                        <asp:Label Visible="false" runat="server" ID="txtCodigoProduct" class="card-text" Text='<%# Bind("CODIGO") %>'>  </asp:Label>

                                        <asp:Label runat="server" ID="txtNombreProducto" class="card-text" Text='<%# Bind("PRODUCTO") %>'>  </asp:Label>

                                    </div>
                                    <div class="card-body alert-warning">
                                        <p class="card-text">
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item" style="background: yellow; color: black">
                                                    <label>Detalle:</label>

                                                    <asp:Label runat="server" ID="TXTDETALLEpROCDUTO" class="card-text" Text='<%# Bind("DETALLES") %>'>  </asp:Label>
                                                </li>
                                                <li class="list-group-item" style="background: yellow; color: black">
                                                    <label>Precio:</label>

                                                    <asp:Label runat="server" ID="TXTpRECIOpRDTO" class="card-text" Text='<%# Bind("PRECIO") %>'>  </asp:Label></li>
                                                <%--                                            <li class="list-group-item" style="background: yellow; color: black">Vestibulum at eros</li>--%>
                                            </ul>

                                        </p>
                                    </div>

                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <asp:LinkButton CssClass="btn btn-success" Width="100%" ID="LinkButton2" runat="server" Text="<i class='fas fa-shopping-cart'></i>" />

                                    </div>


                                </div>
                            </div>

                            </td>
                        </div>
                </ItemTemplate>

                <LayoutTemplate>
                    <table cellpadding="1" runat="server"
                        id="tblProducts" style="height: 100px">
                        <tr runat="server" id="groupPlaceholder">
                        </tr>
                    </table>

                    <asp:DataPager OnPreRender="Unnamed_PreRender" runat="server" PageSize="4">
                        <Fields>
                            <asp:NextPreviousPagerField
                                ButtonType="Button"
                                ButtonCssClass="btn btn-warning"
                                ShowFirstPageButton="True"
                                ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <GroupTemplate>
                    <tr runat="server" id="productRow"
                        style="height: 80px">
                        <td runat="server" id="itemPlaceholder"></td>
                    </tr>
                </GroupTemplate>
            </asp:ListView>
        </asp:Panel>

        <%--Codigo JavaScript--%>

        <script type="text/javascript">



            function MostrarMensajeEliminar() {

                $('#NuevoElemento').modal('show');

            }

        </script>


    </section>


    <%-- --Ventana REGISTRAR NUEVO ELEMENTO----%>

    <div class="modal fade" id="NuevoElemento" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Nuevo Pedido</h5>

                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <asp:DropDownList Enabled="false" runat="server" ID="txtDCategoria" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <asp:TextBox ID="txtElemento" Enabled="false" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>




                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <asp:TextBox ID="txtDetalles" Enabled="false" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" TextMode="MultiLine" Rows="2" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-3">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">$</div>
                                        </div>
                                        <asp:TextBox ID="txtPrecio" Enabled="false" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">Cantidad</div>
                                        </div>
                                        <asp:TextBox ID="txtCantidad" OnTextChanged="txtCantidad_TextChanged" AutoPostBack="true" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>

                                    </div>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">Total Pago</div>
                                        </div>
                                        <asp:TextBox ID="txtTotalPago" Enabled="false" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                </div>

                            </div>
                        </div>


                    </div>



                    <div class="row">
                        <div class="col-md-6">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <asp:TextBox ID="txtNombreCliente" placeholder="Nombre Completo" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">Telefono:</div>
                                        </div>
                                        <asp:TextBox ID="txtTelefono" TextMode="Number" MaxLength="10" runat="server" CssClass="form-control"></asp:TextBox>

                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <asp:TextBox ID="txtDireccion" placeholder="Direccion" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">Correo:</div>
                                        </div>
                                        <asp:TextBox ID="txtDcorreo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="box-body">
                                <div class="form-group">
                                    <label></label>
                                    <asp:TextBox ID="txtAnotaciones" placeholder="Anotaciones" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" TextMode="MultiLine" Rows="4" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                    </div>



                </div>

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="box-body">
                                    <div class="form-group">
                                        <asp:LinkButton CssClass="btn btn-danger form-control" data-dismiss="modal" runat="server" Text="Cerrar" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="box-body">
                                    <div class="form-group">
                                        <asp:LinkButton CssClass="btn btn-success form-control" ID="btnGuardarProducto" runat="server" OnClick="btnGuardarProducto_Click" Text="Realizar Pedido" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnGuardarProducto" />
                        <asp:PostBackTrigger ControlID="txtCantidad" />
                        <asp:PostBackTrigger ControlID="btnbuscarProdcuto"/>
                    </Triggers>
                </asp:UpdatePanel>



            </div>
        </div>

    </div>



</asp:Content>
