<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewRegistersEvent.aspx.cs" Inherits="Admin_ViewRegistersEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                <div class="white-box">
                    <h3 class="box-title m-b-0">Data</h3>
                    <hr />
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
                                    <asp:BoundField DataField="title" HeaderText="Event Name" />
                                    <asp:TemplateField HeaderText="Event Date">
                                        <ItemTemplate>
                                              <%# Eval("Date","{0:dd-MM-yyyy}") %>  
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="username" HeaderText="User Name" />
                                    <asp:BoundField DataField="Firstname" HeaderText="First Name" />
                                    <asp:BoundField DataField="lastname" HeaderText="Last Name" />
                                    <asp:BoundField DataField="email" HeaderText="Email" />
                                    <asp:BoundField DataField="mobile" HeaderText="Mobile" />
                                    <asp:BoundField DataField="WhatsAppNo" HeaderText="Whats App No" />
                                    <asp:BoundField DataField="statename" HeaderText="State" />
                                    <asp:BoundField DataField="cityname" HeaderText="City" />
                                    <%--<asp:BoundField DataField="Url" HeaderText="Video Url" />--%>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>

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

