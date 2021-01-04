using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddAlbumImages : System.Web.UI.Page
{
    Connection D = new Connection();
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ParentingWebsite"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divSuccess.Visible = false;
            divError.Visible = false;
            
            BindAlbum();
            BindData();

        }
    }
    protected void lbSubmit_Click(Object Sender, EventArgs e)
    {
        try
        {
            string img = "";
            if (file.HasFile)
            {

                string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/SubAlbum/"), file.FileName);
                file.SaveAs(filestr);
                img = "Resources/SubAlbum/" + file.FileName;
                string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/SubAlbum/" + file.FileName));
                Compress.ResizeImage(path, Server.MapPath("~/AResources/SubAlbum/" + file.FileName), 550, 300);
                D.ExecuteQuery("insert into SubAlbum (albumid,name,img) values('" + ddlalbum.SelectedValue + "','" + txttitle.Text + "','" + img + "')");
                BindData();
                txttitle.Text = "";
                divSuccess.Visible = true;
                divError.Visible = false;
            }
            else
            {
                D.ExecuteQuery("insert into SubAlbum (albumid,name) values('" + ddlalbum.SelectedValue + "','" + txttitle.Text + "')");
                BindData();
                txttitle.Text = "";
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
    protected void BindAlbum()
    {
        try
        {
            DataTable dt = D.GetDataTable("select * from [dbo].[AlbumMaster]");
            if (dt.Rows.Count > 0)
            {
                ddlalbum.DataTextField = "Name";
                ddlalbum.DataValueField = "Id";
                ddlalbum.DataSource = dt;
                ddlalbum.DataBind();
            }

        }
        catch (Exception ex)
        {
        }
    }
    protected void ddlalbum_SelectedIndexChanged(Object Sender, EventArgs e)
    {
        BindData();
    }
    protected void BindData()
    {
        int albumid = Convert.ToInt32(ddlalbum.SelectedValue.ToString());
        try
        {
            DataTable dt = D.GetDataTable("select sa.*,a.name as albumname from [dbo].[SubAlbum] as sa, AlbumMaster as a where sa.albumid = a.id and sa.albumid = " + albumid
                );
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
            D.ExecuteQuery("delete from SubAlbum where Id=" + id);

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
        DataTable dt = D.GetData("select * from SubAlbum where Id=" + lb.CommandArgument);
        if (dt.Rows.Count > 0)
        {

            lbSubmit.Visible = false;
            lbUpdate.Visible = true;
            txttitle.Text = dt.Rows[0]["Name"].ToString();
            lbSubmit.CommandArgument = dt.Rows[0]["Id"].ToString();



        }
    }
    protected void lbUpdate_Click(Object Sender, EventArgs e)
    {
        try
        {
            string img = "";
            if (file.HasFile)
            {
                string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/SubAlbum/"), file.FileName);
                file.SaveAs(filestr);
                img = "Resources/SubAlbum/" + file.FileName;
                string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/SubAlbum/" + file.FileName));
                Compress.ResizeImage(path, Server.MapPath("~/AResources/SubAlbum/" + file.FileName), 550, 300);
                D.ExecuteQuery("update SubAlbum set albumid = '" + ddlalbum.SelectedValue + "',Name = '" + txttitle.Text + "', img = '" + img + "' where Id = '" + lbSubmit.CommandArgument + "'");

                BindData();
                txttitle.Text = "";
                lbUpdate.Visible = false;
                lbSubmit.Visible = true;
                divSuccess.Visible = true;
                divError.Visible = false;
            }
            else
            {
                D.ExecuteQuery("update SubAlbum set albumid = '" + ddlalbum.SelectedValue + "',Name = '" + txttitle.Text + "' where Id = '" + lbSubmit.CommandArgument + "'");

                BindData();
                txttitle.Text = "";
                lbUpdate.Visible = false;
                lbSubmit.Visible = true;
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