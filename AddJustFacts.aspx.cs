using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddJustFacts : System.Web.UI.Page
{
    Connection D = new Connection();
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ParentingWebsite"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
            BindData();
            
        }
    }
    protected void BindCategory()
    {
        try
        {
            DataTable dt = D.GetDataTable("select * from [dbo].[MenuMasterAnd] where parentid = 1");
            if (dt.Rows.Count > 0)
            {
                ddldyk.DataTextField = "name";
                ddldyk.DataValueField = "Id";
                ddldyk.DataSource = dt;
                ddldyk.DataBind();
            }

        }
        catch (Exception ex)
        {
        }
    }
    protected void ddldyk_SelectedIndexChanged(Object Sender, EventArgs e)
    {
        BindData();
    }
    protected void lbSubmit_Click(Object Sender, EventArgs e)
    {
        try
        {
            int menuid = Convert.ToInt32(ddldyk.SelectedValue.ToString());
            DataTable dt = D.GetDataTable("select count(factid)+1 as number from JustFactsMaster where dykid = '" + menuid + "'");
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@TEXT", txttitle.Text.ToString());
            cmd.Connection = cn;
            cmd.CommandText = "insert into JustFactsMaster (dykid,factid,text) values('" + ddldyk.SelectedValue + "','" + dt.Rows[0]["number"].ToString() + "',@TEXT)";
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
            divError.Visible = true;
            divSuccess.Visible = false;
        }
        
    }
    protected void Clear()
    {

        txttitle.Text = "";
        //ddldyk.SelectedIndex = 0;
    }
    protected void BindData()
    {
        int menuid = Convert.ToInt32(ddldyk.SelectedValue.ToString());
        try
        {
            DataTable dt = D.GetDataTable("select jm.*,mm.name as dykname from [dbo].[JustFactsMaster] as jm,MenuMaster as mm where jm.dykid = mm.id and jm.dykid = '" + menuid + "' order by factid");
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
        catch (Exception ex)
        {
            divError.Visible = true;
            divSuccess.Visible = false;
        }
    }
    //protected void lbDelete_Click(Object Sender, EventArgs e)
    //{

    //}
    protected void lbEdit_Click(Object Sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)Sender;
        int id = Convert.ToInt32(lb.CommandArgument);
        DataTable dt = D.GetData("select * from JustFactsMaster where Id=" + lb.CommandArgument);
        if (dt.Rows.Count > 0)
        {

            lbSubmit.Visible = false;
            lbUpdate.Visible = true;
            lbSubmit.CommandArgument = dt.Rows[0]["Id"].ToString();
            ddldyk.SelectedValue = dt.Rows[0]["dykid"].ToString();
            txttitle.Text = dt.Rows[0]["text"].ToString();
            ddldyk.Enabled = false;

        }
    }
    protected void lbUpdate_Click(Object Sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@TEXT", txttitle.Text.ToString());
            cmd.Parameters.AddWithValue("@ID", lbSubmit.CommandArgument);
            cmd.Connection = cn;
            cmd.CommandText = "update JustFactsMaster set dykid = '" + ddldyk.SelectedValue + "', text = @TEXT where Id = '" + lbSubmit.CommandArgument + "'";
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            Clear();
            BindData();
            lbUpdate.Visible = false;
            lbSubmit.Visible = true;
            divSuccess.Visible = true;
            divError.Visible = false;
            ddldyk.Enabled = true;
        }
        catch
        {
            divSuccess.Visible = false;
            divError.Visible = true;
        }
    }
}