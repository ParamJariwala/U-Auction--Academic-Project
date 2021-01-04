<%@ Page Title="" Language="C#" MasterPageFile="~/UAuctionMasterPage.master" AutoEventWireup="true" EnableEventValidation="false"
    CodeFile="Sale_Products.aspx.cs" Inherits="Add_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper clearfix">
        <!-- BEGIN .main-content -->
        <main class="main-content">


                <div class="woocommerce">


                    <h4 class="title-style3">
                        Sale Product			<span class="title-block"></span>
                    </h4>
                    <div class="msg success" runat="server" id="divsuccess" visible="false">
                        <p>Product Successfully Register!</p>
                    </div>
                    <div class="msg fail" runat="server" id="divfail" visible="false">
                        <p>Something Went Wrong Try Again!</p>
                    </div>
                   <div class="msg fail" runat="server" id="divlimit" visible="false">
                        <p>This Date Auction Reach its Limit! Try Another Date.</p>
                    </div>
                    <div class="msg fail" runat="server" id="divdate" visible="false">
                        <p>Select Greater Than Today Date.</p>
                    </div>
                    <div class="msg fail" runat="server" id="divimg" visible="false">
                        <p>Image Required.</p>
                    </div>
                    <div id="frm" class="login" style="border:solid; border-bottom-width:thick; border-color:green; padding:15px; margin-bottom:20px;">
                        
                        <div>
                        <label for="username">Product Name 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator1" ControlToValidate="productname" 
                                ForeColor="Red" ErrorMessage="*Product name required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" ID="productname" 
                                ValidationGroup="reg"></asp:TextBox>
                            </div>
                        <div class="columns-wrapper clearfix">
                        <label>Category</label>
                            <asp:DropDownList runat="server" ID="ddlcat" CssClass="input-text" 
                                style="width: calc(100% - 18px); height:40px;" 
                                DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID">
                            </asp:DropDownList>
                        </div>
                        <div style="margin-top:20px;" class="columns-wrapper clearfix">
                        <label for="username">Quantity 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator3" ControlToValidate="Qty" 
                                ForeColor="Red" ErrorMessage="*Quantity Required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" TextMode="Number"
                                ID="Qty" ValidationGroup="reg"></asp:TextBox>
                            </div>
                        <div>
                        <label for="username">Price 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" 
                                
                                ID="RequiredFieldValidator4" ControlToValidate="Price" ForeColor="Red" 
                                ErrorMessage="*Price required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" ID="Price" TextMode="Number"
                                ValidationGroup="reg"></asp:TextBox>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT * FROM [Category_Master]"></asp:SqlDataSource>
                            </div>
                        <div>
                        <label for="username">Description 
                        </label>
                            &nbsp;<asp:TextBox TextMode="MultiLine" id="descript" runat="server" 
                            cols="20" name="S1" rows="2" 
                                style="max-height:100px; max-width:626px; min-width:350px; min-height:50px;"></asp:TextBox></div>
                            
                        <div>
                        <label for="username">Date 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator2" ControlToValidate="txtdate" 
                                ForeColor="Red" ErrorMessage="*Date required." />
                        </label>
                            &nbsp;<asp:TextBox TextMode="Date" id="txtdate" runat="server" 
                            cols="20" name="S1" rows="2" CssClass="input-text"
                                style="max-height:100px; max-width:626px; min-width:350px; min-height:50px;"></asp:TextBox></div>
                            
                        <div>
                        <label for="username">Photos 
                            <asp:FileUpload runat="server" ID="file" />
                            </div>
                        <div>
                        <asp:Button runat="server" ValidationGroup="reg" ID="btnsubmit" CssClass="login-register-button" Text="Submit" OnClick="btnsubmit_Click" />
                        
                        
                        </div>
                    </div>

                </div>



                <!-- END .main-content -->
            </main>
        <!-- BEGIN .sidebar-content -->
        <!-- END .content-wrapper -->
    </div>
    </div>
</asp:Content>
