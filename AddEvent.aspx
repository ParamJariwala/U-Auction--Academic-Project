<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddEvent.aspx.cs" Inherits="Admin_AddEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Add Event</h4>
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
                                    Event Title
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txttitle" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="">
                                    Image
                                    </label>
                                <div>
                                    <asp:FileUpload runat="server" ID="file" />
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="">
                                    State
                                </label>
                             
                                <asp:DropDownList CssClass="form-control" ID="ddlstate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                                    
                                    <%--<asp:ListItem Text="view" Value="view"></asp:ListItem>
                                    <asp:ListItem Text="Website" Value="website"></asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="">
                                    City
                                </label>
                             
                                <asp:DropDownList CssClass="form-control" ID="ddlcity" runat="server">
                                    
                                    <%--<asp:ListItem Text="view" Value="view"></asp:ListItem>
                                    <asp:ListItem Text="Website" Value="website"></asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <label for="">
                                    Date
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="AddEmployee" ControlToValidate="txtdate" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*
                                    </asp:RequiredFieldValidator></label>
                                <div id="bloodhound">
                                    <asp:TextBox runat="server" ID="txtdate" CssClass="form-control" Placeholder="Select Date" ValidationGroup="AddEmployee"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="txtdate">
                                    </asp:CalendarExtender>
                                </div>

                            </div>

                            <div class="form-group">
                                <label for="">
                                    Type
                                    </label>
                                <div>
                                    <asp:DropDownList ID="ddltype" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="Complete">Complete</asp:ListItem>
                                        <asp:ListItem Value="Ongoing" Selected="True">Ongoing</asp:ListItem>
                                        <asp:ListItem Value="Future">Future</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                            
                            <%--<div class="form-group">
                                <label for="">
                                    Latitude
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtlatitude" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>

                            <div class="form-group">
                                <label for="">
                                    Longitude
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtlongitude" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>--%>
                            <div class="form-group">
                                <label for="">
                                    Address
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtaddress" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">
                                    Long Description
                                </label>
                                <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Width="100%" Height="360px"
                                    BasePath="~/fckeditor/">
                                </FCKeditorV2:FCKeditor>
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

            <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                <div class="white-box">
                    <h3 class="box-title m-b-0">Data</h3>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <asp:GridView runat="server" ID="gv" CssClass="gvDataTable table-responsive table table-striped table-bordered" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="Title" HeaderText="Title" />
                                    <asp:BoundField DataField="cityname" HeaderText="City" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" />
                                    <asp:BoundField DataField="Type" HeaderText="Type" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                    <asp:TemplateField HeaderText="Event Image">
                                        <ItemTemplate>
                                            <img src='../<%# Eval("img") %>' alt ="Image" style="height:100px; width:100px;">
                                                
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

