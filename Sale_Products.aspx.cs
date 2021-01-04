using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;


public partial class Add_Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCategory();
            if (Request.Cookies["Username"] == null)
            {
                Response.Cookies["login"].Value = "1";
                Session["login"] = "1";
                Response.Redirect("Sign_In.aspx");
                //ltrsign.Text = "<li class='my-account-link'><a href='Sign_Up.aspx'>Sign Up</a></li><li class='check-out-link'><a href='Sign_In.aspx'>Sign In</a></li>";
            }
            
        }
    }
    protected void BindCategory()
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        //var parameterDate = DateTime.ParseExact(txtdate.Text, "yyyy/MM/dd", CultureInfo.InvariantCulture);
        string todaysDate = DateTime.Now.ToString("yyyy/MM/dd");
        if (Convert.ToDateTime(todaysDate) <= Convert.ToDateTime(txtdate.Text))
        {
            

            string img;
            string date = Convert.ToDateTime(txtdate.Text.ToString()).ToString("yyyy-MM-dd");
            SqlConnection SQLConn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + System.IO.Path.Combine(Server.MapPath("\\App_Data\\Database2.mdf")) + ";Integrated Security=True;User Instance=True");
            SqlCommand cmd = new SqlCommand("Select * From Product_Master Where Date='" + date + "'", SQLConn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count < 4)
            {
                try
                {
                    //SqlConnection SQLConn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + System.IO.Path.Combine(Server.MapPath("\\App_Data\\Database2.mdf")) + ";Integrated Security=True;User Instance=True");
                    if (file.HasFile)
                    {
                        Random rd = new Random();
                        int no = rd.Next();
                        string filestr = System.IO.Path.Combine(Server.MapPath("product/"), "Img_" + no.ToString() + ".jpg");
                        file.SaveAs(filestr);
                        img = "product/Img_" + no.ToString() + ".jpg";
                        string dateselect = "";
                        //try
                        //{
                            
                        //    dateselect = Convert.ToDateTime(txtdate.Text.ToString()).ToString("yyyy/MM/dd");
                        //}
                        //catch
                        //{
                        //    dateselect = "";
                        //}

                        SqlCommand cmd2 = new SqlCommand("insert into Product_Master (Productname,Categoryid,Qty,Price,Description,img,Date) values ('" + productname.Text + "','" + ddlcat.SelectedValue + "','" + Qty.Text + "','" + Price.Text + "','" + descript.Text + "','" + img + "','" + txtdate.Text + "')", SQLConn);
                        SQLConn.Open();
                        cmd2.ExecuteNonQuery();
                        SQLConn.Close();
                        divsuccess.Visible = true;
                        divfail.Visible = false;
                        divlimit.Visible = false;
                        divdate.Visible = false;
                        divimg.Visible = false;
                        Clear();
                    }
                    else
                    {
                        divimg.Visible = true;
                        divsuccess.Visible = false;
                        divfail.Visible = false;
                        divlimit.Visible = false;
                        divdate.Visible = false;
                        
                    }
                }
                catch (Exception ex)
                {
                    divsuccess.Visible = false;
                    divfail.Visible = true;
                    divlimit.Visible = false;
                    divdate.Visible = false;
                    divimg.Visible = false;
                }
            }
            else
            {
                divsuccess.Visible = false;
                divfail.Visible = false;
                divlimit.Visible = true;
                divdate.Visible = false;
                divimg.Visible = false;
            }
        }
        else
        {
            divdate.Visible = true;
            divsuccess.Visible = false;
            divfail.Visible = false;
            divlimit.Visible = false;
            divimg.Visible = false;
        }

    }
    protected void Clear()
    {

        productname.Text = "";
        Price.Text = "";
        txtdate.Text = "";
        Qty.Text = "";
        descript.Text = "";
    }

}