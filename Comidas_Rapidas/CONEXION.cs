using Comidas_Rapidas.Properties;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Comidas_Rapidas
{
    public class CONEXION
    {
        public static string ObsenerString()
        {
            return Settings.Default.Conexion;
        }
        public static SqlConnection obtenerCOnexion()
        {
            SqlConnection conn = new SqlConnection(ObsenerString());
            conn.Open();
            return conn;
        }
    }
}