<%@ Control Language="VB" AutoEventWireup="false" CodeFile="admin_header.ascx.vb" Inherits="controls_admin_header" %>

<ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</ajaxToolkit:ToolkitScriptManager>
<table cellspacing="5">
    <tr valign="top">
        <td>
            <asp:LinkButton ID="btnHome" runat="server" PostBackUrl="~/default.aspx" CausesValidation="false" target="_new">Начална страница</asp:LinkButton>
        </td>
        <td><div class="menu_spacer"></div></td>
        <td>
            <asp:LinkButton ID="btnUser" runat="server" PostBackUrl="~/admin/users/default.aspx" CausesValidation="false">Потребители</asp:LinkButton>
        </td>
        <td><div class="menu_spacer"></div></td>
        <td>
            <asp:LinkButton ID="btnServices" runat="server" PostBackUrl="~/admin/services/default.aspx" CausesValidation="false">Услуги</asp:LinkButton>
        </td>
    </tr>
</table>
