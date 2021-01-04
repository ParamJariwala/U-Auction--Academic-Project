<%@ Page Title="" Language="C#" MasterPageFile="~/UAuctionMasterPage.master" AutoEventWireup="true" CodeFile="Sign_In.aspx.cs" Inherits="Sign_In" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper clearfix" style="margin-left:280px;">

            <!-- BEGIN .main-content -->
            <main class="main-content">


                <div class="woocommerce">


                    <h4 class="title-style3">
                        Login			<span class="title-block"></span>
                    </h4>
                    <div class="msg fail" runat="server" id="divfail" visible="false">
                        <p>Wrong Username And Password! Try Again!</p>
                    </div>
                    <div class="msg fail" runat="server" id="divlogin" visible="false">
                        <p>Login First for Insert Sale Product!</p>
                    </div>
                    <div id="frm" class="login" style="border:solid; border-bottom-width:thick; border-color:green; padding:15px; margin-bottom:20px;">
                         
                        <label for="username">Username or email address 
                        <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator1" ControlToValidate="txtusername" 
                                ForeColor="Red" ErrorMessage="*Username required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" ID="txtusername" 
                                ValidationGroup="reg"></asp:TextBox>
                        &nbsp;<label for="password">Password 
                        <asp:RequiredFieldValidator runat="server" 
                                ValidationGroup="reg" ID="RequiredFieldValidator2" ControlToValidate="txtpassword" 
                                ForeColor="Red" ErrorMessage="*Password required." /></label>
                        <asp:TextBox runat="server" CssClass="input-text required" ID="txtpassword" 
                                ValidationGroup="reg" TextMode="Password"></asp:TextBox>
                        &nbsp;
                        <asp:Button runat="server" ValidationGroup="reg" ID="login" 
                            CssClass="login-register-button" Text="Login" OnClick="btnlogin_Click" />
                        <label for="rememberme" class="inline">
                            <input name="rememberme" type="checkbox" id="rememberme" value="forever" /> Remember me
                        </label>
                        <p><a href="Sign_Up.aspx">Not Register Yet?</a></p>
                        <p style="color:red;"> 
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </p>


                    </div>

                </div>



                <!-- END .main-content -->
            </main>


            <!-- BEGIN .sidebar-content -->
            




            <!-- END .content-wrapper -->
        </div>
</asp:Content>

