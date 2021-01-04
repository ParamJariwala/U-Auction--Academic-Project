using PageMasterTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MenuMaster : System.Web.UI.Page
{
    MenuMasterTableAdapter ObjMenu = new MenuMasterTableAdapter();
    ModuleTableAdapter ObjModule = new ModuleTableAdapter();
    Connection cls = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["msg"] != null)
            {
                string str = Request.QueryString["msg"].ToString();
                if (str.Equals("sv"))
                {
                    divSuccess.Visible = true;
                    divError.Visible = false;
                }
                else if (str.Equals("up"))
                {
                    divSuccess.Visible = true;
                    divError.Visible = false;
                }
                else if (str.Equals("dl"))
                {
                    divSuccess.Visible = true;
                    divError.Visible = false;
                }
                else
                {
                    divError.Visible = false;
                    divSuccess.Visible = false;
                }
            }
            GenerateMenuView();
            BindAllMenus();
            BindAllModule();
            SetVisibilityForType();
            SetSortOrder();
            SetVisibilityOfButtons();
            if (Request.QueryString["Id"] != null)
            {
                int Id = Convert.ToInt32(Request.QueryString["Id"]);
                DataTable dt = ObjMenu.Menu_GetMenuDetailsByMenuId(Id);
                if (dt.Rows.Count != 0)
                {
                    txtMenuName.Text = dt.Rows[0]["Name"].ToString();
                    txtUrl.Text = dt.Rows[0]["Url"].ToString();
                    FCKeditor1.Value = dt.Rows[0]["Content"].ToString();
                    txtSortOrder.Text = dt.Rows[0]["Sequence"].ToString();
                    txtPageTitle.Text = dt.Rows[0]["PageTitle"].ToString();
                    hfFile.Value = dt.Rows[0]["Url"].ToString();
                    txtKeyword.Text = dt.Rows[0]["PageKeyword"].ToString();
                    int parentId = Convert.ToInt32(dt.Rows[0]["ParentId"]);
                    if (parentId == 0)
                    {
                        ddlMenuType.SelectedIndex = 0;
                    }
                    else
                    {
                        System.Web.UI.WebControls.ListItem li = ddlMenuType.Items.FindByValue(parentId.ToString());
                        ddlMenuType.SelectedIndex = ddlMenuType.Items.IndexOf(li);
                    }
                    chkStatus.Checked = Convert.ToBoolean(dt.Rows[0]["IsShown"].ToString());
                    string Type = dt.Rows[0]["Type"].ToString();
                    System.Web.UI.WebControls.ListItem liMenuType = ddlType.Items.FindByValue(Type);
                    ddlType.SelectedIndex = ddlType.Items.IndexOf(liMenuType);
                    string text = txtMenuName.Text;
                    SetVisibilityForType();
                }
            }
        }

    }
    private void SetVisibilityOfButtons()
    {
        if (Request.QueryString["Id"] == null)
        {
            ibtnDelete.Visible = false;
            ibtnUpdate.Visible = false;
        }
        else
        {
            ibtnAdd.Visible = false;
        }

    }
    public void GenerateMenuView()
    {
        DataTable DtMenu = cls.GetData("select * from MenuMaster where ParentId=0 and ID=0 order by sequence");
        if (DtMenu.Rows.Count != 0)
        {
            foreach (DataRow row in DtMenu.Rows)
            {
                TreeNode treeNode = new TreeNode();
                treeNode.Text = row["Name"].ToString();
                treeNode.Value = row["MenuId"].ToString();
                treeNode.ImageUrl = "~/images/img_plus.png";
                treeNode.NavigateUrl = "MenuMaster.aspx?Id=" + row["MenuId"].ToString();
                GenerateSubMenuView(Convert.ToInt32(row["MenuId"]), treeNode);
                TreeView1.Nodes.Add(treeNode);
            }
            TreeView1.DataBind();
        }
    }
    public void GenerateSubMenuView(int MenuId, TreeNode treeNode)
    {


        DataTable DtSubMenu = cls.GetData("select * from MenuMaster where ParentId = " + MenuId + " and ID=0 order by Sequence");
        foreach (DataRow rowChild in DtSubMenu.Rows)
        {
            TreeNode treeChildNode = new TreeNode();
            treeChildNode.Text = rowChild["Name"].ToString();
            treeChildNode.Value = rowChild["MenuId"].ToString();
            treeChildNode.ImageUrl = "~/images/img_plus.png";
            treeChildNode.NavigateUrl = "MenuMaster.aspx?Id=" + rowChild["MenuId"].ToString();
            treeNode.ChildNodes.Add(treeChildNode);

            GenerateSubMenuView(Convert.ToInt32(rowChild["MenuId"].ToString()), treeChildNode);
        }
    }
    public void BindAllMenus()
    {
        DataTable DtMenus = cls.GetData("Select * from MenuMaster where ID=0");
        if (DtMenus.Rows.Count != 0)
        {
            ddlMenuType.DataTextField = "Name";
            ddlMenuType.DataValueField = "MenuId";
            ddlMenuType.DataSource = DtMenus;
            ddlMenuType.DataBind();
        }
        ddlMenuType.Items.Insert(0, "Main Menu");
    }
    public void BindAllModule()
    {
        DataTable dt = cls.GetDataTable("select * from Module");
        if (dt.Rows.Count != 0)
        {
            ddlType.DataSource = dt;
            ddlType.DataTextField = "ModuleName";
            ddlType.DataValueField = "ModuleName";
            ddlType.DataBind();
        }
    }
    public void SetVisibilityForType()
    {
        string selectedType = ddlType.SelectedValue;
        if (selectedType.Equals("LINK"))
        {
            divFile.Visible = false;
            pnlUrl.Visible = true;
            pnlCMS.Visible = false;

        }
        else if (selectedType.Equals("CMS"))
        {
            divFile.Visible = false;
            pnlCMS.Visible = true;
            pnlUrl.Visible = false;

        }

        else if (selectedType.Equals("DOWNLOAD"))
        {
            pnlUrl.Visible = true;
            divFile.Visible = true;
            pnlCMS.Visible = false;
        }
        else
        {
            divFile.Visible = false;
            pnlUrl.Visible = false;
            pnlCMS.Visible = false;
        }
    }
    public void SetSortOrder()
    {
        string SelectMenu = ddlMenuType.SelectedItem.Text;
        if (SelectMenu.Equals("Main Menu"))
        {

            DataTable Dt = ObjMenu.Menu_GetMaxIdForSortOrder();
            int cnt = Dt.Rows.Count;
            int c = Convert.ToInt32(Dt.Rows[0]["cnt"].ToString());
            txtSortOrder.Text = (c + 1).ToString();
        }
        else
        {

            int parentId = Convert.ToInt32(ddlMenuType.SelectedValue);
            DataTable dt = ObjMenu.Menu_GetMaxIdForSortOrderONParentId(parentId);
            int cnt = dt.Rows.Count;
            int c = Convert.ToInt32(dt.Rows[0]["cnt"].ToString());
            txtSortOrder.Text = (c + 1).ToString();
        }
    }
    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetVisibilityForType();
        if (ddlType.SelectedValue == "CMS")
        {
            txtUrl.Text = "content.aspx";
        }
        else if (ddlType.SelectedValue == "HOME")
        {
            txtUrl.Text = "Home.aspx";
        }
    }
    protected void ibtnAdd_Click(object sender, EventArgs e)
    {

        if (fuFile.HasFile)
        { }
        int BranchId = Convert.ToInt32(Session["BranchId"]);
        int ParentId = 0;
        int sortOrder = 0;
        if (txtSortOrder.Text != "")
        {
            sortOrder = Convert.ToInt32(txtSortOrder.Text);
        }
        string url = String.Empty;

        if (ddlType.SelectedValue == "CMS")
        {
            url = "content.aspx";
        }
        else if (ddlType.SelectedValue == "HOME")
        {
            url = "Default.aspx";
        }
        else
        {
            url = txtUrl.Text;
        }

        if (Request.QueryString["Id"] != null)
        {
            ParentId = Convert.ToInt32(Request.QueryString["Id"]);
        }
        else
        {
            if (ddlMenuType.SelectedValue != "Main Menu")
            {
                ParentId = Convert.ToInt32(ddlMenuType.SelectedValue);
            }
            else
            {
                ParentId = 0;
            }
        }
        try
        {
            string f1 = "";
            string download_file = "";
            if (ddlType.SelectedValue == "DOWNLOAD")
            {
                if (fuFile.HasFile)
                {
                    fuFile.SaveAs(Server.MapPath("~/Resources/Downloads/" + fuFile.FileName));
                    download_file = "Resources/Downloads/" + fuFile.FileName;
                    url = download_file;
                }
            }
            ObjMenu.Menu_AddMenus(txtMenuName.Text, url, FCKeditor1.Value, ParentId, sortOrder, ddlType.SelectedItem.Text, chkStatus.Checked, 0, txtPageTitle.Text, f1, txtKeyword.Text);
            Response.Redirect("MenuMaster.aspx?msg=sv");
        }
        catch (Exception ex)
        {
            divSuccess.Visible = false;
            divError.Visible = true;
        }

    }
    protected void ibtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int Id = Convert.ToInt32(Request.QueryString["Id"]);
            int sortOrder = 0;
            string strTest = txtUrl.Text;
            int ParentId = Convert.ToInt32(Request.QueryString["Id"]);
            string url = txtUrl.Text;
            try
            {
                if (txtSortOrder.Text != "")
                {
                    sortOrder = Convert.ToInt32(txtSortOrder.Text);
                }
                string f1 = "";
                string download_file = "";
                if (ddlType.SelectedValue == "DOWNLOAD")
                {
                    if (fuFile.HasFile)
                    {
                        fuFile.SaveAs(Server.MapPath("~/Resources/Downloads/" + fuFile.FileName));
                        download_file = "Resources/Downloads/" + fuFile.FileName;
                        url = download_file;
                    }
                    else
                    {
                        url = hfFile.Value;
                    }
                }
                ObjMenu.Menu_UpdateMenuDetails(txtMenuName.Text, url, FCKeditor1.Value, sortOrder, chkStatus.Checked, Id, ddlType.SelectedValue, 0, txtPageTitle.Text, f1, txtKeyword.Text);
                Response.Redirect("MenuMaster.aspx?msg=up");
            }
            catch (Exception)
            {
                Response.Write("Enter Numbers only.");
            }
        }
        catch
        {
        }
    }
    protected void ibtnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            int Id = Convert.ToInt32(Request.QueryString["Id"]);
            ObjMenu.Delete(Id);
            Response.Redirect("MenuMaster.aspx?msg=dl");
        }
        catch
        {
        }
    }
    protected void ddlMenuType_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetSortOrder();
    }
}