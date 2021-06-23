using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comidas_Rapidas
{
    public partial class AdministradorWS : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //txtUsuarioLogeado.Text = Session["Nombre_COMPLETO_USUARIO"].ToString();
            }
        }
    }
}