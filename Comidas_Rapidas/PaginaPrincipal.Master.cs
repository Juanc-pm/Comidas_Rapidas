using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Comidas_Rapidas
{
    public partial class PaginaPrincipal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtIMG_Click(object sender, ImageClickEventArgs e)
        {
           
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void Unnamed_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Willys_Inicio/Servicios.aspx");
        }
    }
}