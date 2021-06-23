using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Comidas_Rapidas.ADMIN.PRODUCTOS
{
    public partial class Solicitudes_Pedidos : System.Web.UI.Page
    {
        SqlConnection conn = CONEXION.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarSolicitudes();
        }

        public void CargarSolicitudes()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_SOLICITUD_PEDIDOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
                cmd.ExecuteNonQuery();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                //Enlazo mis datos obtenidos en el DataTable con el grid
                tablaconsultaPedidos.DataSource = dt;
                tablaconsultaPedidos.DataBind();
                conn.Close();

                if (tablaconsultaPedidos.Rows.Count == 0)
                {
                    DataTable Tabla = new DataTable();
                    Tabla.Columns.Add("ID");
                    Tabla.Columns.Add("CATEGORIA");
                    Tabla.Columns.Add("PRODUCTO");
                    Tabla.Columns.Add("DIRECCION");
                    Tabla.Columns.Add("CANTIDAD");
                    Tabla.Columns.Add("NOMBRE_CLIENTE");
                    Tabla.Columns.Add("TELEFONO");
                    Tabla.Rows.Add(Tabla.NewRow());
                    tablaconsultaPedidos.DataSource = Tabla;
                    tablaconsultaPedidos.DataBind();
                    tablaconsultaPedidos.Rows[0].Visible = false;

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

        protected void tablaconsultaPedidos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            Session["ID_PRODUCTO_SOLICITADO"] = (((Label)(tablaconsultaPedidos.Rows[e.RowIndex].FindControl("txtID"))).Text);
            CargarDatosPedidos();
            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar()", true);

            }
        }

        public void CargarDatosPedidos()
        {

            try
            {
               
                if (leer != null)
                {
                    leer.Close();
                }
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_SOLICITUD_PEDIDOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Session["ID_PRODUCTO_SOLICITADO"];
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                   
                    txtNombreCliente.Text = leer.GetString(0);
                    txtCorreo.Text = leer.GetString(1);
                    txtDireccion.Text = leer.GetString(2);
                    txtTotal.Text = leer.GetDecimal(3).ToString("0");
                    txtAnotaciones.Text = leer.GetString(4);
                   

                }
                conn.Close();
                leer.Close();



            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error', 'Error de Comandos!', 'error');", true);

            }
        }

        protected void txtRealizarPedido_Click(object sender, EventArgs e)
        {
            GUARDARPRODUCTO();
            CargarSolicitudes();
        }

        public void GUARDARPRODUCTO()
        {

            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_SOLICITUD_PEDIDOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.NVarChar).Value = Session["ID_PRODUCTO_SOLICITADO"];

                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                int Resultado = cmd.ExecuteNonQuery();
                conn.Close();

                if (Resultado != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Realizado!', 'Producto Despachado con Éxito!', 'success');", true);

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
    }
}