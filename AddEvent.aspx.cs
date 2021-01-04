using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddEvent : System.Web.UI.Page
{
    //Connection D = new Connection();
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ParentingWebsite"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            BindState();
            BindCity();
        }
    }
    protected void BindState()
    {
        try
        {
            DataTable dt = D.GetDataTable("select * from [dbo].[StateMaster]");
            if (dt.Rows.Count > 0)
            {
                ddlstate.DataTextField = "Name";
                ddlstate.DataValueField = "stateid";
                ddlstate.DataSource = dt;
                ddlstate.DataBind();
            }

        }
        catch (Exception ex)
        {
        }
    }
    protected void ddlstate_SelectedIndexChanged(Object Sender, EventArgs e)
    {
        BindCity();
    }
    protected void BindCity()
    {
        int stateid = Convert.ToInt32(ddlstate.SelectedValue.ToString());
        try
        {
            DataTable dt = D.GetDataTable("select * from [dbo].[CityMaster] where stateid = " + stateid);
            if (dt.Rows.Count > 0)
            {
                ddlcity.DataTextField = "city";
                ddlcity.DataValueField = "Id";
                ddlcity.DataSource = dt;
                ddlcity.DataBind();
            }

        }
        catch (Exception ex)
        {
        }
    }
    protected void lbSubmit_Click(Object Sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        string img = "";
        if (file.HasFile)
        {

            //string directoryPath = Server.MapPath("") + "../Resources/banner/";
            //if (!Directory.Exists(directoryPath))
            //{
            //    Directory.CreateDirectory(directoryPath);
            //}
            //string path = Server.MapPath("") + "../Resources/banner/";

            string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/Event/"), file.FileName);
            file.SaveAs(filestr);
            img = "Resources/Event/" + file.FileName;
            string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/Event/" + file.FileName));
            Compress.ResizeImage(path, Server.MapPath("~/AResources/Event/" + file.FileName), 550, 300);
            cmd.Connection = cn;
            cmd.CommandText = "insert into EventMaster (Title,Img,Location,Date,Type,Address,Description) values('" + txttitle.Text + "','" + img + "','" + ddlcity.SelectedValue + "','" + txtdate.Text + "','" + ddltype.SelectedValue + "','" + txtaddress.Text + "','" + FCKeditor1.Value + "')";
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

            BindData();

            divSuccess.Visible = true;
            divError.Visible = false;
        }
        else
        {
            cmd.Connection = cn;
            cmd.CommandText = "insert into EventMaster (Title,Location,Date,Type,Latitude,Longitude,Address,Description) values('" + txttitle.Text + "','" + ddlcity.SelectedValue + "','" + txtdate.Text + "','" + ddltype.SelectedValue + "','" + txtaddress.Text + "','" + FCKeditor1.Value + "')";
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

            BindData();
            Clear();
            divSuccess.Visible = true;
            divError.Visible = false;
        }
    }
    protected void Clear()
    {
        txttitle.Text = "";
        //txtlocation.Text = "";
        ddlstate.SelectedIndex = 0;
        ddlcity.SelectedIndex = 0;
        txtdate.Text = "";
        txtaddress.Text = "";
        //txtlatitude.Text = "";
        //txtlongitude.Text = "";
        FCKeditor1.Value = "";
        ddltype.SelectedIndex = 0;
    }
    protected void BindData()
    {
        try
        {
            DataTable dt = D.GetDataTable("select em.*,cm.city as cityname from [dbo].[EventMaster] as em,CityMaster as cm where cm.id = em.location");
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
            D.ExecuteQuery("delete from EventMaster where Id=" + id);

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
        DataTable dt = D.GetData("select * from EventMaster where Id=" + lb.CommandArgument);
        if (dt.Rows.Count > 0)
        {

            lbSubmit.Visible = false;
            lbUpdate.Visible = true;
            lbSubmit.CommandArgument = dt.Rows[0]["Id"].ToString();
            FCKeditor1.Value = dt.Rows[0]["Description"].ToString();
            txttitle.Text = dt.Rows[0]["Title"].ToString();
            //txtlocation.Text = dt.Rows[0]["Location"].ToString();
            ddlstate.SelectedValue = dt.Rows[0]["stateid"].ToString();
            BindCity();
            ddlcity.SelectedValue = dt.Rows[0]["Location"].ToString();
            txtdate.Text = Convert.ToDateTime(dt.Rows[0]["Date"].ToString()).ToString("yyyy-MM-dd");
            txtaddress.Text = dt.Rows[0]["Address"].ToString();
            //txtlatitude.Text = dt.Rows[0]["Latitude"].ToString();
            //txtlongitude.Text = dt.Rows[0]["Longitude"].ToString();
            FCKeditor1.Value = dt.Rows[0]["Description"].ToString();


        }
    }
    protected void lbUpdate_Click(Object Sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@ID", lbSubmit.CommandArgument);
        string img = "";
        if (file.HasFile)
        {
            //string directoryPath = Server.MapPath("") + "../Resources/banner/";
            //if (!Directory.Exists(directoryPath))
            //{
            //    Directory.CreateDirectory(directoryPath);
            //}
            //string path = Server.MapPath("") + "../Resources/banner/";

            string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/Event/"), file.FileName);
            file.SaveAs(filestr);
            img = "Resources/Event/" + file.FileName;
            string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/Event/" + file.FileName));
            Compress.ResizeImage(path, Server.MapPath("~/AResources/Event/" + file.FileName), 550, 300);
            cmd.Connection = cn;
            cmd.CommandText = "update EventMaster set Title = '" + txttitle.Text + "', img = '" + img + "', Stateid = '" + ddlstate.SelectedValue + "', Location = '" + ddlcity.SelectedValue + "', Date = '" + txtdate.Text + "', Type = '" + ddltype.SelectedValue + "', Address = '" + txtaddress.Text + "', Description = '" + FCKeditor1.Value + "' where Id = '" + lbSubmit.CommandArgument + "'";
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
        else
        {
            cmd.Connection = cn;
            cmd.CommandText = "update EventMaster set Title = '" + txttitle.Text + "', Stateid = '" + ddlstate.SelectedValue + "', Location = '" + ddlcity.SelectedValue + "', Date = '" + txtdate.Text + "', Type = '" + ddltype.SelectedValue + "', Address = '" + txtaddress.Text + "', Description = '" + FCKeditor1.Value + "' where Id = '" + lbSubmit.CommandArgument + "'";
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
    }
}