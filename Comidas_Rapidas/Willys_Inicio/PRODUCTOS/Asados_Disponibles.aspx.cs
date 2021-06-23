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

namespace Comidas_Rapidas.Willys_Inicio.PRODUCTOS
{
    public partial class Asados_Disponibles : System.Web.UI.Page
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
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 6;
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
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 13;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                ListView1.DataSource = dt;
                ListView1.DataBind();
                conn.Close();


            }
            catch (Exception error)
            {

            }

        }

        protected void Unnamed_PreRender(object sender, EventArgs e)
        {
            //NO ENTRA AL CONSULTAR PRODUCTO
            if (Convert.ToInt32(ViewState["CONSULTAR"]) == 0)
            {
                CargarProductos();
            }

            ViewState["CONSULTAR"] = 0;
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Willys_Inicio/Servicios.aspx");

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Label catLabel = (Label)e.Item.FindControl("txtIDPROCUTO");
            Session["ID_PRODUCTO"] = catLabel.Text;
            Label txtNProducto = (Label)e.Item.FindControl("txtNombreProducto");
            ViewState["NOMBRE_PRODUCTO"] = txtNProducto.Text;
            Label txtDProducto = (Label)e.Item.FindControl("TXTDETALLEpROCDUTO");
            ViewState["DETALLE_PRODUCTO"] = txtDProducto.Text;
            Label txtPProducto = (Label)e.Item.FindControl("TXTpRECIOpRDTO");
            ViewState["PRECIO_PRODUCTO"] = txtPProducto.Text;

            txtElemento.Text = ViewState["NOMBRE_PRODUCTO"].ToString();
            txtDetalles.Text = ViewState["DETALLE_PRODUCTO"].ToString();
            txtPrecio.Text = ViewState["PRECIO_PRODUCTO"].ToString();

            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar()", true);

            }
        }

        protected void btnGuardarProducto_Click(object sender, EventArgs e)
        {
            if (txtCantidad.Text == "" || txtCantidad.Text == "0")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Cantidad de Productos!', 'info');", true);
                return;
            }

            if (txtNombreCliente.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Nombre Completo!', 'info');", true);
                return;
            }

            if (txtTelefono.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Número  de Telefono!', 'info');", true);
                return;
            }

            if (txtDireccion.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Dirección!', 'info');", true);
                return;
            }

            if (txtDcorreo.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Correo!', 'info');", true);
                return;
            }

            Guardar_Solicitud();
            LimpiarVariables();
        }

        public void LimpiarVariables()

        {

            txtCantidad.Text = "";
            txtNombreCliente.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
            txtDcorreo.Text = "";
            txtAnotaciones.Text = "";
            txtTotalPago.Text = "";

        }

        public void Guardar_Solicitud()
        {


            try
            {
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_SOLICITUD_PEDIDOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //if (Convert.ToInt32(Session["ID_PERSONAL_GUARDADO"]) != 0)
                //{
                //    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Session["ID_PERSONAL_GUARDADO"];

                //}
                cmd.Parameters.Add("@ID_PRODUCTO", SqlDbType.Int).Value = Session["ID_PRODUCTO"];

                cmd.Parameters.Add("@ID_CATEGORIA", SqlDbType.Int).Value = Convert.ToInt32(txtDCategoria.SelectedValue);
                cmd.Parameters.Add("@CANTIDAD", SqlDbType.Int).Value = txtCantidad.Text.ToString();
                cmd.Parameters.Add("@VALOR_PAGAR", SqlDbType.Money).Value = txtTotalPago.Text;
                cmd.Parameters.Add("@NOMBRE_CLIENTE", SqlDbType.NVarChar).Value = txtNombreCliente.Text;
                cmd.Parameters.Add("@TELEFONO", SqlDbType.NVarChar).Value = txtTelefono.Text;
                cmd.Parameters.Add("@DIRECCION", SqlDbType.NVarChar).Value = txtDireccion.Text;
                cmd.Parameters.Add("@CORREO", SqlDbType.NVarChar).Value = txtDcorreo.Text;
                cmd.Parameters.Add("@ANOTACIONES", SqlDbType.NVarChar).Value = txtAnotaciones.Text;               
                cmd.Parameters.Add("@ES_ENTREGADO", SqlDbType.Bit).Value = 0;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.ExecuteNonQuery();
                conn.Close();

                if (cmd != null)
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Realizado!', 'Solicitud Realizada con Éxito!', 'success');", true);

                    //if (Convert.ToInt32(Session["ID_PERSONAL_GUARDADO"]) == 0)
                    //{

                    //}
                    //else
                    //{
                    //    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Actualizado!', 'Actualizado con Éxito!', 'success');", true);

                    //}

                }
            }
            catch (Exception)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);
            }


        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            decimal TOTAL = 0;
            TOTAL = Convert.ToDecimal(txtCantidad.Text) * Convert.ToDecimal(txtPrecio.Text);
            txtTotalPago.Text = TOTAL.ToString();

            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar()", true);

            }
        }

        protected void btnbuscarProdcuto_Click(object sender, EventArgs e)
        {
            CargarConsulta();
        }

        public void CargarConsulta()
        {
            try
            {
                if (txtBuscarProdcuto.Text != "")
                {

                    ViewState["CONSULTAR"] = 1;

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
                        cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 14;
                        cmd.ExecuteNonQuery();

                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        //Enlazo mis datos obtenidos en el DataTable con el grid
                        ListView1.DataSource = dt;
                        ListView1.DataBind();
                        conn.Close();

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
    }
}