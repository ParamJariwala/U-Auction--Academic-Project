<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Change Admin Password</h4>
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
                            Success ! Changes Password Successfully
                        </div>
                        <div class="alert alert-danger alert-dismissable" id="divError" runat="server" visible="false">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Failure ! Confirm Password Does not Match !
                        </div>
                        <div class="alert alert-danger alert-dismissable" id="divfail" runat="server" visible="false">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            Failure ! Old Password Does not Match !
                        </div>
                    </p>
                    <div class="row">
                        <div class="col-sm-12 col-lg-12 col-xs-12">
                            
                            <div class="form-group">
                                <label for="">
                                    Old Password
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="AddEmployee" ControlToValidate="txtoldpass" ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*
                                    </asp:RequiredFieldValidator></label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtoldpass" CssClass="typeahead form-control" Placeholder="Enter Old Password" ValidationGroup="AddEmployee"></asp:TextBox>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="">
                                    New Password
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="AddEmployee" ControlToValidate="txtnewpass" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*
                                    </asp:RequiredFieldValidator></label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtnewpass" TextMode="Password" CssClass="typeahead form-control" Placeholder="Enter New Password" ValidationGroup="AddEmployee"></asp:TextBox>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="">
                                    Confirm Password
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="AddEmployee" ControlToValidate="txtconfirm" ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*
                                    </asp:RequiredFieldValidator></label>
                                <div>
                                    <asp:TextBox runat="server" TextMode="Password" ID="txtconfirm" CssClass="typeahead form-control" Placeholder="Enter Confirm Password" ValidationGroup="AddEmployee"></asp:TextBox>
                                </div>

                            </div>
                            
                            <div class="text-right">
                                <asp:LinkButton runat="server" ID="lbSubmit" ValidationGroup="AddEmployee" OnClick="lbSubmit_Click" CssClass="fcbtn btn btn-success btn-outline btn-1d waves-effect">Submit</asp:LinkButton>
                                
                                <button type="reset" class=" fcbtn btn btn-danger btn-outline btn-1d waves-effect">Cancel</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            
        </div>
    </div>
</asp:Content>

