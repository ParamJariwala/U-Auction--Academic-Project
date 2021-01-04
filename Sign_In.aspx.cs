using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Sign_In : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["login"] != null)
        {
            divlogin.Visible = true;
            Response.Cookies["login"].Expires = DateTime.Now.AddSeconds(-1);
            Session.Clear();
            Session.Abandon();
        }
        else
        {
            divlogin.Visible = false;
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlConnection SQLConn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + System.IO.Path.Combine(Server.MapPath("\\App_Data\\Database2.mdf")) + ";Integrated Security=True;User Instance=True");
        SqlCommand cmd = new SqlCommand("Select * From User_details Where Username=@uname and Password=@pwd", SQLConn);

        cmd.Parameters.AddWithValue("@uname", txtusername.Text);
        cmd.Parameters.AddWithValue("@pwd", txtpassword.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count.ToString() == "1")
        {
            Response.Cookies["Username"].Value = txtusername.Text.ToString();
            
            Session["Username"] = txtusername.Text;
            Response.Redirect("Default.aspx");
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Are Successfully Login');window.location ='Default.aspx;", true);
        }
        else
        {
            divfail.Visible = true;
        }
    }
}