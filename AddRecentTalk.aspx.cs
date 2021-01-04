using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddRecentTalk : System.Web.UI.Page
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

            string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/recenttask/"), file.FileName);
            file.SaveAs(filestr);
            img = "Resources/recenttask/" + file.FileName;
            string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/recenttask/" + file.FileName));
            Compress.ResizeImage(path, Server.MapPath("~/AResources/recenttask/" + file.FileName), 550, 250);
            cmd.Connection = cn;
            cmd.CommandText = "insert into RecentTask (Date,Title,Image,ShortDesc,LongDesc) values('" + txtdate.Text + "','" + txttitle.Text + "','" + img + "','" + txtshort.Text + "','" + FCKeditor1.Value + "')";
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
            cmd.CommandText = "insert into RecentTask (Date,Title,ShortDesc,LongDesc) values('" + txtdate.Text + "','" + txttitle.Text + "','" + txtshort.Text + "','" + FCKeditor1.Value + "')";
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
        FCKeditor1.Value = "";
        txttitle.Text = "";
        txtdate.Text = "";
        txtshort.Text = "";
    }
    protected void BindData()
    {
        try
        {
            DataTable dt = D.GetDataTable("select * from RecentTask");
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
            D.ExecuteQuery("delete from RecentTask where Id=" + id);

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
        DataTable dt = D.GetData("select * from RecentTask where Id=" + lb.CommandArgument);
        if (dt.Rows.Count > 0)
        {

            lbSubmit.Visible = false;
            lbUpdate.Visible = true;
            lbSubmit.CommandArgument = dt.Rows[0]["Id"].ToString();
            txttitle.Text = dt.Rows[0]["Title"].ToString();
            txtdate.Text = Convert.ToDateTime(dt.Rows[0]["Date"].ToString()).ToString("yyyy-MM-dd");
            txtshort.Text = dt.Rows[0]["ShortDesc"].ToString();
            FCKeditor1.Value = dt.Rows[0]["LongDesc"].ToString();
            


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

            string filestr = System.IO.Path.Combine(Server.MapPath("~/Resources/recenttask/"), file.FileName);
            file.SaveAs(filestr);
            img = "Resources/recenttask/" + file.FileName;
            string path = System.IO.Path.GetFullPath(Server.MapPath("~/Resources/recenttask/" + file.FileName));
            Compress.ResizeImage(path, Server.MapPath("~/AResources/recenttask/" + file.FileName), 550, 250);
            cmd.Connection = cn;
            cmd.CommandText = "update RecentTask set Title = '" + txttitle.Text + "',Date = '" + txtdate.Text + "', image = '" + img + "',ShortDesc = '" + txtshort.Text + "', LongDesc = '" + FCKeditor1.Value + "' where Id = '" + lbSubmit.CommandArgument + "'";
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
            cmd.CommandText = "update RecentTask set Title = '" + txttitle.Text + "',Date = '" + txtdate.Text + "',ShortDesc = '" + txtshort.Text + "', LongDesc = '" + FCKeditor1.Value + "' where Id = '" + lbSubmit.CommandArgument + "'";
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