using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Auction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductDetail();
            BindProductYesterday();

        }
    }
    protected void BindProductDetail()
    {
        string str = "";
        //string id = Request.QueryString["id"].ToString();
        string todaysDate = DateTime.Now.ToString("yyyy/MM/dd");
        SqlConnection SQLConn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + System.IO.Path.Combine(Server.MapPath("\\App_Data\\Database2.mdf")) + ";Integrated Security=True;User Instance=True");
        SqlCommand cmd = new SqlCommand("select * from Product_master where date = '" + todaysDate + "'", SQLConn);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                str += "<li class='post-29 product type-product status-publish has-post-thumbnail first sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock'>";
                str += "<a href='ProductDetail.aspx?ID=" + dt.Rows[i]["id"].ToString() + "' class='product-link'>";
                str += "<img src='" + dt.Rows[i]["Img"].ToString() + "' class='attachment-shop_catalog wp-post-image' alt='image1' />";
                str += "<p class='product-title'>" + dt.Rows[i]["productname"].ToString() + "</p>";
                str += "</a>";
                str += "</li>";
            }
            ltrtoday.Text = str;
        }
    }
    protected void BindProductYesterday()
    {
        string str = "";
        //string id = Request.QueryString["id"].ToString();
        string todaysDate = DateTime.Now.AddDays(-1).ToString("yyyy/MM/dd");
        SqlConnection SQLConn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + System.IO.Path.Combine(Server.MapPath("\\App_Data\\Database2.mdf")) + ";Integrated Security=True;User Instance=True");
        SqlCommand cmd = new SqlCommand("select * from Product_master where date = '" + todaysDate + "'", SQLConn);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
        {
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                str += "<li class='post-29 product type-product status-publish has-post-thumbnail first sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock'>";
                str += "<a href='ProductDetail.aspx?ID=" + dt.Rows[i]["id"].ToString() + "' class='product-link'>";
                str += "<img src='" + dt.Rows[i]["Img"].ToString() + "' class='attachment-shop_catalog wp-post-image' alt='image1' />";
                str += "<p class='product-title'>" + dt.Rows[i]["productname"].ToString() + "</p>";
                str += "</a>";
                str += "</li>";
            }
            ltryesterday.Text = str;
        }
    }
}