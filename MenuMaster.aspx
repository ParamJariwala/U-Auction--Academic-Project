<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="MenuMaster.aspx.cs" Inherits="Admin_MenuMaster" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function clickTheButton() {
            document.getElementById('<%= ibtnAdd.ClientID %>').click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="white-box">
                    <div>
                        <div class="main-page">
                            <div class="forms">
                                <div class="row">
                                    <h3 class="title1">Menu Master :</h3>
                                    <div class="form-three widget-shadow">
                                        <div class=" panel-body-inputin">
                                            <div class="form-horizontal">
                                                <asp:TreeView ID="TreeView1" runat="server" ExpandImageUrl=""
                                                    Font-Bold="true" HoverNodeStyle-Font-Size="15px" HoverNodeStyle-BackColor="Silver"
                                                    NodeStyle-ForeColor="#3a3a3a" PathSeparator=">" ShowLines="true" Width="100%">
                                                    <Nodes>
                                                    </Nodes>
                                                </asp:TreeView>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-three widget-shadow">
                                        <div class=" panel-body-inputin">
                                            <div class="form-horizontal">
                                                <div role="alert" class="alert alert-success" runat="server" id="divSuccess" visible="false">
                                                    <strong>Success!</strong> Changes Done Successfully !
                                                </div>
                                                <div role="alert" class="alert alert-danger" runat="server" id="divError" visible="false">
                                                    <strong>Error!</strong> Changes Not Done Successfully !
                                                </div>
                                                <%--<asp:UpdatePanel ID="upMenu" runat="server">
                                    <ContentTemplate>--%>
                                                <div class="form-group">
                                                    <label class="col-md-2 col-xs-12 control-label">
                                                        Menus</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <div class="input-group in-grp1">
                                                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>
                                                            <asp:DropDownList runat="server" ID="ddlMenuType" AutoPostBack="True" OnSelectedIndexChanged="ddlMenuType_SelectedIndexChanged"
                                                                CssClass="form-control">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 col-xs-12 control-label">
                                                        Menu Name</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <div class="input-group in-grp1">
                                                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtMenuName"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 col-xs-12 control-label">
                                                        Page Title</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <div class="input-group in-grp1">
                                                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPageTitle"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 col-xs-12 control-label">
                                                        Page Keyword</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <div class="input-group in-grp1">
                                                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtKeyword"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 col-xs-12 control-label">
                                                        Sort Order</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <div class="input-group in-grp1">
                                                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtSortOrder"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 col-xs-12 control-label">
                                                        Status</label>
                                                    <div class="col-md-8 col-xs-12">
                                                        <div class="input-group in-grp1">
                                                            <span class="input-group-addon"><i class="fa fa-edit"></i></span>
                                                            <asp:CheckBox ID="chkStatus" runat="server" Text="Display Or Not" />
                                                        </div>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
                                                        Type</label>
                                                    <div class="col-md-8">
                                                        <div class="input-group in-grp1">
                                                            <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                                            <asp:DropDownList ID="ddlType" CssClass="form-control" runat="server" AutoPostBack="True"
                                                                OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                                                <asp:ListItem Value="Link">Link</asp:ListItem>
                                                                <asp:ListItem Value="Download">Download</asp:ListItem>
                                                                <asp:ListItem Value="CMS">CMS</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                                <asp:Panel ID="pnlUrl" runat="server" Visible="false">
                                                    <div class="form-group">
                                                        <label class="col-md-2 control-label">
                                                            URL</label>
                                                        <div class="col-md-8">
                                                            <div class="input-group in-grp1">
                                                                <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                                                <asp:TextBox ID="txtUrl" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix">
                                                        </div>
                                                    </div>
                                                    <div class="form-group" runat="server" id="divFile" visible="false">
                                                        <label class="col-md-2 control-label">
                                                            File</label>
                                                        <div class="col-md-8">
                                                            <div class="input-group in-grp1">
                                                                <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                                                <asp:FileUpload runat="server" ID="fuFile" CssClass="form-control" />
                                                                <asp:HiddenField runat="server" ID="hfFile" />
                                                            </div>
                                                        </div>
                                                        <div class="clearfix">
                                                        </div>
                                                    </div>
                                                </asp:Panel>

                                                <asp:Panel ID="pnlCMS" runat="server" Visible="false" Height="500px">
                                                    <div class="form-group">
                                                        <label class="col-md-2 control-label">
                                                            Content</label>
                                                        <div class="col-md-8">
                                                            <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Width="100%" Height="360px"
                                                                BasePath="~/fckeditor/">
                                                            </FCKeditorV2:FCKeditor>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <div class="form-group">
                                                    <div class="col-sm-offset-3 col-md-10">
                                                        <asp:Button ID="ibtnAdd" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="ibtnAdd_Click" />
                                                        <asp:Button ID="ibtnUpdate" runat="server" Text="Update" CssClass="btn btn-primary"
                                                            OnClick="ibtnUpdate_Click" />
                                                        <asp:Button ID="ibtnDelete" runat="server" Text="Delete" CssClass="btn btn-danger"
                                                            OnClick="ibtnDelete_Click" />
                                                        <button class="btn btn-danger btn-sm" type="reset" OnClick="ibcancel">
                                                            CANCEL</button>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

