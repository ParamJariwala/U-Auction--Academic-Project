using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddTour : System.Web.UI.Page
{
    Connection D = new Connection();
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ParentingWebsite"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    protected void BindData()
    {
        try
        {
            DataTable dt = D.GetDataTable("select * from [dbo].[TourMaster]");
            if (dt.Rows.Count > 0)
            {
                gv.DataSource = dt;
                gv.DataBind();
            }
            else
            {
                dt = null;
                gv.DataSource = dt;
                gv.DataBind();
            }
        }
        catch { }
    }
    protected void lbUpdate_Click(Object Sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "update TourMaster set VisionTitle = '" + txtvtitle.Text + "',VisionDesc = '" + txtvdesc.Text + "',ProspectTitle = '" + txtmtitle.Text + "',ProspectDesc = '" + txtmdesc.Text + "'";
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            txtmtitle.Text = "";
            txtmdesc.Text = "";
            txtvtitle.Text = "";
            txtvdesc.Text = "";
            BindData();
            divSuccess.Visible = true;
            divError.Visible = false;
        }
        catch
        {
            divSuccess.Visible = false;
            divError.Visible = true;
        }
    }
}