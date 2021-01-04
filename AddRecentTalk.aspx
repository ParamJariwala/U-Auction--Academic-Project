<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddRecentTalk.aspx.cs" Inherits="Admin_AddRecentTalk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script> 
</asp:Content>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Add Recent Talk</h4>
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
                                    Title
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txttitle" CssClass="form-control" Placeholder="Write Title"></asp:TextBox>
                                </div>

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
                                    Short Description
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtshort" CssClass="form-control" Placeholder="Short Description"></asp:TextBox>
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

                            <div class="form-group">
                                <label for="">
                                    Image
                                    </label>
                                <div>
                                    <asp:FileUpload runat="server" ID="file" />
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

            <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                <div class="white-box">
                    <h3 class="box-title m-b-0">Data</h3>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <asp:GridView runat="server" ID="gv" CssClass="gvDataTable table-responsive table table-striped table-bordered" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="Title" HeaderText="Title" />
                                     <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                              <%# Eval("Date","{0:dd-MM-yyyy}") %>  
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ShortDesc" HeaderText="Short Description" />
                                    <asp:BoundField DataField="LongDesc" HeaderText="Long Description" />
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <img src='../<%# Eval("image") %>' alt ="Image" style="height:100px; width:100px;">
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

