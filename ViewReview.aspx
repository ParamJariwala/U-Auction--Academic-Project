<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewReview.aspx.cs" Inherits="Admin_ViewReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">

                

                <div class="white-box">
                    <h3 class="box-title m-b-0">Pending Reviews</h3>
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
                                    <asp:BoundField DataField="Username" HeaderText="Username" />
                                    <asp:BoundField DataField="schoolname" HeaderText="schoolname" />

                                    <asp:BoundField DataField="Reviewer" HeaderText="Reviewer" />
                                    <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                    <asp:BoundField DataField="Review" HeaderText="Review" />
                                    <asp:BoundField DataField="RatingBox" HeaderText="Rating" />
                                    <asp:BoundField DataField="NoOfStudent" HeaderText="No Of Student" />
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                              <%# Eval("Date","{0:dd-MM-yyyy}") %>  
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="statename" HeaderText="State" />
                                    <asp:BoundField DataField="cityname" HeaderText="City" />
                                    <%--<asp:BoundField DataField="Url" HeaderText="Video Url" />--%>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbEdit" CssClass="btn btn-primary btn-circle waves-effect btn-sm fa fa-thumbs-up btn-outline" CommandArgument='<%# Eval("Id") %>' OnClick="lbEdit_Click"></asp:LinkButton>
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
                    <h3 class="box-title m-b-0">Approval Reviews</h3>
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
                                    <asp:BoundField DataField="Username" HeaderText="Username" />
                                    <asp:BoundField DataField="schoolname" HeaderText="schoolname" />

                                    <asp:BoundField DataField="Reviewer" HeaderText="Reviewer" />
                                    <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                    <asp:BoundField DataField="Review" HeaderText="Review" />
                                    <asp:BoundField DataField="RatingBox" HeaderText="Rating" />
                                    <asp:BoundField DataField="NoOfStudent" HeaderText="No Of Student" />
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                              <%# Eval("Date","{0:dd-MM-yyyy}") %>  
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="statename" HeaderText="State" />
                                    <asp:BoundField DataField="cityname" HeaderText="City" />
                                    <%--<asp:BoundField DataField="Url" HeaderText="Video Url" />--%>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbEdit1" CssClass="btn btn-primary btn-circle waves-effect btn-sm fa fa-thumbs-down btn-outline" CommandArgument='<%# Eval("Id") %>' OnClick="lbEdit1_Click"></asp:LinkButton>
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

