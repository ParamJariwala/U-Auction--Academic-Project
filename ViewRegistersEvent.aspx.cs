using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewRegistersEvent : System.Web.UI.Page
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
        //int menuid = Convert.ToInt32(ddldyk.SelectedValue.ToString());
        try
        {
            DataTable dt = D.GetDataTable("select ed.*,em.Date,em.title,cm.name as username,cim.city as cityname,sm.name as statename from [dbo].[EventDetail] as ed,CityMaster as cim,StateMaster as sm,EventMaster as em,ClientMaster as cm where ed.eventid = em.id and cm.id = ed.userid and ed.Cityid = cim.ID and sm.stateid = ed.Stateid");
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
    protected void lbDelete_Click(Object Sender, EventArgs e)
    {
        try
        {
            LinkButton lb = (LinkButton)Sender;
            int id = Convert.ToInt32(lb.CommandArgument.ToString());
            D.ExecuteQuery("delete from EventDetail where Id=" + id);

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
}