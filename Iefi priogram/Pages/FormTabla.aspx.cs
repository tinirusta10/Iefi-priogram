using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Iefi_priogram.Pages
{
    public partial class FormTabla : System.Web.UI.Page
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
                            this.lbltitulo.Text = "Registrar Equipo";
                            this.BtnCreate.Visible = true;
                            break;

                        case "U":
                            this.lbltitulo.Text = "Actualizar Equipo";
                            this.BtnUpdate.Visible = true;
                            break;
                        case "D":
                            this.lbltitulo.Text = "Eliminar Equipo";
                            this.BtnDelete.Visible = true;
                            break;
                    }
                }
            }
        }

        protected void BtnCreate_click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_CreateTabla", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Equipo", SqlDbType.NVarChar).Value = txtEquipo.Text;
            cmd.Parameters.Add("@Puntos", SqlDbType.NVarChar).Value = txtpuntos.Text;
            cmd.Parameters.Add("@Partidos_Jugados", SqlDbType.NVarChar).Value = txtjugados.Text;
            cmd.Parameters.Add("@Goles_Favor", SqlDbType.NVarChar).Value = txtgolesfavor.Text;
           
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Tablas.aspx");

        }


        void CargarDatos()
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("sp_read_tabla", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@Id_tabla", SqlDbType.Int).Value = sID;
            DataSet ds = new DataSet();
            ds.Clear();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            DataRow row = dt.Rows[0];
            txtEquipo.Text = row["Equipo"].ToString();
            txtpuntos.Text = row["Puntos"].ToString();
            txtjugados.Text = row["Partidos_Jugados"].ToString();
            txtgolesfavor.Text = row["Goles_Favor"].ToString();
           
            
            
            con.Close();

        }

        protected void BtnUpdate_click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_ActualizarTabla", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id_tabla", SqlDbType.Int).Value = sID;
            cmd.Parameters.Add("@Equipo", SqlDbType.NVarChar).Value = txtEquipo.Text;
            cmd.Parameters.Add("@Puntos", SqlDbType.NVarChar).Value = txtpuntos.Text;
            cmd.Parameters.Add("@Partidos_Jugados", SqlDbType.Decimal).Value = txtjugados.Text;
            cmd.Parameters.Add("@Goles_Favor", SqlDbType.NVarChar).Value = txtgolesfavor.Text;
                cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Tablas.aspx");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_BorrarTabla", con);
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id_tabla", SqlDbType.Int).Value = sID;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Tablas.aspx");
        }
    }
}