using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProduct();
        }
    }
    protected void BindProduct()
    {
        string id = Request.QueryString["id"].ToString();
        SqlConnection SQLConn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + System.IO.Path.Combine(Server.MapPath("\\App_Data\\Database2.mdf")) + ";Integrated Security=True;User Instance=True");
        SqlCommand cmd = new SqlCommand("Select p.*,c.name From Product_master as p,category_master as c where c.id=p.categoryid and p.categoryid = " + id, SQLConn);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        string str = "";
        if (dt.Rows.Count != 0)
        {
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                
                str += "<li class='post-29 product type-product status-publish has-post-thumbnail first sale featured shipping-taxable purchasable product-type-simple product-cat-bath product-cat-moisturisers instock'>";
                str += "<a href='ProductDetail.aspx?ID=" + dt.Rows[i]["id"].ToString() + "' class='product-link'>";
                str += "<img src='" + dt.Rows[i]["img"].ToString() + "' class='attachment-shop_catalog wp-post-image' alt='image1' />";
                str += "<p class='product-title'>" + dt.Rows[i]["productname"].ToString() + "</p>";
                str += "</a>";
                str += "<div class='add-to-cart-wrapper'>";
                str += "<p>";
                str += "<span class='amount'>&#8377;" + dt.Rows[i]["price"].ToString() + "</span>";
                str += "</p>";
                //str += "<p class='add-to-cart-button'>";
                //str += "<a href='indexada1.html?add-to-cart=29' rel='nofollow' data-product_id='29' data-product_sku='' data-quantity='1' class='add_to_cart_button simple'>Add to cart +</a>";
                //str += "</p>";
                str += "</div>";
                str += "</li>";
            }
            ltrheader.Text = dt.Rows[0]["name"].ToString();
            ltrcontent.Text = str;
        }
    }
}