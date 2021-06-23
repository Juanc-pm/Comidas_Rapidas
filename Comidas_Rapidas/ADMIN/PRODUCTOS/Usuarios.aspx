<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Comidas_Rapidas.ADMIN.PRODUCTOS.Usuarios" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Content/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="../../../Content/Mensaje_Modal/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content">
        <h3 class="text-center">USUARIOS DEL SISTEMA(ADMINISTRADOR)</h3>

        <div class="row">
            <div class="col-md-7">
                <div class="col-auto">
                    <label></label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text alert-danger">Personal</div>
                        </div>
                        <asp:TextBox runat="server" class="form-control" ID="txtBuscarProdcuto" placeholder="Nombre de Persona" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <br />
                <asp:LinkButton ID="btnbuscarProdcuto" Text="<i class='fa fa-search'></i>" CssClass="btn btn-bitbucket  bg-blue" runat="server"></asp:LinkButton>

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
            <asp:GridView ID="tablaconsultaRESERVA" runat="server" OnSelectedIndexChanged="tablaconsultaRESERVA_SelectedIndexChanged" OnRowUpdating="tablaconsultaRESERVA_RowUpdating" CssClass="table" AutoGenerateColumns="False">
                <AlternatingRowStyle CssClass="alert-danger" ForeColor="#000000" />
                <Columns>


                    <asp:TemplateField Visible="false" HeaderText="#">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="txtID" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" SortExpression="CODIGO" />
                    <asp:BoundField DataField="NUMERO_IDENTIFICACION" HeaderText="NUMERO IDENTIFICACION" SortExpression="NUMERO_IDENTIFICACION" />
                    <asp:BoundField DataField="NOMBRE_COMPLETO" HeaderText="NOMBRE COMPLETO" SortExpression="NOMBRE_COMPLETO" />
                    <asp:CheckBoxField DataField="ESTADO" HeaderText="ESTADO" SortExpression="ESTADO">

                        <HeaderStyle Width="10px" />
                    </asp:CheckBoxField>

                    <asp:ButtonField ButtonType="Link" Text="<i class='fa fa-user-circle'></i>Usuario" CommandName="Select">
                        <ControlStyle CssClass="btn btn-warning form-control" />

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />

                    </asp:ButtonField>

                    <asp:ButtonField ButtonType="Link" Text="<i class='fa fa-pencil-square-o'></i>" CommandName="Update">
                        <ControlStyle CssClass="btn btn-success" />
                        <HeaderStyle Width="10px" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />

                    </asp:ButtonField>


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


            function MostrarMensajeEliminar2() {

                $('#NuevoUsuario').modal('show');

            }

        </script>


    </section>


    <%-- --Ventana REGISTRAR NUEVO ELEMENTO----%>

    <div class="modal fade" id="NuevoElemento" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Nuevo Personal</h5>

                </div>

                <div class="modal-body">

                    <div class="box box-primary box-group">
                        <div class="box-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Tipo Identificación*</label>
                                            <asp:DropDownList runat="server" ID="txttipoidentificacion" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Número Identificación*</label>
                                            <asp:TextBox runat="server" ID="txtidenfiticacion" CssClass="form-control"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender runat="server" FilterType="Numbers" TargetControlID="txtidenfiticacion" />

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-1">
                                    <div class="box-body">
                                        <div class="form-group">

                                            <label>Activo</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">

                                                        <asp:CheckBox ID="checactivo" Checked="true" runat="server"></asp:CheckBox>

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
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Primer Nombre*</div>
                                                </div>
                                                <asp:TextBox ID="txtprimernomb" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Segundo Nombre</div>
                                                </div>
                                                <asp:TextBox ID="txtsegundonomb" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Primer Apellido*</div>
                                                </div>
                                                <asp:TextBox ID="txtprimerapellido" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Segundo Apellido*</div>
                                                </div>
                                                <asp:TextBox ID="txtsegundoapellido" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                        </div>

                                    </div>
                                </div>


                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Dirección*</label>
                                            <asp:TextBox runat="server" TextMode="MultiLine" Rows="3" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" ID="txtdireccion" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Telefono 1*</label>
                                            <asp:TextBox runat="server" MaxLength="10" ID="txtteluno" CssClass="form-control"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender runat="server" FilterType="Numbers" TargetControlID="txtteluno" />

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Telefono 2</label>
                                            <asp:TextBox runat="server" MaxLength="10" ID="txtteldos" CssClass="form-control"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender runat="server" FilterType="Numbers" TargetControlID="txtteldos" />

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <asp:TextBox runat="server" ID="txtemailuno" CssClass="form-control"></asp:TextBox>
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
                                    <asp:LinkButton CssClass="btn btn-primary form-control fa fa-plus-circle" ID="btnGuardarDatos" OnClick="btnGuardarDatos_Click" runat="server" Text="Guardar" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>



    <%-- --Ventana REGISTRAR NUEVO USUARIO----%>

    <div class="modal fade" id="NuevoUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Usuario</h5>

                </div>

                <div class="modal-body">

                    <div class="box box-primary box-group">
                        <div class="box-body">

                            <div class="row">
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
                                <div class="col-md-6">
                                    <div class="box box-primary">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label>Cargar Firma</label>
                                                <div class="form-group">
                                                    <asp:Image ID="imgfirma" runat="server" CssClass="auto-style2" Height="115px" Width="150px" ImageUrl="~/images/NingunProducto.png" />
                                                    <asp:FileUpload ID="filefirma" runat="server" accept=".jpg" CssClass=" form-control" />
                                                    <asp:Button ID="btnadjuntarfirma" runat="server" CssClass="btn btn-primary" Text="Adjuntar" Width="144px" OnClick="btnadjuntarfirma_Click"></asp:Button>
                                                    <br />
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
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Usuario*</div>
                                                </div>
                                                <asp:TextBox ID="txtusuario" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Confirme Usuario*</div>
                                                </div>
                                                <asp:TextBox ID="txtconfirmeusuario" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Clave*&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                </div>
                                                <asp:TextBox ID="txtclave" TextMode="Password" MaxLength="8" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <br />
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">Confirme Clave*&nbsp;&nbsp;&nbsp;&nbsp;</div>
                                                </div>
                                                <asp:TextBox ID="txtconfirmeclave" TextMode="Password" MaxLength="8" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Perfil</label>
                                        <asp:DropDownList ID="DropDownrol" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div class="box-body">
                                        <div class="form-group">

                                            <label>Activo</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">

                                                        <asp:CheckBox ID="checactivoo" Checked="true" runat="server"></asp:CheckBox>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <br />
                                        <asp:LinkButton ID="btnresetearclave" CssClass="btn btn-success" data-toggle="modal" data-target="#BuscarTErcero1" runat="server">Resetear Clave</asp:LinkButton>
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
                                    <asp:LinkButton CssClass="btn btn-primary form-control fa fa-plus-circle" ID="btnGuardarUsuario" OnClick="btnGuardarUsuario_Click" runat="server" Text="Guardar" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>


    <%--resetear clave--%>

    <div allowoutsideclick: false class="modal fade" id="BuscarTErcero1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="form">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">Reestablecer clave…</h4>
                </div>
                <div class="modal-body">
                    <div class="content">
                        <label>Nueva Clave</label>
                        <asp:TextBox ID="txtnuevaclave" placeholder="Ingrese Clave" MaxLength="8" TextMode="Password" runat="server" Enabled="true" CssClass="form-control"></asp:TextBox>
                        <label>Confirmar Clave</label>
                        <asp:TextBox ID="txtconfirmenuevaclave" placeholder="Confirme su clave" MaxLength="8" TextMode="Password" runat="server" Enabled="true" CssClass="form-control"></asp:TextBox>

                    </div>
                    <br />

                    <asp:Button ID="btnguardarrest" runat="server" Text="Actualizar" CssClass="btn btn-success" OnClick="btnguardarrest_Click" />

                </div>
            </div>
        </div>
    </div>

</asp:Content>
