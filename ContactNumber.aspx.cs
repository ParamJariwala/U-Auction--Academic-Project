using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ContactNumber : System.Web.UI.Page
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
    protected void lbSubmit_Click(Object Sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "insert into ContactUsNumbers (Name,Mobile) values('" + txtname.Text + "','" + txtno.Text + "')";
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

            BindData();
            Clear();
            divSuccess.Visible = true;
            divError.Visible = false;
        }
        catch
        {

        }
    }
    protected void Clear()
    {
        
        txtname.Text = "";
        txtno.Text = "";
    }
    protected void BindData()
    {
        try
        {
            DataTable dt = D.GetDataTable("select * from ContactUsNumbers");
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

    protected void lbDelete_Click(Object Sender, EventArgs e)
    {
        try
        {
            LinkButton lb = (LinkButton)Sender;
            int id = Convert.ToInt32(lb.CommandArgument.ToString());
            D.ExecuteQuery("delete from ContactUsNumbers where Id=" + id);

            divSuccess.Visible = true;
            divError.Visible = false;

            BindData();
        }
        catch (Exception ex)
        {
            divError.Visible = true;
            divSuccess.Visible = false;
        }
    }
    protected void lbEdit_Click(Object Sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)Sender;
        int id = Convert.ToInt32(lb.CommandArgument);
        DataTable dt = D.GetData("select * from ContactUsNumbers where Id=" + lb.CommandArgument);
        if (dt.Rows.Count > 0)
        {

            lbSubmit.Visible = false;
            lbUpdate.Visible = true;
            lbSubmit.CommandArgument = dt.Rows[0]["Id"].ToString();
            txtname.Text = dt.Rows[0]["Name"].ToString();
            txtno.Text = dt.Rows[0]["mobile"].ToString();


        }
    }
    protected void lbUpdate_Click(Object Sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@ID", lbSubmit.CommandArgument);
            cmd.Connection = cn;
            cmd.CommandText = "update ContactUsNumbers set Name = '" + txtname.Text + "', Mobile = '" + txtno.Text + "' where Id = '" + lbSubmit.CommandArgument + "'";
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            Clear();
            BindData();
            lbUpdate.Visible = false;
            lbSubmit.Visible = true;
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