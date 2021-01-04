<%@ Page Title="" Language="C#" MasterPageFile="~/UAuctionMasterPage.master" AutoEventWireup="true" CodeFile="Sign_Up.aspx.cs" Inherits="Sign_Up" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper clearfix">

        <!-- BEGIN .main-content -->
        <main class="main-content">


                <div class="woocommerce">


                    <h4 class="title-style3">
                        Register			<span class="title-block"></span>
                    </h4>
                    <div class="msg success" runat="server" id="divsuccess" visible="false">
                        <p>You Are Successfully Register!</p>
                    </div>
                    <div class="msg fail" runat="server" id="divfail" visible="false">
                        <p>Something Went Wrong Try Again!</p>
                    </div>
                    <div class="msg fail" runat="server" id="diverror" visible="false">
                        <p>This Username Already Exist! Try Different.</p>
                    </div>
                    <div class="msg fail" runat="server" id="diverror2" visible="false">
                        <p>This Email Already Exist! Try Different.</p>
                    </div>
                    <div id="frm" class="login" style="border:solid; border-bottom-width:thick; border-color:green; padding:15px; margin-bottom:20px;">
                        <div>
                        <label for="username">First Name 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator5" ControlToValidate="fname" 
                                ForeColor="Red" ErrorMessage="*First name required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" ID="fname" 
                                ValidationGroup="reg"></asp:TextBox>
                        </div>
                        <div>
                        <label for="username">Last Name 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator1" ControlToValidate="lname" 
                                ForeColor="Red" ErrorMessage="*Last name required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" ID="lname" 
                                ValidationGroup="reg"></asp:TextBox>
                            </div>
                        <div>
                        <label for="username">Username 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator2" ControlToValidate="username" 
                                ForeColor="Red" ErrorMessage="*Username Required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" ID="username" 
                                ValidationGroup="reg"></asp:TextBox>
                            </div>
                        <div>
                        <label for="username">Password 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator3" ControlToValidate="pass" 
                                ForeColor="Red" ErrorMessage="*Password Required." /></label>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="input-text required" 
                                ID="pass" ValidationGroup="reg"></asp:TextBox>
                            </div>
                        <div>
                        <label for="username">Email 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ID="RequiredFieldValidator4" ControlToValidate="email" ForeColor="Red" 
                                ErrorMessage="*Email id required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" ID="email" 
                                ValidationGroup="reg"></asp:TextBox>
                            </div>
                        <div>
                        <label for="username">Address 
                            <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator6" ControlToValidate="address" 
                                ForeColor="Red" ErrorMessage="*Address required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" ID="address" 
                                ValidationGroup="reg"></asp:TextBox>
                            </div>
                        <div>
                        <label for="username">Mobile <asp:RequiredFieldValidator ValidationExpression="\d+" 
                                runat="server" ValidationGroup="reg" ID="RequiredFieldValidator7" 
                                ControlToValidate="mobile" ForeColor="Red" 
                                ErrorMessage="*Mobile No. required." /></label>
                        <asp:TextBox runat="server" MaxLength="10" CssClass="input-text required" 
                                ID="mobile" ValidationGroup="reg"></asp:TextBox>
                            </div>
                        <div class="columns-wrapper clearfix">
                        <div class="one-half">
                            <asp:DropDownList runat="server" ID="state" CssClass="input-text" 
                                style="width: calc(100% - 18px); height:40px;">
                                <asp:ListItem Text="Gujarat" Value="Gujarat"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="one-half last-col">
                            <asp:DropDownList runat="server" ID="city" CssClass="input-text" 
                                style="width: calc(100% - 18px); height:40px;">
                                <asp:ListItem Text="Surat" Value="Surat"></asp:ListItem>
                                <asp:ListItem Text="Ahemdabad" Value="Ahemdabad"></asp:ListItem>
                                <asp:ListItem Text="Baroda" Value="Baroda"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                            </div>
                        <div style="margin-top:20px;" class="columns-wrapper clearfix">
                        <label for="username">Gender</label>
                        
                         <hr />
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                RepeatDirection="Horizontal">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>

                        
                            <hr />
                            </div>
                        
                        <div>
                        <asp:Button runat="server" ValidationGroup="reg" ID="btnsubmit" CssClass="login-register-button" Text="Submit" OnClick="btnsubmit_Click" />
                        
                        <p><a href="Sign_In.aspx">Already Register?</a></p>
                        </div>
                    </div>

                </div>



                <!-- END .main-content -->
            </main>


        <!-- BEGIN .sidebar-content -->





        <!-- END .content-wrapper -->
    </div>
</asp:Content>

