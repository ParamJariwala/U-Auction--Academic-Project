<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddVideo.aspx.cs" Inherits="Admin_AddVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Add Video</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 col-sm-12 col-xs-12">
                <div class="white-box">
                    <p class="text-muted m-b-10 font-13">
                        <div class="alert alert-success alert-dismissable" id="divSuccess" runat="server" visible="false">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Success ! Changes Done Successfully
                        </div>
                        <div class="alert alert-danger alert-dismissable" id="divError" runat="server" visible="false">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Failure ! Changes Not Done Successfully !
                        </div>
                    </p>
                    <div class="row">
                        <div class="col-sm-12 col-lg-12 col-xs-12">
                            <div class="form-group">
                                <label for="">
                                    Video Category 
                                </label>
                             
                                <asp:DropDownList CssClass="form-control" ID="ddlcategory" runat="server">
                                    
                                    <%--<asp:ListItem Text="view" Value="view"></asp:ListItem>
                                    <asp:ListItem Text="Website" Value="website"></asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="">
                                    Video Title
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txttitle" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            
                            <div class="form-group">
                                <label for="">
                                    Video Url
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txturl" CssClass="form-control"></asp:TextBox>
                                    <h6 style="font-size:9px;">https://www.youtube.com/watch?v=<b style="color:red;">uPfPx_l_mgI</b>&nbsp;&nbsp;&nbsp;Add only this link of youtube video</h6>
                                </div>

                            </div>

                            <div class="text-right">
                                <asp:LinkButton runat="server" ID="lbSubmit" ValidationGroup="AddEmployee" OnClick="lbSubmit_Click" CssClass="fcbtn btn btn-success btn-outline btn-1d waves-effect">Submit</asp:LinkButton>
                                <asp:LinkButton runat="server" ID="lbUpdate" ValidationGroup="AddEmployee" OnClick="lbUpdate_Click" Visible="false" CssClass="fcbtn btn btn-primary btn-outline btn-1d waves-effect">Update    </asp:LinkButton>
                                <button type="reset" class=" fcbtn btn btn-danger btn-outline btn-1d waves-effect">Cancel</button>
                                
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-7 col-lg-7 col-xs-12 col-sm-12">
                <div class="white-box">
                    <h3 class="box-title m-b-0">Data</h3>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <asp:GridView runat="server" ID="gv" CssClass="gvDataTable table-responsive table table-striped table-bordered" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="Category" HeaderText="Category Name" />
                                    <asp:BoundField DataField="Title" HeaderText="Video Title" />
                                    <%--<asp:BoundField DataField="Url" HeaderText="Video Url" />--%>
                                    <asp:TemplateField HeaderText="Video Url">
                                        <ItemTemplate>
                                            <a href="https://www.youtube.com/watch?v=<%# Eval("Url") %>">https://www.youtube.com/watch?v=<%# Eval("Url") %></a>
                                                
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbEdit" CssClass="btn btn-primary btn-circle waves-effect btn-sm fa fa-edit btn-outline" CommandArgument='<%# Eval("Id") %>' OnClick="lbEdit_Click"></asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="lbDelete" OnClientClick="return confirm('Are You Sure Want To Delete ?')" CssClass="btn-outline btn btn-danger btn-circle waves-effect btn-sm fa fa-times" CommandArgument='<%# Eval("Id") %>' OnClick="lbDelete_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

