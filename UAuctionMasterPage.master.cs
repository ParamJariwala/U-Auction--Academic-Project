using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class UAuctionMasterPage : System.Web.UI.MasterPage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
            if (Request.Cookies["Username"] == null)
            {
                ltrsign.Text = "<li class='my-account-link'><a href='Sign_Up.aspx'>Sign Up</a></li><li class='check-out-link'><a href='Sign_In.aspx'>Sign In</a></li>";
            }
            else
            {
                ltrsign.Text = "<li class='my-account-link'>Welcome - " + Request.Cookies["Username"].Value + "</li><li class='check-out-link'><a href='Logout.aspx'>Logout</a></li>";
            }
        }

    }
    protected void BindCategory()
    {
        SqlConnection SQLConn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + System.IO.Path.Combine(Server.MapPath("\\App_Data\\Database2.mdf")) + ";Integrated Security=True;User Instance=True");
        SqlCommand cmd = new SqlCommand("Select * From category_master", SQLConn);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        string str = "";
        if (dt.Rows.Count != 0)
        {
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                str += "<li id='menu-item-114' class='menu-item menu-item-type-post_type menu-item-object-page menu-item-114'><a href='Category.aspx?ID=" + dt.Rows[i]["ID"].ToString() + "'>" + dt.Rows[i]["Name"].ToString() + "</a></li>";
            }
            ltrcategory.Text = str;
        }
    }
}
