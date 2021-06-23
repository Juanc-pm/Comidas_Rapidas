<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Solicitudes_Pedidos.aspx.cs" Inherits="Comidas_Rapidas.ADMIN.PRODUCTOS.Solicitudes_Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="../../Content/Mensaje_Modal/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
        <h3 class="text-center">PEDIDOS SOLICITADOS</h3>
    </section>

    <asp:Panel ID="PanelConsultarPedidos" Visible="true" Width="100%" Height="400px" ScrollBars="Auto" runat="server">
        <asp:GridView ID="tablaconsultaPedidos" runat="server" OnRowUpdating="tablaconsultaPedidos_RowUpdating" CssClass="table" AutoGenerateColumns="False">
            <AlternatingRowStyle CssClass="alert-danger" ForeColor="#000000" />
            <Columns>


                <asp:TemplateField Visible="false" HeaderText="#">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="txtID" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:BoundField DataField="CATEGORIA" HeaderText="CATEGORIA" SortExpression="CATEGORIA" />
                <asp:BoundField DataField="PRODUCTO" HeaderText="PRODUCTO" SortExpression="PRODUCTO" />
                <asp:BoundField DataField="DIRECCION" HeaderText="DIRECCION" SortExpression="DIRECCION" />
                <asp:BoundField DataField="CANTIDAD" HeaderText="CANTIDAD" SortExpression="CANTIDAD" />
                <asp:BoundField DataField="NOMBRE_CLIENTE" HeaderText="CLIENTE" SortExpression="NOMBRE_CLIENTE" />
                <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" SortExpression="TELEFONO" />
            
                <asp:TemplateField>
                    <ItemTemplate>

                        <div class="text-center">
                            <asp:LinkButton runat="server" CssClass="btn btn-warning" CommandName="Update" ><i class="far fa-list-alt"></i>Detalles</asp:LinkButton>

                        </div>

                    </ItemTemplate>
                    <HeaderStyle Width="10px" />
                </asp:TemplateField>

            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" CssClass="thead-light" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />


        </asp:GridView>

        <asp:Label ID="txtAlertTablarESERVA" runat="server">

                                                 <div class="alert alert-warning text-center alert-link" role="alert">
                                                <h6>
                                                    <br />.:: Sin Registros ::. <br /><br /></h6> 
                                            </div>
        </asp:Label>
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
                    <h5 class="modal-title" id="staticBackdropLabel">Pedido Solicitado</h5>

                </div>

                <div class="modal-body">

                    <div class="box box-primary box-group">
                        <div class="box-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Nombre Cliente*</label>
                                            <asp:TextBox Enabled="false" runat="server" ID="txtNombreCliente" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Correo</label>
                                            <asp:TextBox runat="server" Enabled="false" ID="txtCorreo" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>



                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Dirreción*</label>
                                            <asp:TextBox ID="txtDireccion" Enabled="false" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label></label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Total Pagar</div>
                                                </div>
                                                <asp:TextBox ID="txtTotal" Enabled="false" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                                
                            </div>



                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Anotaciones</label>
                                            <asp:TextBox ID="txtAnotaciones" Enabled="false" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" TextMode="MultiLine" Rows="4" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            

                            </div>


                        </div>

                    </div>
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
                                    <asp:LinkButton OnClientClick="if (!window.confirm('Desea despachar el Pedido?')) return false;" CssClass="btn btn-primary form-control fa fa-plus-circle" ID="txtRealizarPedido" OnClick="txtRealizarPedido_Click" runat="server" Text="Despachar Pedido" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</asp:Content>
