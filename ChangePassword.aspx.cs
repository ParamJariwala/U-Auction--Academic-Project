using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    Connection D = new Connection();
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ParentingWebsite"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void lbSubmit_Click(Object Sender, EventArgs e)
    {
        if (txtnewpass.Text.ToString() == txtconfirm.Text.ToString())
        {
            DataTable dt = D.GetData("select * from SF_ADMIN_MASTER where PASSWORD = '" + txtoldpass.Text + "'");
            if (dt.Rows.Count != 0)
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddWithValue("@PASS", txtnewpass.Text.ToString());



                cmd.Connection = cn;
                cmd.CommandText = "update SF_ADMIN_MASTER set PASSWORD = @PASS";
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                txtoldpass.Text = "";
                divSuccess.Visible = true;
                divError.Visible = false;
                divfail.Visible = false;
            }
            else
            {
                divSuccess.Visible = false;
                divError.Visible = false;
                divfail.Visible = true;
            }
        }
        else
        {
            divSuccess.Visible = false;
            divError.Visible = true;
            divfail.Visible = false;
        }
    }
}