using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comidas_Rapidas
{
    public partial class Productos : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Willys_Inicio/Servicios.aspx");
        }
    }
}