using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddAdvertisement : System.Web.UI.Page
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
        
        string img = "";
        if (file.HasFile)
        {
            SqlCommand cmd = new SqlCommand();
            //string directoryPath = Server.MapPath("") + "../Resources/banner/";
            //if (!Directory.Exists(directoryPath))
            //{
            //    Directory.CreateDirectory(directoryPath);
            //}
            //string path = Server.MapPath("") + "../Resources/banner/";

            string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/banner/"), file.FileName);
            file.SaveAs(filestr);
            img = "Resources/banner/" + file.FileName;
            string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/banner/" + file.FileName));
            Compress.ResizeImage(path, Server.MapPath("~/AResources/banner/" + file.FileName), 550, 300);
            cmd.Connection = cn;
            cmd.CommandText = "insert into Banner (img) values('" + img + "')";
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
           
            BindData();
            
            divSuccess.Visible = true;
            divError.Visible = false;
        }
    }

    protected void BindData()
    {
        try
        {
            DataTable dt = D.GetDataTable("select * from Banner");
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
            D.ExecuteQuery("delete from Banner where Id=" + id);

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
        DataTable dt = D.GetData("select * from Banner where Id=" + lb.CommandArgument);
        if (dt.Rows.Count > 0)
        {

            lbSubmit.Visible = false;
            lbUpdate.Visible = true;
            lbSubmit.CommandArgument = dt.Rows[0]["Id"].ToString();



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

            string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/banner/"), file.FileName);
            file.SaveAs(filestr);
            img = "Resources/banner/" + file.FileName;
            string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/banner/" + file.FileName));
            Compress.ResizeImage(path, Server.MapPath("~/AResources/banner/" + file.FileName), 550, 300);
            cmd.Connection = cn;
            cmd.CommandText = "update Banner set img = '" + img + "' where Id = '" + lbSubmit.CommandArgument + "'";
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            
            BindData();
            lbUpdate.Visible = false;
            lbSubmit.Visible = true;
            divSuccess.Visible = true;
            divError.Visible = false;
        }
        
    }
}