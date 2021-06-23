<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Crear_Hamburguesas.aspx.cs" Inherits="Comidas_Rapidas.ADMIN.PRODUCTOS.HAMBURGESAS.Crear_Hamburguesas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Content/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="../../../Content/Mensaje_Modal/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
        <h3 class="text-center">HAMBURGUESAS DISPONIBLES</h3>
        <div class="row">
            <div class="form-group">
                <asp:Button ID="btncancelar" CssClass="btn btn-warning" OnClick="btncancelar_Click" runat="server" Text="Volver al Menú" UseSubmitBehavior="False"  />
            </div>
        </div>
      
        <div class="row">
            <div class="col-md-7">
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
            <div class="col-md-3">
                <br />
                <asp:LinkButton ID="btnbuscarProdcuto" Text="<i class='fa fa-search'></i>" OnClick="btnbuscarProdcuto_Click" CssClass="btn btn-bitbucket  bg-blue" runat="server"></asp:LinkButton>

            </div>
            <div class="col-md-2">
                <div class="box-body">
                    <div class="form-group">
                        <br />
                        <asp:LinkButton ID="btnNuevoElemento" runat="server" OnClick="btnNuevoElemento_Click" CssClass="btn btn-primary  form-control" Text="<i class='fas fa-plus-circle'></i>Nuevo Registro" />

                    </div>
                </div>
            </div>
        </div>

        <asp:Panel ID="PanelConsultareSERVA" Visible="true" Width="100%" Height="400px" ScrollBars="Auto" runat="server">
            <asp:GridView ID="tablaconsultaRESERVA" runat="server" OnRowUpdating="tablaconsultaRESERVA_RowUpdating" OnRowDeleting="tablaconsultaRESERVA_RowDeleting" CssClass="table" AutoGenerateColumns="False">
               <AlternatingRowStyle  CssClass="alert-danger" ForeColor="#000000"  />
                <Columns>


                    <asp:TemplateField Visible="false" HeaderText="#">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="txtID" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" SortExpression="CODIGO" />

                    <asp:BoundField DataField="PRODUCTO" HeaderText="PRODUCTO" SortExpression="PRODUCTO" />
                    <asp:BoundField DataField="DETALLES" HeaderText="DETALLES" SortExpression="DETALLES" />
                    <asp:BoundField DataField="PRECIO" HeaderText="PRECIO" SortExpression="PRECIO" />
                    <asp:CheckBoxField DataField="ESTADO" HeaderText="ESTADO" SortExpression="ESTADO">

                        <HeaderStyle Width="10px" />
                    </asp:CheckBoxField>

                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server"
                                ImageUrl='<%# ((Eval("FOTO") is System.DBNull) ? "[Path to blank image]" : "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("FOTO"))) %>' Width="100px" Height="60px" />

                        </ItemTemplate>
                        <HeaderStyle Width="12%" />
                    </asp:TemplateField>

                    <asp:ButtonField ButtonType="Link" Text="<i class='fa fa-pencil-square-o'></i>" CommandName="Update">
                        <ControlStyle CssClass="btn btn-success" />
                        <HeaderStyle Width="10px" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />

                    </asp:ButtonField>
                    <asp:TemplateField>
                        <ItemTemplate>

                            <div class="text-center">
                                <asp:LinkButton runat="server" CssClass="btn btn-danger" CommandName="delete" OnClientClick="if (!window.confirm('Desea eliminar el registro seleccionado?')) return false;"><i class="far fa-trash-alt"></i></asp:LinkButton>

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
                    <h5 class="modal-title" id="staticBackdropLabel">Nuevo Elemento</h5>

                </div>

                <div class="modal-body">

                    <div class="box box-primary box-group">
                        <div class="box-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Categoría*</label>
                                            <asp:DropDownList Enabled="false" runat="server" ID="txtDCategoria" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Código*</label>
                                            <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>



                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Nombre Elemento*</label>
                                            <asp:TextBox ID="txtElemento" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Precio*</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">$</div>
                                                </div>
                                                <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <br />

                                            <asp:CheckBox ID="checEstado" Text="Activo" Checked="true" runat="server"></asp:CheckBox>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Detalles</label>
                                            <asp:TextBox ID="txtDetalles" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" TextMode="MultiLine" Rows="4" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="box box-primary">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label>Cargar Foto</label>
                                                <div class="form-group">
                                                    <asp:Image ID="imgpaciente" runat="server" CssClass="auto-style2" Height="115px" Width="150px" ImageUrl="~/images/NingunProducto.png" />
                                                    <asp:FileUpload ID="filefotousuario" runat="server" accept=".jpg" CssClass=" form-control" />
                                                    <asp:Button ID="btnadjuntarfoto" runat="server" CssClass="btn btn-primary" Text="Adjuntar" Width="144px" OnClick="btnadjuntarfoto_Click"></asp:Button>
                                                    <br />
                                                </div>
                                            </div>
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
                                    <asp:LinkButton CssClass="btn btn-primary form-control fa fa-plus-circle" ID="btnGuardarProducto" OnClick="btnGuardarProducto_Click" runat="server" Text="Guardar" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>


</asp:Content>
