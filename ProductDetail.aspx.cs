using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductDetail();
        }
    }
    protected void BindProductDetail()
    {
        string id = Request.QueryString["id"].ToString();
        SqlConnection SQLConn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + System.IO.Path.Combine(Server.MapPath("\\App_Data\\Database2.mdf")) + ";Integrated Security=True;User Instance=True");
        SqlCommand cmd = new SqlCommand("Select p.*,c.name,c.id as catid From Product_master as p,category_master as c where c.id=p.categoryid and p.id = " + id, SQLConn);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        
        if (dt.Rows.Count != 0)
        {

            ltrimg.Text = "<a href='" + dt.Rows[0]["img"].ToString() + "' itemprop='image' title='image1' rel='prettyPhoto'><img src='" + dt.Rows[0]["img"].ToString() + "' class='attachment-shop_single wp-post-image' alt='image1' title='image1' /></a>";
            ltrname.Text = dt.Rows[0]["productname"].ToString();
            ltrprice.Text = dt.Rows[0]["price"].ToString();
            ltrdesc.Text = dt.Rows[0]["description"].ToString();
            ltrcategory.Text = "<a href='category.aspx?ID=" + dt.Rows[0]["catid"].ToString() + "' rel='tag'> " + dt.Rows[0]["name"].ToString() + "</a>";
            
            
        }
    }
    protected void BidingPrice()
    {
        string str = "";
        string id = Request.QueryString["id"].ToString();
        //for(){
        str += "<li class='post-19 product type-product status-publish has-post-thumbnail clearfix sale downloadable virtual shipping-taxable purchasable product-type-simple product-cat-gift product-cat-hair instock'>";
            str += "<div class='product-description-widget'>";

                        //        <h4>Digital Product</h4>

                                
                        //        <div class='add-to-cart-wrapper'>
                        //            <p class='product-price'>
                        //                <ins><span class='amount'>&pound;8.99</span></ins>
                        //            </p>
                        //            <p class='add-to-cart-button'>
                        //                <a href='index3a5b.html?add-to-cart=19' rel='nofollow' data-product_id='19' data-product_sku='' data-quantity='1' class='add_to_cart_button simple'>Add to cart +</a>
                        //            </p>
                        //        </div>

                               
                        //    </div>

                        //</li>
    //}
    }
}