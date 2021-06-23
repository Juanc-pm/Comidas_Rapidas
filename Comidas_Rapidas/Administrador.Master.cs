using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Windows;
using System.Web.Security;

namespace Comidas_Rapidas
{
    public partial class Administrador : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = CONEXION.obtenerCOnexion();
            SqlDataReader leer = null;

            if (!IsPostBack)
            {
                txtUsuarioLogeado.Text = Session["Nombre_COMPLETO_USUARIO"].ToString();
            }

            
        }

        protected void CerrarSesion_Click(object sender, EventArgs e)
        {
            
            //btncerrarcesion.Attributes.Add("onclick", "cerrarpagina();");
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            Response.Write("<script>window.close();</script>");
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));

        }

        protected void btnUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ADMIN/PRODUCTOS/Usuarios.aspx");
        }
    }
}