<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="Admin_AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">About Us</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
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
                                    Mission
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtmission" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="">
                                    Vision
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtvision" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="">
                                    Expertise
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtexp" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            

                            <div class="text-right">
                                
                                <asp:LinkButton runat="server" ID="lbUpdate" ValidationGroup="AddEmployee" OnClick="lbUpdate_Click" CssClass="fcbtn btn btn-primary btn-outline btn-1d waves-effect">Update    </asp:LinkButton>
                                
                                
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                <div class="white-box">
                    <h3 class="box-title m-b-0">Data</h3>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <asp:GridView runat="server" ID="gv" CssClass="gvDataTable table-responsive table table-striped table-bordered" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="Mission" HeaderText="Mission" />
                                    <asp:BoundField DataField="Vision" HeaderText="Vision" />
                                    <asp:BoundField DataField="Expertise" HeaderText="Expertise" />
                                    <%--<asp:BoundField DataField="Url" HeaderText="Video Url" />--%>
                                   
                                    
                                   
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

