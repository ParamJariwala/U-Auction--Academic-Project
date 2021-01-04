<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddStories.aspx.cs" Inherits="Admin_AddStories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Add Story</h4>
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
                                    Story Title
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txttitle" CssClass="form-control"></asp:TextBox>
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
                            
                            <div class="form-group">
                                <label for="">
                                    Link
                                    </label>
                                <div>
                                    <asp:TextBox runat="server" ID="txtlink" CssClass="form-control"></asp:TextBox>
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
                                    <asp:BoundField DataField="Title" HeaderText="Story Title" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <img src='../<%# Eval("img") %>' alt ="Image" style="height:100px; width:100px;">
                                                
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Link">
                                        <ItemTemplate>
                                            <a href='<%# Eval("Link") %>'><%# Eval("Link") %></a>
                                                
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

