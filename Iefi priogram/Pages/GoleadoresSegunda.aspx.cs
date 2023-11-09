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
    public partial class GoleadoresSegunda : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);
        public static string sID = "-1";
        public static string sOpc = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarGoleadorSeg();
        }

        void cargarGoleadorSeg()
        {
            SqlCommand cmd = new SqlCommand("sp_ObtenerGolSegunda", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvGolSeg.DataSource = dt;
            gvGolSeg.DataBind();
            con.Close();
        }

        protected void BtnCreate_click(object sender, EventArgs e)
        {
            Response.Redirect("~/pages/FormGoleadoresSeg.aspx?op=C");

        }

        protected void BtnUpdate_click(object sender, EventArgs e)
        {
            string id;
            Button BtnConsultar = (Button)sender;
            GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
            id = selectedrow.Cells[0].Text;
            Response.Redirect("~/pages/FormGoleadoresSeg.aspx?id=" + id + "&op=U");
        }


        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string id;
            Button BtnConsultar = (Button)sender;
            GridViewRow selectedrow = (GridViewRow)BtnConsultar.NamingContainer;
            id = selectedrow.Cells[0].Text;
            Response.Redirect("~/Pages/FormGoleadoresSeg.aspx?id=" + id + "&op=D");
        }
    }
}