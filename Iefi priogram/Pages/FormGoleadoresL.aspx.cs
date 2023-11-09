using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



namespace Iefi_priogram.Pages
{
    public partial class FormGoleadoresL : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);
        public static string sID = "-1";
        public static string sOpc = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BtnCreate.Visible = false;

                if (Request.QueryString["id"] != null)
                {
                    sID = Request.QueryString["id"].ToString();
                    CargarDatos();
                }
                if (Request.QueryString["op"] != null)
                {
                    sOpc = Request.QueryString["op"].ToString();

                    switch (sOpc)
                    {
                        case "C":
                            this.lbltitulo.Text = "Registrar Jugador";
                            this.BtnCreate.Visible = true;
                            break;

                        case "U":
                            this.lbltitulo.Text = "Actualizar Jugador";
                            BtnUpdate.Visible = true;
                            break;

                        case "D":
                            this.lbltitulo.Text = "Eliminar Jugador";
                            this.BtnDelete.Visible = true;
                            break;
                    }
                }
            }
        }

        protected void BtnCreate_click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_createGolLocal", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Equipo", SqlDbType.NVarChar).Value = ddlEquipo.SelectedValue;
                cmd.Parameters.Add("@Nombre", SqlDbType.NVarChar).Value = txtNombre.Text;
                cmd.Parameters.Add("@Apellido", SqlDbType.NVarChar).Value = txtApellido.Text;
                cmd.Parameters.Add("@Posicion", SqlDbType.NVarChar).Value = ddlPos.SelectedValue;
                cmd.Parameters.Add("@Goles", SqlDbType.NVarChar).Value = txtGoles.Text;

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("GoleadoresLocales.aspx");
            }
        }

        void CargarDatos()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("sp_readGolLocal", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@Id_goleadoresL", SqlDbType.Int).Value = sID;
                DataSet ds = new DataSet();
                ds.Clear();
                da.Fill(ds);
                DataTable dt = ds.Tables[0];
                DataRow row = dt.Rows[0];
                ddlEquipo.SelectedValue = row["Equipo"].ToString();
                txtNombre.Text = row["Nombre"].ToString();
                txtApellido.Text = row["Apellido"].ToString();
                ddlPos.SelectedValue = row["Posicion"].ToString();
                txtGoles.Text = row["Goles"].ToString();

                con.Close();
            }
        }

        protected void BtnUpdate_click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_ActualizarGolLocal", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Id_goleadoresL", SqlDbType.Int).Value = sID;
                cmd.Parameters.Add("@Equipo", SqlDbType.NVarChar).Value = ddlEquipo.SelectedValue;
                cmd.Parameters.Add("@Nombre", SqlDbType.NVarChar).Value = txtNombre.Text;
                cmd.Parameters.Add("@Apellido", SqlDbType.NVarChar).Value = txtApellido.Text;
                cmd.Parameters.Add("@Posicion", SqlDbType.NVarChar).Value = ddlPos.SelectedValue;
                cmd.Parameters.Add("@Goles", SqlDbType.NVarChar).Value = txtGoles.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("GoleadoresLocales.aspx");
            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_BorrarGolLocal", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id_goleadoresL", SqlDbType.Int).Value = sID;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("GoleadoresLocales.aspx");
        }
    }
}