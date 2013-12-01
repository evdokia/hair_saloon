<%@ Page Language="VB" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Фризьорско студио “Мадам” - Нова Регистрация</title>
    <meta name="description" content="Фризьорско студио “Мадам” - Контакти" />
    <meta name="keywords" content="подстригване, навиване с маша, боядисване" />
    <link href='http://fonts.googleapis.com/css?family=Poiret+One|Roboto:400,100,300|Open+Sans:400,300,600,700|Jura:400,300,500,600&subset=cyrillic' rel='stylesheet' type='text/css'>
    <link href="css/global.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <madam:header runat="server" ID="site_header" />
        <div class="content_centered">
            <br />
            <br />
            <span class="text_Intro">Нова Регистрация</span>
            <br />
            <br />
             <table border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td>
                    <div class="text_Small" style="padding-top: 5px;">
                        <asp:Label ID="NameLable" Text="Full Name" runat="server"></asp:Label><br />
                        <asp:TextBox ID="NameTxt" runat="server" Width="180px" Font-Names="Calibri" BorderColor="#D2EEFB"
                            BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AccountNameRequired" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="NameTxt">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="text_Small" style="padding-top: 5px;">
                        <asp:Label ID="EmailLabel" Text="Email" runat="server"></asp:Label><br />
                        <asp:TextBox ID="EmailTxt" runat="server" Width="180px" BorderColor="#D2EEFB" BorderStyle="Solid"
                            BorderWidth="1px" Font-Names="Calibri" AutoCompleteType="Email" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your email address"
                            ControlToValidate="EmailTxt">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTxt" ErrorMessage="Enter a valid e-mail address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </td>
                <td style="width: 10px;">
                    &nbsp;
                </td>
                <td>
                    <div class="text_Small" style="padding-top: 5px;">
                        <asp:Label ID="PasswordLabel" Text="Password" runat="server"></asp:Label><br />
                        <asp:TextBox ID="PasswordTxt" runat="server" Width="180px" TextMode="Password" BorderColor="#D2EEFB"
                            BorderStyle="Solid" BorderWidth="1px" Font-Names="Calibri" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ErrorMessage="Please enter password"
                            ControlToValidate="PasswordTxt">*</asp:RequiredFieldValidator>
                    </div>
                    <div class="text_Small" style="padding-top: 5px;">
                        <asp:Label ID="ConfirmPasswordLabel" Text="Confirm Password" runat="server"></asp:Label><br />
                        <asp:TextBox ID="ConfirmPasswordTxt" runat="server" Width="180px" TextMode="Password"
                            BorderColor="#D2EEFB" BorderStyle="Solid" BorderWidth="1px" Font-Names="Calibri"
                            MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ErrorMessage="Please confirm your password"
                            ControlToValidate="ConfirmPasswordTxt">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PasswordTxt"
                            ControlToValidate="ConfirmPasswordTxt" ErrorMessage="Password does not match"></asp:CompareValidator>
                    </div>
                </td>
                <td style="width: 20px;">
                    &nbsp;
                </td>
                <td>
                </td>
            </tr>
        </table>
        <div style="padding-top: 20px; padding-bottom: 20px;">
            <div style="height: 1px; background: #D8F1FC; width: 595px;">
            </div>
        </div>
        
        <div class=" fontsSmall " style="padding-top: 19px; padding-bottom: 40px;">
            <table>
                <tr>
                    <td colspan="2" style="padding-bottom: 20px;">
                        <div style="background-color:white;">
                        <recaptcha:RecaptchaControl ID="recaptcha" runat="server" PublicKey="6Len5c0SAAAAAGy3ayJOK07SdyRUnlcsSqd5kR1t"
                            PrivateKey="6Len5c0SAAAAAJit3d9r5oNAtcmi1JazrzROfVS8" Theme="clean" />
                        </div>
                    </td>
                </tr>
                <tr valign="middle">
                    <td>
                        <asp:Button ID="buttonRegister" runat="server" BackColor="#ff00dc" ForeColor="white" Text="Регистрирай ме" BorderWidth="1" BorderColor="White" />
                        <br />
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div style="padding-left: 5px;">
                                    <asp:Label CssClass="fontsSmall" ID="Msg" ForeColor="Maroon" runat="server" Width="250px" /></div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="buttonRegister" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <img src="http://www.jumpcb.com/images/images/10.gif" style="border-style: none;
                            width: 1px; height: 1px;" />
                    </td>
                </tr>
            </table>
        </div>
        </div>
        <madam:footer runat="server" ID="site_footer" />
    </form>
</body>
</html>
