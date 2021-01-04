using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewUserData : System.Web.UI.Page
{
    Connection D = new Connection();
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ParentingWebsite"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            BindDataa();
        }
    }
    protected void BindData()
    {
        //int menuid = Convert.ToInt32(ddldyk.SelectedValue.ToString());
        try
        {
            DataTable dt = D.GetDataTable("select cm.*,cim.city as cityname,sm.name as statename from [dbo].[ClientMaster] as cm left outer join CityMaster as cim on cm.Cityid = cim.ID left outer join StateMaster as sm on sm.stateid = cm.Stateid where LoginType = 1 order by id desc");
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
        }
    }
    protected void BindDataa()
    {
        //int menuid = Convert.ToInt32(ddldyk.SelectedValue.ToString());
        try
        {
            DataTable dt = D.GetDataTable("select cm.*,cim.city as cityname,sm.name as statename from [dbo].[ClientMaster] as cm left outer join CityMaster as cim on cm.Cityid = cim.ID left outer join StateMaster as sm on sm.stateid = cm.Stateid where LoginType = 0 order by id desc");
            if (dt.Rows.Count > 0)
            {
                gv1.DataSource = dt;
                gv1.DataBind();
            }
            else
            {
                dt = null;
                gv1.DataSource = dt;
                gv1.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void lbDelete_Click(Object Sender, EventArgs e)
    {
        try
        {
            LinkButton lb = (LinkButton)Sender;
            int id = Convert.ToInt32(lb.CommandArgument.ToString());
            D.ExecuteQuery("delete from ClientMaster where Id=" + id);

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
        try
        {
            LinkButton lb = (LinkButton)Sender;
            int id = Convert.ToInt32(lb.CommandArgument.ToString());
            D.ExecuteQuery("update ClientMaster set LoginType = 0 where Id=" + id);

            divSuccess.Visible = true;
            divError.Visible = false;

            BindData();
            BindDataa();
        }
        catch (Exception ex)
        {
            divError.Visible = true;
            divSuccess.Visible = false;
        }
    }
    protected void lbDelete1_Click(Object Sender, EventArgs e)
    {
        try
        {
            LinkButton lb = (LinkButton)Sender;
            int id = Convert.ToInt32(lb.CommandArgument.ToString());
            D.ExecuteQuery("delete from ClientMaster where Id=" + id);

            divSuccess.Visible = true;
            divError.Visible = false;

            BindDataa();
        }
        catch (Exception ex)
        {
            divError.Visible = true;
            divSuccess.Visible = false;
        }
    }
    protected void lbEdit1_Click(Object Sender, EventArgs e)
    {
        try
        {
            LinkButton lb = (LinkButton)Sender;
            int id = Convert.ToInt32(lb.CommandArgument.ToString());
            D.ExecuteQuery("update ClientMaster set LoginType = 1 where Id=" + id);

            divSuccess.Visible = true;
            divError.Visible = false;
            BindData();
            BindDataa();
        }
        catch (Exception ex)
        {
            divError.Visible = true;
            divSuccess.Visible = false;
        }
    }
}