<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddAapnaNGO.aspx.cs" Inherits="Admin_AddAapnaNGO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Aapna NGO</h4>
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
                                    <asp:TextBox runat="server" ID="txttitle" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="">
                                    Description
                                    </label>
                                <div>
                                   <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Width="100%" Height="360px"
                                    BasePath="~/fckeditor/">
                                </FCKeditorV2:FCKeditor>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="">
                                    Video
                                    </label>
                                <div>
                                    <asp:FileUpload runat="server" ID="file" />
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
                                    <asp:BoundField DataField="TitleNGO" HeaderText="Title" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                    <%--<asp:BoundField DataField="Url" HeaderText="Video Url" />--%>
                                   <asp:TemplateField HeaderText="Video">
                                        <ItemTemplate>
                                                
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

