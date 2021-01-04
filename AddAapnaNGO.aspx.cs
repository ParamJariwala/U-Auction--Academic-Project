using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddAapnaNGO : System.Web.UI.Page
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
            DataTable dt = D.GetDataTable("select * from NGOMaster");
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
        string video = "";
        try
        {
            if (file.HasFile)
            {



                string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/ngo/"), file.FileName);
                file.SaveAs(filestr);
                video = "Resources/ngo/" + file.FileName;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn;
                cmd.CommandText = "update NGOMaster set VideoUrl = '" + video + "', TitleNGO = '" + txttitle.Text + "',Description = '" + FCKeditor1.Value + "'";
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                txttitle.Text = "";
                FCKeditor1.Value = "";
                BindData();
                divSuccess.Visible = true;
                divError.Visible = false;
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn;
                cmd.CommandText = "update NGOMaster set TitleNGO = '" + txttitle.Text + "',Description = '" + FCKeditor1.Value + "'";
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                txttitle.Text = "";
                FCKeditor1.Value = "";
                BindData();
                divSuccess.Visible = true;
                divError.Visible = false;
            }
        }
        catch
        {
            divSuccess.Visible = false;
            divError.Visible = true;
        }
    }
}