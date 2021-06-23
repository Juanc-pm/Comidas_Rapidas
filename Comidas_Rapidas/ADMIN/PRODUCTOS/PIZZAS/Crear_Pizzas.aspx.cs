using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;
using System.Web.ApplicationServices;

namespace Comidas_Rapidas.ADMIN.PRODUCTOS.PIZZAS
{
    public partial class Crear_Pizzas : System.Web.UI.Page
    {
        SqlConnection conn = CONEXION.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategoria();
                CargarProductos();

            }
        }

        public void CargarCategoria()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PRODUCTOS]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 15;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            leer = cmd.ExecuteReader();

            while (leer.Read() != false)
            {
                txtDCategoria.DataSource = dt;
                txtDCategoria.DataValueField = "ID";
                txtDCategoria.DataTextField = "NOMBRE";
                txtDCategoria.DataBind();
            }
            conn.Close();
            leer.Close();
        }

        public static byte[] ImagenOriginal = null;
        protected void btnadjuntarfoto_Click(object sender, EventArgs e)
        {
            try
            {
                if (filefotousuario.FileName.Equals("") == false)
                {
                    int Tamanio = filefotousuario.PostedFile.ContentLength;
                    ImagenOriginal = new byte[Tamanio];

                    filefotousuario.PostedFile.InputStream.Read(ImagenOriginal, 0, Tamanio);
                    Bitmap ImagenOriginalBinaria = new Bitmap(filefotousuario.PostedFile.InputStream);

                    string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);

                    imgpaciente.ImageUrl = ImagenDataUrl64;

                    if (!ClientScript.IsClientScriptBlockRegistered("key"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar()", true);

                    }
                }
            }
            catch (Exception error)
            {
                Response.Write("<script>alert('Las dimensiones de la imagen sobrepasa los límites, debe ser una imagen tamaño foto CC')</script>");
            }
        }

        public void GUARDARPRODCUTO()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PRODUCTOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                if (Convert.ToInt32(Session["ID_PRODUCTO_GUARDADO"]) != 0)
                {
                    cmd.Parameters.Add("@ID", SqlDbType.NVarChar).Value = Session["ID_PRODUCTO_GUARDADO"];
                }

                cmd.Parameters.Add("@ID_CATEGORIA", SqlDbType.Int).Value = txtDCategoria.SelectedValue;
                cmd.Parameters.Add("@CODIGO", SqlDbType.NVarChar).Value = txtCodigo.Text.ToString();
                cmd.Parameters.Add("@PRODUCTO", SqlDbType.NVarChar).Value = txtElemento.Text;
                cmd.Parameters.Add("@DETALLES", SqlDbType.NVarChar).Value = txtDetalles.Text.ToString();
                cmd.Parameters.Add("@PRECIO", SqlDbType.NVarChar).Value = txtPrecio.Text.ToString();
                cmd.Parameters.Add("@ESTADO", SqlDbType.Bit).Value = checEstado.Checked;

                if (ImagenOriginal != null)
                {
                    cmd.Parameters.Add("@FOTO", SqlDbType.Image).Value = ImagenOriginal;
                }
                cmd.Parameters.Add("@USUARIO", SqlDbType.NVarChar).Value = Session["USUARIO"];
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                int Resultado = cmd.ExecuteNonQuery();
                conn.Close();

                if (Resultado != 0)
                {
                    if (Convert.ToInt32(Session["ID_PRODUCTO_GUARDADO"]) != 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Actualizado!', 'Producto Actualizado con Éxito!', 'success');", true);

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Guardado!', 'Producto Guardado con Éxito!', 'success');", true);

                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Algo salió mal!', 'Producto no pudo ser guardado!', 'info');", true);

                }
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error', 'Error de Comandos!', 'error');", true);
            }

        }

        protected void btnGuardarProducto_Click(object sender, EventArgs e)
        {

            if (txtCodigo.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Código del Producto!', 'info');", true);
                return;
            }
            if (txtElemento.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Nombre del Producto!', 'info');", true);
                return;
            }

            if (txtPrecio.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Precio del Producto!', 'info');", true);
                return;
            }

            GUARDARPRODCUTO();
            CargarProductos();
            LimpiarVariables();
        }


        public void LimpiarVariables()

        {

            Session["ID_PRODUCTO_GUARDADO"] = 0;
            txtElemento.Text = "";
            txtDetalles.Text = "";
            txtPrecio.Text = "";
            ImagenOriginal = null;
            imgpaciente.ImageUrl = "~/images/NingunProducto.png";
            txtCodigo.Text = "";

        }

        byte[] datos = new byte[0];
        public void CargarDatosProductos()
        {

            try
            {
                Boolean Existe_Usuario = false;
                int existe_foto = 0;
                if (leer != null)
                {
                    leer.Close();
                }
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PRODUCTOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID_PRODUCTO", SqlDbType.Int).Value = Session["ID_PRODUCTO_GUARDADO"];
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    Existe_Usuario = true;
                    txtElemento.Text = leer.GetString(0);
                    txtPrecio.Text = leer.GetString(1);
                    checEstado.Checked = leer.GetBoolean(2);
                    txtDetalles.Text = leer.GetString(3);
                    txtDCategoria.SelectedValue = leer.GetInt32(4).ToString();
                    txtCodigo.Text = leer.GetString(5);
                    existe_foto = leer.GetInt32(6);

                    if (existe_foto == 1)
                    {
                        ImagenOriginal = (byte[])leer["FOTO"];
                    }

                    if (existe_foto == 1)
                    {
                        string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);
                        imgpaciente.ImageUrl = ImagenDataUrl64;
                    }
                    else
                    {
                        string ImagenDataUrl64 = "~/images/NingunProducto.png";
                        imgpaciente.ImageUrl = ImagenDataUrl64;
                    }

                }
                conn.Close();
                leer.Close();



            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error', 'Error de Comandos!', 'error');", true);

            }
        }

        public void CargarProductos()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PRODUCTOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID_CATEGORIA", SqlDbType.Int).Value = txtDCategoria.SelectedValue;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                tablaconsultaRESERVA.DataSource = dt;
                tablaconsultaRESERVA.DataBind();
                conn.Close();

                if (tablaconsultaRESERVA.Rows.Count == 0)
                {
                    DataTable Tabla = new DataTable();
                    Tabla.Columns.Add("ID");
                    Tabla.Columns.Add("CODIGO");
                    Tabla.Columns.Add("PRODUCTO");
                    Tabla.Columns.Add("DETALLES");
                    Tabla.Columns.Add("PRECIO");
                    Tabla.Columns.Add("ESTADO");
                    Tabla.Columns.Add("FOTO");
                    Tabla.Rows.Add(Tabla.NewRow());
                    tablaconsultaRESERVA.DataSource = Tabla;
                    tablaconsultaRESERVA.DataBind();
                    tablaconsultaRESERVA.Rows[0].Visible = false;

                    txtAlertTablarESERVA.Visible = true;
                }
                else
                {
                    txtAlertTablarESERVA.Visible = false;
                }

            }
            catch (Exception error)
            {

            }

        }

        protected void tablaconsultaRESERVA_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Session["ID_PRODUCTO_GUARDADO"] = (((Label)(tablaconsultaRESERVA.Rows[e.RowIndex].FindControl("txtID"))).Text);
            CargarDatosProductos();
            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar()", true);

            }
        }


        protected void tablaconsultaRESERVA_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewState["ID_DATO"] = (((Label)(tablaconsultaRESERVA.Rows[e.RowIndex].FindControl("txtID"))).Text);
            ELIMINARCOMPONENTETABLA();

            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Eliminado!', 'Datos Eliminados con Exito!', 'success');", true);
            CargarProductos();
        }

        public void ELIMINARCOMPONENTETABLA()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PRODUCTOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = ViewState["ID_DATO"];
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 8;
                int resultado = cmd.ExecuteNonQuery();
                conn.Close();


            }
            catch (Exception)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);

            }


        }

        public void CargarConsulta()
        {
            try
            {
                if (txtBuscarProdcuto.Text != "")
                {
                    try
                    {
                        if (conn.State == System.Data.ConnectionState.Closed)
                        {
                            conn.Open();
                        }
                        SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PRODUCTOS]", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@NOMBRE_PRODUCTO", SqlDbType.NVarChar).Value = txtBuscarProdcuto.Text;
                        cmd.Parameters.Add("@CODIGO", SqlDbType.NVarChar).Value = txtBuscarProdcuto.Text;
                        cmd.Parameters.Add("@ID_CATEGORIA", SqlDbType.Int).Value = txtDCategoria.SelectedValue;
                        cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                        cmd.ExecuteNonQuery();

                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        //Enlazo mis datos obtenidos en el DataTable con el grid
                        tablaconsultaRESERVA.DataSource = dt;
                        tablaconsultaRESERVA.DataBind();
                        conn.Close();

                        if (tablaconsultaRESERVA.Rows.Count == 0)
                        {
                            DataTable Tabla = new DataTable();
                            Tabla.Columns.Add("ID");
                            Tabla.Columns.Add("CODIGO");
                            Tabla.Columns.Add("PRODUCTO");
                            Tabla.Columns.Add("DETALLES");
                            Tabla.Columns.Add("PRECIO");
                            Tabla.Columns.Add("ESTADO");
                            Tabla.Columns.Add("FOTO");
                            Tabla.Rows.Add(Tabla.NewRow());
                            tablaconsultaRESERVA.DataSource = Tabla;
                            tablaconsultaRESERVA.DataBind();
                            tablaconsultaRESERVA.Rows[0].Visible = false;

                            txtAlertTablarESERVA.Visible = true;
                        }
                        else
                        {
                            txtAlertTablarESERVA.Visible = false;
                        }

                    }
                    catch (Exception error)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Nombre del Producto!', 'info');", true);
                        return;
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Nombre del Producto!', 'info');", true);
                    return;
                }

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error', 'Error de Comandos!', 'error');", true);
            }

        }

        protected void btnbuscarProdcuto_Click(object sender, EventArgs e)
        {
            CargarConsulta();
        }

        protected void btnNuevoElemento_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_PRODUCTO_GUARDADO"]) != 0)
            {
                LimpiarVariables();
            }
            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar()", true);

            }
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Mis_Servicios.aspx");
        }
    }
}