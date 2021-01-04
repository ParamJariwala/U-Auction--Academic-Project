using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddVideo : System.Web.UI.Page
{
    Connection D = new Connection();
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ParentingWebsite"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            BindCategory();
        }
    }
    protected void BindCategory()
    {
        try
        {
            DataTable dt = D.GetDataTable("select * from VideoCategoryMaster");
            if (dt.Rows.Count > 0)
            {
                ddlcategory.DataTextField = "Category";
                ddlcategory.DataValueField = "Id";
                ddlcategory.DataSource = dt;
                ddlcategory.DataBind();
            }

        }
        catch (Exception ex)
        {
        }
    }
    protected void lbSubmit_Click(Object Sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();

        cmd.Connection = cn;
        cmd.CommandText = "insert into VideoMaster (vcid,Title,Url) values('" + ddlcategory.SelectedValue + "','" + txttitle.Text + "','" + txturl.Text + "')";
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();

        BindData();
        Clear();
        divSuccess.Visible = true;
        divError.Visible = false;

    }
    protected void Clear()
    {

        txttitle.Text = "";
        txturl.Text = "";
        ddlcategory.SelectedIndex = 0;
    }

    protected void BindData()
    {
        try
        {
            DataTable dt = D.GetDataTable("select vm.*,vc.category from VideoMaster as vm, VideoCategoryMaster as vc where  vm.vcid = vc.id");
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
            D.ExecuteQuery("delete from VideoMaster where Id=" + id);

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
        DataTable dt = D.GetData("select * from VideoMaster where Id=" + lb.CommandArgument);
        if (dt.Rows.Count > 0)
        {

            lbSubmit.Visible = false;
            lbUpdate.Visible = true;
            lbSubmit.CommandArgument = dt.Rows[0]["Id"].ToString();
            ddlcategory.SelectedValue = dt.Rows[0]["vcid"].ToString();
            txttitle.Text = dt.Rows[0]["title"].ToString();
            txturl.Text = dt.Rows[0]["url"].ToString();


        }
    }
    protected void lbUpdate_Click(Object Sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@ID", lbSubmit.CommandArgument);
            cmd.Connection = cn;
            cmd.CommandText = "update VideoMaster set vcid = '" + ddlcategory.SelectedValue + "', Title = '" + txttitle.Text + "', Url = '" + txturl.Text + "' where Id = '" + lbSubmit.CommandArgument + "'";
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