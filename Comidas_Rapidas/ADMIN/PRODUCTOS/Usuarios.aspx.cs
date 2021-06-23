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

namespace Comidas_Rapidas.ADMIN.PRODUCTOS
{
    public partial class Usuarios : System.Web.UI.Page
    {
        SqlConnection conn = CONEXION.obtenerCOnexion();
        SqlCommand cmd = null;
        SqlDataReader leer = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTipoIdentificacion();
                CargarPersonal();
            }
        }

        public void CargarTipoIdentificacion()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PERSONAL_W_S]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 2;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            leer = cmd.ExecuteReader();

            while (leer.Read() != false)
            {
                txttipoidentificacion.DataSource = dt;
                txttipoidentificacion.DataValueField = "ID";
                txttipoidentificacion.DataTextField = "NOMBRE";
                txttipoidentificacion.DataBind();
            }
            conn.Close();
            leer.Close();
        }

        public void Crear_Personal()
        {


            try
            {
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PERSONAL_W_S]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                if (Convert.ToInt32(Session["ID_PERSONAL_GUARDADO"]) != 0)
                {
                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Session["ID_PERSONAL_GUARDADO"];

                }

                cmd.Parameters.Add("@ID_TIPO_IDENTIFICACION", SqlDbType.Int).Value = Convert.ToInt32(txttipoidentificacion.SelectedValue);
                cmd.Parameters.Add("@NUMERO_IDENTIFICACION", SqlDbType.NVarChar).Value = txtidenfiticacion.Text.ToString();
                cmd.Parameters.Add("@PRIMER_NOMBRE", SqlDbType.NVarChar).Value = txtprimernomb.Text;
                cmd.Parameters.Add("@SEGUNDO_NOMBRE", SqlDbType.NVarChar).Value = txtsegundonomb.Text;
                cmd.Parameters.Add("@PRIMER_APELLIDO", SqlDbType.NVarChar).Value = txtprimerapellido.Text;
                cmd.Parameters.Add("@SEGUNDO_APELLIDO", SqlDbType.NVarChar).Value = txtsegundoapellido.Text;
                cmd.Parameters.Add("@NOMBRE_COMPLETO", SqlDbType.NVarChar).Value = txtprimernomb.Text + " " + txtsegundonomb.Text + " " + txtprimerapellido.Text + " " + txtsegundoapellido.Text;
                cmd.Parameters.Add("@DIRECCION", SqlDbType.NVarChar).Value = txtdireccion.Text;
                cmd.Parameters.Add("@TELEFONO1", SqlDbType.NVarChar).Value = txtteluno.Text.ToString();
                cmd.Parameters.Add("@TELEFONO2", SqlDbType.NVarChar).Value = txtteldos.Text.ToString();
                cmd.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = txtemailuno.Text;
                cmd.Parameters.Add("@USUARIO", SqlDbType.NVarChar).Value = Session["USUARIO"];
                cmd.Parameters.Add("@IP_MAQUINA", SqlDbType.NVarChar).Value = Session["Ip_PC"];
                cmd.Parameters.Add("@NOMBRE_MAQUINA", SqlDbType.NVarChar).Value = Session["NOMBRE_MAQUINA"];
                cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = checactivo.Checked;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 1;
                cmd.ExecuteNonQuery();
                conn.Close();

                if (cmd != null)
                {
                    if (Convert.ToInt32(Session["ID_PERSONAL_GUARDADO"]) == 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Guardado!', 'Guardado con Éxito!', 'success');", true);

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Actualizado!', 'Actualizado con Éxito!', 'success');", true);

                    }

                }
            }
            catch (Exception)
            {

                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);
            }


        }

        protected void btnNuevoElemento_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["ID_PERSONAL_GUARDADO"]) != 0)
            {
                LimpiarVariables();
            }
            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar()", true);

            }
        }

        public void LimpiarVariables()

        {

            Session["ID_PERSONAL_GUARDADO"] = 0;
            txtidenfiticacion.Text = "";
            txtprimernomb.Text = "";
            txtsegundonomb.Text = "";
            txtprimerapellido.Text = "";
            txtsegundoapellido.Text = "";
            txtdireccion.Text = "";
            txtteluno.Text = "";
            txtteldos.Text = "";
            txtemailuno.Text = "";


        }
        protected void btnGuardarDatos_Click(object sender, EventArgs e)
        {
            if (txtidenfiticacion.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite número de Identificación!', 'info');", true);
                return;
            }

            if (txtprimernomb.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Primer Nombre!', 'info');", true);
                return;
            }

            if (txtprimerapellido.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Primer Apellido!', 'info');", true);
                return;
            }

            if (txtsegundoapellido.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Segundo Apellido!', 'info');", true);
                return;
            }

            if (txtdireccion.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Dirección!', 'info');", true);
                return;
            }

            if (txtteluno.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Digite Número de Telefono!', 'info');", true);
                return;
            }

            Crear_Personal();
            LimpiarVariables();
            CargarPersonal();
        }

        public void CargarPersonal()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PERSONAL_W_S]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
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
                    Tabla.Columns.Add("NUMERO_IDENTIFICACION");
                    Tabla.Columns.Add("NOMBRE_COMPLETO");
                    Tabla.Columns.Add("ESTADO");
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
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);

            }

        }


        byte[] datos = new byte[0];
        byte[] datosfirma = new byte[0];
        public void CargarDatosUsuarios()
        {

            try
            {
                Boolean Existe_Usuario = false;
                int existe_foto = 0;
                int existe_firma = 0;
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
                cmd.Parameters.Add("@ID_TERCERO", SqlDbType.NVarChar).Value = ViewState["ID_PERSONAL"];
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 3;
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {
                    Existe_Usuario = true;
                    txtusuario.Text = leer.GetString(0);
                    txtconfirmeusuario.Text = leer.GetString(0);
                    checactivo.Checked = leer.GetBoolean(1);
                    DropDownrol.SelectedValue = leer.GetInt32(2).ToString();
                    existe_foto = leer.GetInt32(4);
                    existe_firma = leer.GetInt32(6);
                    if (existe_foto == 1)
                    {
                        ImagenOriginal = (byte[])leer["FOTO"];
                    }
                    if (existe_firma == 1)
                    {
                        ImagenOriginalfirma = (byte[])leer["FIRMA"];
                    }


                }
                conn.Close();
                leer.Close();

                if (Existe_Usuario == true)
                {
                    txtusuario.Enabled = false;
                    txtconfirmeusuario.Enabled = false;
                    txtclave.Enabled = false;
                    txtconfirmeclave.Enabled = false;
                    btnresetearclave.Visible = true;

                    if (existe_foto == 1)
                    {
                        string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);
                        imgpaciente.ImageUrl = ImagenDataUrl64;
                    }
                    if (existe_firma == 1)
                    {
                        string ImagenDataUrl64_FIRMA = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginalfirma);
                        imgfirma.ImageUrl = ImagenDataUrl64_FIRMA;
                    }
                }
                else
                {
                    btnresetearclave.Visible = false;
                    txtclave.Enabled = true;
                    txtconfirmeclave.Enabled = true;
                    txtusuario.Enabled = true;
                    txtconfirmeusuario.Enabled = true;
                }

            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);
            }
        }

        public void CargarDatosPersonal()
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
                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_PERSONAL_W_S]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = Session["ID_PERSONAL_GUARDADO"];
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                leer = cmd.ExecuteReader();
                if (leer.Read() != false)
                {

                    txttipoidentificacion.SelectedValue = leer.GetInt32(1).ToString();
                    txtidenfiticacion.Text = leer.GetString(2);
                    txtprimernomb.Text = leer.GetString(3);
                    txtsegundonomb.Text = leer.GetString(4);
                    txtprimerapellido.Text = leer.GetString(5);
                    txtsegundoapellido.Text = leer.GetString(6);
                    txtdireccion.Text = leer.GetString(8);
                    txtteluno.Text = leer.GetString(9);
                    txtteldos.Text = leer.GetString(10);
                    txtemailuno.Text = leer.GetString(11);
                    checactivo.Checked = leer.GetBoolean(17);


                }
                conn.Close();
                leer.Close();



            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Error', 'Error de Comandos!', 'error');", true);

            }
        }

        protected void tablaconsultaRESERVA_SelectedIndexChanged(object sender, EventArgs e)
        {

            ViewState["ID_PERSONAL"] = (((Label)(tablaconsultaRESERVA.Rows[tablaconsultaRESERVA.SelectedRow.RowIndex].FindControl("txtID"))).Text);

            CargarPerfil();

            CargarDatosUsuarios();

            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar2()", true);

            }
        }

        protected void tablaconsultaRESERVA_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Session["ID_PERSONAL_GUARDADO"] = (((Label)(tablaconsultaRESERVA.Rows[e.RowIndex].FindControl("txtID"))).Text);
            CargarDatosPersonal();
            if (!ClientScript.IsClientScriptBlockRegistered("key"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar()", true);

            }
        }




        public void CargarPerfil()
        {
            DataTable dt = new DataTable();
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }

            SqlCommand cmd = new SqlCommand("select ID,NOMBRE from CONFIGURACION.TR_PERFILES where id=2", conn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            leer = cmd.ExecuteReader();

            while (leer.Read() != false)
            {
                DropDownrol.DataSource = dt;
                DropDownrol.DataTextField = "NOMBRE";
                DropDownrol.DataValueField = "ID";
                DropDownrol.DataBind();
            }
            conn.Close();
            leer.Close();
        }

        public static byte[] ImagenOriginal = null;
        public static byte[] ImagenOriginalfirma = null;
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
                        ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar2()", true);

                    }
                }
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Las dimensiones de la imagen sobrepasa los límites, debe ser una imagen tamaño foto CC!', 'error');", true);
            }
        }


        protected void btnadjuntarfirma_Click(object sender, EventArgs e)
        {
            try
            {
                if (filefirma.FileName.Equals("") == false)
                {
                    int Tamanio = filefirma.PostedFile.ContentLength;
                    ImagenOriginalfirma = new byte[Tamanio];

                    filefirma.PostedFile.InputStream.Read(ImagenOriginalfirma, 0, Tamanio);
                    Bitmap ImagenOriginalBinaria = new Bitmap(filefirma.PostedFile.InputStream);

                    string ImagenDataUrl64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginalfirma);

                    imgfirma.ImageUrl = ImagenDataUrl64;

                    if (!ClientScript.IsClientScriptBlockRegistered("key"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "key", "MostrarMensajeEliminar2()", true);

                    }
                }
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Las dimensiones de la imagen sobrepasa los límites, debe ser una imagen tamaño foto CC!', 'error');", true);

            }


        }

        protected void btnGuardarUsuario_Click(object sender, EventArgs e)
        {
            if (txtusuario.Text == "" | txtconfirmeusuario.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Los usuarios no pueden ser vacios, verifique', 'info');", true);
                return;
            }
            if (txtusuario.Text != txtconfirmeusuario.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Los usuarios no coinciden, verifique', 'info');", true);
                return;
            }
            if (txtclave.Enabled == true)
            {
                if (txtclave.Text == "" | txtconfirmeclave.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Las contraseñas no pueden ser vacias, verifique', 'info');", true);
                    return;
                }
                if (txtclave.Text != txtconfirmeclave.Text)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Las contraseñas no coinciden, verifique', 'info');", true);
                    return;
                }
            }

            //if (DropDownrol.Text == "Seleccione")
            //{
            //    Response.Write("<script>alert('Seleccione ROL, verifique')</script>");
            //    return;
            //}

            GuardarUsuario();
            CargarPersonal();
        }

        public void GuardarUsuario()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_USUARIOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID_TERCERO", SqlDbType.Int).Value = ViewState["ID_PERSONAL"];
                cmd.Parameters.Add("@USER_NAME", SqlDbType.NVarChar).Value = txtusuario.Text;
                cmd.Parameters.Add("@PASSWORD", SqlDbType.NVarChar).Value = txtclave.Text;
                cmd.Parameters.Add("@ID_ROL", SqlDbType.Int).Value =2;
                cmd.Parameters.Add("@ACTIVO", SqlDbType.Bit).Value = checactivo.Checked;

                if (ImagenOriginal != null)
                {
                    cmd.Parameters.Add("@FOTO", SqlDbType.Image).Value = ImagenOriginal;
                }

                if (ImagenOriginalfirma != null)
                {
                    cmd.Parameters.Add("@FIRMA", SqlDbType.Image).Value = ImagenOriginalfirma;
                }

                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 4;
                int Resultado = cmd.ExecuteNonQuery();
                conn.Close();

                if (Resultado != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Guardado!', 'Guardado con Éxito!', 'success');", true);
                }
  
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);
            }
        }


        protected void btnguardarrest_Click(object sender, EventArgs e)
        {
            if (txtnuevaclave.Text == "" | txtconfirmenuevaclave.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Las contraseñas no pueden ser vacias, verifique', 'info');", true);
                return;
            }
            if (txtnuevaclave.Text != txtconfirmenuevaclave.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Información!', 'Las contraseñas no coinciden, verifique', 'info');", true);
                return;
            }
            

            CambiarClave();
        }


        public void CambiarClave()
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("[CONFIGURACION].[STP_USUARIOS]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID_TERCERO", SqlDbType.Int).Value = ViewState["ID_PERSONAL"];
                cmd.Parameters.Add("@PASSWORD", SqlDbType.NVarChar).Value = txtnuevaclave.Text;
                cmd.Parameters.Add("@OPERACION", SqlDbType.Int).Value = 5;
                int Resultado = cmd.ExecuteNonQuery();
                conn.Close();

                if (Resultado != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Guardado!', 'Contraseña Reestablecida con éxito', 'success');", true);
                }
               
            }
            catch (Exception error)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('error', 'Error de Comandos!', 'error');", true);
            }
        }
    }
}