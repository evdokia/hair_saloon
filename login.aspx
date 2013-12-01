<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Фризьорско студио “Мадам” - Вход/Регистрация</title>
    <meta name="description" content="Фризьорско студио “Мадам” - Контакти" />
    <meta name="keywords" content="подстригване, навиване с маша, боядисване" />
    <link href='http://fonts.googleapis.com/css?family=Poiret+One|Roboto:400,100,300|Open+Sans:400,300,600,700|Jura:400,300,500,600&subset=cyrillic' rel='stylesheet' type='text/css'>
    <link href="css/global.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" style="margin: 0px; padding: 0px;">
    <madam:header runat="server" ID="site_header" />
        <div class="content_centered">
            <br />
            <br />
    <span class="text_Intro">Вход</span>
    <div id="wrapperMiddle" style="width:1024px; margin-right: auto; margin-top: 0px; margin-bottom: 0px; margin-left: auto;" >
        <div style="padding-top:20px; padding-bottom:80px; padding-left:0px;">

        <asp:UpdatePanel ID="up_login" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
				<div id="LoginInfoDiv" runat="server">
                <asp:Label CssClass="LoginInfoLabel" ID="InfoLabel" runat="server" Text=""></asp:Label>
                </div>
                <asp:Login ID="Login1" runat="server" LoginButtonType="Image">
                <LayoutTemplate>
                    <asp:Panel ID="panel_Login" runat="server" DefaultButton="LoginButton">
                    <table border="0" cellpadding="0"  cellspacing="0" class="text_Small">
                        <tr valign="top">
                            <td>
                                <div  style="width:160px;">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Емейл:</asp:Label>
                                    <br />
                                    <asp:TextBox ID="UserName" runat="server" Width="150px" BorderColor="#D2EEFB" BorderStyle="Solid" BorderWidth="1px" Font-Names="Calibri"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    <br/>
                                    <asp:RegularExpressionValidator ID="ValidEmailRequired" runat="server" ControlToValidate="UserName" Font-Size="12px" ErrorMessage="Въведете валиден емейл" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                            <td>
                                <div style="width:160px;">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Парола:</asp:Label>
                                    <br />
                                    <asp:TextBox ID="Password" runat="server" Width="150px" TextMode="Password" BorderColor="#D2EEFB" BorderStyle="Solid" BorderWidth="1px" Font-Names="Calibri" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </div>
                            </td>
                            <td>
                                <div style="padding-top:16px">
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                                    BackColor="#ff00dc" ForeColor="white" text="Влез" BorderWidth="1" BorderColor="White"
                                    ValidationGroup="Login1" AlternateText="Log In" />
                                </div>                             
                            </td>
                            <td>
                                <div style="padding:17px">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </div>
                            </td>
                        </tr>
                    </table>
                    <div class="text_Small" style="padding-left:1px;">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td style="width:179px;" valign="middle">
                                    <div style="position:relative;"> 
                                    <asp:CheckBox ID="RememberMe" style="padding-top:5px"  runat="server" Text=" " />
                                    <div style="position:absolute; top:0px; left:20px;"  >Запомни ме</div>
                                    </div>

                                </td>
                                <td style="color:#ff00dc;" ></td>
                            </tr>
                        </table>
                    </div>
                    </asp:Panel>
                </LayoutTemplate>
                </asp:Login>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
        <span class="text_Intro">Нямате Регистрация?</span>
        <div style="padding:20px 0px 80px 0px;">
        <asp:button ID="RegButton" runat="Server" PostBackUrl="register.aspx" BackColor="#ff00dc" ForeColor="white" BorderWidth="1" BorderColor="White" Text="Регистрирай се тук" tooltip="Sign Up" />
        </div>
    </div>
    
    </div>
        <madam:footer runat="server" ID="site_footer" />
    </form>
</body>
</html>
