using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddAlbum : System.Web.UI.Page
{
    Connection D = new Connection();

    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ParentingWebsite"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divSuccess.Visible = false;
            divError.Visible = false;
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

                string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/Album/"), file.FileName);
                file.SaveAs(filestr);
                img = "Resources/Album/" + file.FileName;
                string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/Album/" + file.FileName));
                Compress.ResizeImage(path, Server.MapPath("~/AResources/Album/" + file.FileName), 550, 250);
                D.ExecuteQuery("insert into AlbumMaster (Name,img) values('" + txttitle.Text + "','" + img + "')");
                BindData();
                txttitle.Text = "";
                divSuccess.Visible = true;
                divError.Visible = false;
            }
            else
            {
                divSuccess.Visible = false;
                divError.Visible = true;
            }
        }
        catch
        {
            divSuccess.Visible = false;
            divError.Visible = true;
        }
        
    }
    protected void BindData()
    {
        try
        {
            DataTable dt = D.GetDataTable("select * from AlbumMaster");
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
            D.ExecuteQuery("delete from AlbumMaster where Id=" + id);

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
        DataTable dt = D.GetData("select * from AlbumMaster where Id=" + lb.CommandArgument);
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
                string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/Album/"), file.FileName);
                file.SaveAs(filestr);
                img = "Resources/Album/" + file.FileName;
                string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/Album/" + file.FileName));
                Compress.ResizeImage(path, Server.MapPath("~/AResources/Album/" + file.FileName), 550, 250);
                D.ExecuteQuery("update AlbumMaster set Name = '" + txttitle.Text + "', img = '" + img + "' where Id = '" + lbSubmit.CommandArgument + "'");
               
                BindData();
                txttitle.Text = "";
                lbUpdate.Visible = false;
                lbSubmit.Visible = true;
                divSuccess.Visible = true;
                divError.Visible = false;
            }
            else
            {
                D.ExecuteQuery("update AlbumMaster set Name = '" + txttitle.Text + "' where Id = '" + lbSubmit.CommandArgument + "'");

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