<%@ Page Language="VB" AutoEventWireup="false" CodeFile="edit.aspx.vb" Inherits="admin_users_edit" %>

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
                <asp:ListView ID="lvUserEdit" runat="server" DataKeyNames="UserEmail" DataSourceID="SqlUserEdit"
                    EditIndex="0" EnableModelValidation="True">
                    <EditItemTemplate>
                        <span style="">
                            UserEmail:
                            <asp:Label ID="UserEmailLabel1" runat="server" Text='<%# Eval("UserEmail") %>' />
                            <br />
                            FullName:
                            <asp:TextBox ID="FullNameTextBox" runat="server" Text='<%# Bind("FullName") %>' />
                            <br />
                            Rating:
                            <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            <br />
                            <br />
                        </span>
                    </EditItemTemplate>
                    <ItemTemplate>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </td>
            <td valign="top">
                <table style="margin-left: 150px;" border="1" cellspacing="0" width="150px">
                    <tr>
                        <td align="center">
                            Account Tools 
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnSuspend" Text="Suspend Account" runat="server" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" /><br />
                            <br />
                            <ajaxToolkit:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server"
                                ConfirmText="Do you really want to delete the user data? This action cannot be undone."
                                Enabled="True" TargetControlID="btnDelete">
                            </ajaxToolkit:ConfirmButtonExtender>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlUserEdit" runat="server" ConnectionString="<%$ ConnectionStrings:MyDB %>"
        DeleteCommand="DELETE FROM [Users] WHERE [UserEmail] = @UserEmail" InsertCommand="INSERT INTO [Users] ([UserEmail], [FullName], [Rating]) VALUES (@UserEmail, @FullName, @Rating)"
        SelectCommand="SELECT * FROM [Users] WHERE ([UserEmail] = @UserEmail)" UpdateCommand="UPDATE [Users] SET [FullName] = @FullName, [Rating] = @Rating WHERE [UserEmail] = @UserEmail">
        <DeleteParameters>
            <asp:Parameter Name="UserEmail" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserEmail" Type="String" />
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="Rating" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="UserEmail" QueryStringField="user"
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FullName" Type="String" />
            <asp:Parameter Name="Rating" Type="Int32" />
            <asp:Parameter Name="UserEmail" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
