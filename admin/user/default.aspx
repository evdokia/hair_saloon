<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="admin_users_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/admin.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">
    
    <div  class="content_centered">
    <madam:admin_header ID="admin_header" runat="server" />
     <table>
        <tr>
            <td>
                <div style="margin-left: 20px;">
                    <asp:Label ID="lblUsersRegistered" runat="server" BackColor="#66CCFF" Text="Users registered - " />
                    <asp:Label ID="lblUsersOnline" runat="server" BackColor="#99FF99" Text="Users online - " />
                    <asp:Label ID="lblUsersSuspended" runat="server" BackColor="#FF6600" Text="Users suspended - " />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="lvUsersList" runat="server" DataKeyNames="UserEmail" DataSourceID="SqlUsersList"
                    EnableModelValidation="True">
                    <ItemTemplate>
                        <tr id="userRow" runat="server">
                            <td>
                                <asp:Image ID="RoleImage" runat="server" Role='<%# Eval("RoleName") %>' ImageUrl="~/admin/users/user.png" />
                                <asp:BulletedList ID="RoleDLL" runat="server" DisplayMode="LinkButton" OnClick="changeRole"
                                    UserName='<%# Eval("UserName") %>' BackColor="White" BorderStyle="Solid" BorderWidth="1px"
                                    BorderColor="#33CCFF" Style="list-style-type: none;">
                                    <asp:ListItem Value="user" Text="User"></asp:ListItem>
                                    <asp:ListItem Value="poweruser" Text="Power User"></asp:ListItem>
                                    <asp:ListItem Value="admin" Text="admin"></asp:ListItem>
                                </asp:BulletedList>
                                <ajaxToolkit:DropDownExtender ID="DropDownExtender1" runat="server" DropDownControlID="RoleDLL"
                                    TargetControlID="RoleImage" Enabled="True" DynamicServicePath="">
                                </ajaxToolkit:DropDownExtender>
                            </td>
                            <td>
                                <asp:Label ID="CreatedLabel" runat="server" Text='<%# Format(Eval("CreateDate"), "dd/MM/yyyy") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LastLoginLabel" runat="server" Text='<%# Format(Eval("LastLoginDate"), "dd/MM/yyyy") %>' />
                            </td>
                            <td>
                                <a id="UserEmailLabel" runat="server" href='<%# "mailto:" & Eval("UserName") %>'>
                                    <%# Eval("UserName") %>
                                </a>
                                <asp:HiddenField ID="hiddenEmail" runat="server" Value='<%# Eval("UserName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Eval("FullName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
                            </td>
                            <td>
                                <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" PostBackUrl='<%# "~/admin/users/edit.aspx?user=" & Eval("UserName") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table1" runat="server">
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="" rules="all">
                                        <tr id="Tr2" runat="server" style="">
                                            <th id="Th9" runat="server">Role
                                            </th>
                                            <th id="Th1" runat="server">Created
                                            </th>
                                            <th id="Th7" runat="server">Last Login
                                            </th>
                                            <th id="Th8" runat="server">UserEmail
                                            </th>
                                            <th id="Th2" runat="server">FullName
                                            </th>
                                            <th id="Th4" runat="server">Rating
                                            </th>
                                            <th id="Th5" runat="server">Commands
                                            </th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr3" runat="server">
                                <td id="Td2" runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                <img src="http://www.jumpcb.com/images/images/10.gif" style="border-style: none; width: 1px; height: 1px;" /></td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlUsersList" runat="server" ConnectionString="<%$ ConnectionStrings:MyDB %>"
        SelectCommand="SELECT * FROM [viewUsersList] ORDER BY [CreateDate] DESC"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
