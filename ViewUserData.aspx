<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewUserData.aspx.cs" Inherits="Admin_ViewUserData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">

                

                <div class="white-box">
                    <h3 class="box-title m-b-0">Principal Approvals</h3>
                    <div class="row">

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
                        <div class="col-sm-12 col-xs-12">
                            <asp:GridView runat="server" ID="gv" CssClass="gvDataTable table-responsive table table-striped table-bordered" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="name" HeaderText="User Name" />
                                    <asp:BoundField DataField="email" HeaderText="Email" />

                                    <asp:BoundField DataField="password" HeaderText="Password" />
                                    <asp:BoundField DataField="mobile" HeaderText="Mobile" />
                                    <asp:BoundField DataField="cityname" HeaderText="City" />
                                    <asp:BoundField DataField="statename" HeaderText="State" />
                                    <%--<asp:BoundField DataField="Url" HeaderText="Video Url" />--%>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbEdit" CssClass="btn btn-primary btn-circle waves-effect btn-sm fa fa-user btn-outline" CommandArgument='<%# Eval("Id") %>' OnClick="lbEdit_Click"></asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="lbDelete" OnClientClick="return confirm('Are You Sure Want To Delete ?')" CssClass="btn-outline btn btn-danger btn-circle waves-effect btn-sm fa fa-times" CommandArgument='<%# Eval("Id") %>' OnClick="lbDelete_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">

                

                <div class="white-box">
                    <h3 class="box-title m-b-0">Users Data</h3>
                    <div class="row">

                        <p class="text-muted m-b-10 font-13">
                                    <div class="alert alert-success alert-dismissable" id="div1" runat="server" visible="false">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        Success ! Changes Done Successfully
                                    </div>
                                    <div class="alert alert-danger alert-dismissable" id="div2" runat="server" visible="false">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                        Failure ! Changes Not Done Successfully !
                                    </div>
                                </p>
                        <div class="col-sm-12 col-xs-12">
                            <asp:GridView runat="server" ID="gv1" CssClass="gvDataTable table-responsive table table-striped table-bordered" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="name" HeaderText="User Name" />
                                    <asp:BoundField DataField="email" HeaderText="Email" />

                                    <asp:BoundField DataField="password" HeaderText="Password" />
                                    <asp:BoundField DataField="mobile" HeaderText="Mobile" />
                                    <asp:BoundField DataField="cityname" HeaderText="City" />
                                    <asp:BoundField DataField="statename" HeaderText="State" />
                                    
                                    <%--<asp:BoundField DataField="Url" HeaderText="Video Url" />--%>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbEdit1" CssClass="btn btn-primary btn-circle waves-effect btn-sm fa fa-star btn-outline" CommandArgument='<%# Eval("Id") %>' OnClick="lbEdit1_Click"></asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="lbDelete1" OnClientClick="return confirm('Are You Sure Want To Delete ?')" CssClass="btn-outline btn btn-danger btn-circle waves-effect btn-sm fa fa-times" CommandArgument='<%# Eval("Id") %>' OnClick="lbDelete1_Click"></asp:LinkButton>
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

