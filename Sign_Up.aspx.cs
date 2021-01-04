using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Sign_Up : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection SQLConn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\param\U_Auction_New\App_Data\Database2.mdf;Integrated Security=True;User Instance=True");
            SqlCommand cmd = new SqlCommand("Select * From User_details Where Username='" + username.Text + "'", SQLConn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if(dt.Rows.Count == 0)
            {
                SqlCommand cmd3 = new SqlCommand("Select * From User_details Where Email='" + email.Text + "'", SQLConn);
                SqlDataAdapter sda2 = new SqlDataAdapter(cmd3);
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);
                if (dt2.Rows.Count == 0)
                {
                    SqlCommand cmd2 = new SqlCommand("insert into User_details (Firstname,Lastname,Username,Password,Email,Address,Mobile,State,City,Gender) values ('" + fname.Text + "','" + lname.Text + "','" + username.Text + "','" + pass.Text + "','" + email.Text + "','" + address.Text + "','" + mobile.Text + "','" + state.SelectedValue + "','" + city.SelectedValue + "','" + RadioButtonList1.SelectedValue + "')", SQLConn);
                    SQLConn.Open();
                    cmd2.ExecuteNonQuery();
                    SQLConn.Close();
                    divsuccess.Visible = true;
                    divfail.Visible = false;
                    diverror.Visible = false;
                    diverror2.Visible = false;
                    Clear();
                }
                else
                {
                    divsuccess.Visible = false;
                    divfail.Visible = false;
                    diverror.Visible = false;
                    diverror2.Visible = true;
                }
            }
            else
            {
                divsuccess.Visible = false;
                divfail.Visible = false;
                diverror.Visible = true;
                diverror2.Visible = false;
            }
            
        }
        catch
        {
            divsuccess.Visible = false;
            divfail.Visible = true;
            diverror.Visible = false;
            diverror2.Visible = false;
        }
        
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You Are Successfully Register');window.location ='Default.aspx;", true);
        //Response.Redirect(Request.Url.AbsoluteUri);
    }
    protected void Clear()
    {
        fname.Text = "";
        lname.Text = "";
        username.Text = "";
        email.Text = "";
        address.Text = "";
        mobile.Text = "";
    }
}