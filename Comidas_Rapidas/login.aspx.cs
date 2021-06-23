using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;

namespace Comidas_Rapidas
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection conn = CONEXION.obtenerCOnexion();
        SqlDataReader leer = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["USUARIO_ACTIVO"]) == 0)
            {
                txtUsuario.Enabled = true;
                txtContras.Enabled = true;
                btningresa.Enabled = true;
            }
        }

     
        public int ID_USUARIO_CONSULTA, ID_TERCERO_USUARIO_CONSULTA, ID_PERFIL_USUARIO;
        public string USER_NAME;
        public Boolean USUARIO_VALIDO = false;
        public void ValidarUsuario()
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
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_USUARIOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@USUARIO", SqlDbType.NVarChar).Value = txtUsuario.Text;
                cmd.Parameters.Add("@PASSWORD", SqlDbType.NVarChar).Value = txtContras.Text;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    ID_USUARIO_CONSULTA = leer.GetInt32(0);
                    ID_TERCERO_USUARIO_CONSULTA = leer.GetInt32(1);
                    USER_NAME = leer.GetString(2);
                    ID_PERFIL_USUARIO = leer.GetInt32(4);
                    USUARIO_VALIDO = true;
                }
                conn.Close();
                leer.Close();
            }
            catch (Exception ERROR)
            {
                throw ERROR;
            }
        }

        public void LimpiarVariablesSesion()
        {
            Session["ID_TERCERO_USUARIO"] = null;
            Session["NUMERO_IDENTIFICACION"] = null;
            Session["Nombre_COMPLETO_USUARIO"] = null;
            Session["USUARIO"] = null;
            Session["ID_PERFIL_USUARIO"] = null;
            Session["TIPO_IDENTIFICACION"] = null;
            Session["EMAIL"] = null;
            Session["NOMBRE_MAQUINA"] = Request.ServerVariables["REMOTE_HOST"];//Environment.MachineName;
            Session["IP_PC"] = Request.ServerVariables["REMOTE_ADDR"];//Convert.ToString(BUSCAR_IP[1]);
            //////////////////////////////
            ///
            Session["ID_TERCERO_busqueda_usuario"] = null;
            Session["NOMBRE_TERCERO_busqueda_usuario"] = null;
            Session["TIPO_IDENTIFICACION_busqueda_usuario"] = null;
            Session["NUMERO_IDENTIFICACION_busqueda_usuario"] = null;

        }
        [Obsolete]
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LimpiarVariablesSesion();
            //  Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);

            ValidarUsuario();
            // CargarImagenUsuario();
            if (USUARIO_VALIDO == true)
            {
                //  PaginaInicial.ACITVO = true;
                Session["USUARIO_ACTIVO"] = 1;
                Session["PERMISO"] = "0";
                CargarDatosUsuario();
                Page.RegisterStartupScript("<script>", "<script>window.open('ADMIN/Inicio.aspx' ,'Total Web','screen.height=654', 'screen.width=1366', )</script>");
                //Response.Redirect("SeleccionarSede.aspx");
                //Response.Redirect("Mainframe/Iframe.aspx");
                txtUsuario.Enabled = false;
                txtContras.Enabled = false;
                btningresa.Enabled = false;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Verifique', 'Usuario o contraseña incorrecto!', 'info');", true);
            }
        }

        public void CargarDatosUsuario()
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
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_USUARIOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@USUARIO", SqlDbType.NVarChar).Value = txtUsuario.Text;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;

                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    Session["ID_TERCERO_USUARIO"] = leer.GetInt32(0);
                    Session["NUMERO_IDENTIFICACION"] = leer.GetString(1);
                    Session["Nombre_COMPLETO_USUARIO"] = leer.GetString(2);
                    Session["USUARIO"] = leer.GetString(3);  
                    Session["TIPO_IDENTIFICACION"] = leer.GetString(4);

                }
                conn.Close();
                leer.Close();
            }
            catch (Exception ERROR)
            {
                throw ERROR;
            }
        }
    }
}