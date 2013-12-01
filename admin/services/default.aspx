<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="admin_services_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/admin.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="content_centered">
            <madam:admin_header runat="server" ID="admin_header" />
            <div>
                <asp:Button ID="btnInsert" runat="server" Text="Добави Нова" OnClick="NewService" />
            </div>
            <asp:ListView ID="lvServices" runat="server" DataKeyNames="ID">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblServicesID" runat="server" Text='<%# "ID: " & Eval("ID")%>' /><br />
                    <asp:Label ID="lblServicesImage" runat="server" Text='<%# "Снимка: " & Eval("Image")%>' /><br />
                    <asp:Label ID="lblServicesHeadline" runat="server" Text='<%# "Заглавие: " & Eval("Headline")%>' /><br />
                    <asp:Label ID="lblServicesBody" runat="server" Text='<%# "Описание: " & Eval("Body")%>' /><br />
                    <asp:Label ID="lblServicesDateUpload" runat="server" Text='<%# "Дата: " & Eval("DateUploaded")%>' /><br />
                    <asp:Label ID="lblServicesPrice" runat="server" Text='<%# "Цена: " & Eval("Price")%>' /><br />
                    <asp:Button ID="btnDeleteServices" runat="server" Text="Изтрий" OnCommand="DeleteService" CommandArgument='<%# Eval("ID")%>' />
                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btnDeleteServices" ConfirmText="If deleting this white paper makes you nervous, click Cancel."></ajaxToolkit:ConfirmButtonExtender>
                    <asp:Button ID="btnEditServices" runat="server" Text="Промени" CommandName="Edit" CommandArgument='<%# Eval("ID")%>' /><br />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblServicesID" runat="server" Text="ID: " /><asp:Label ID="txtServicesID" runat="server" Text='<%# Eval("ID")%>' /><br />
                    <asp:Label ID="lblServicesImage" runat="server" Text="Снимка: " /><asp:Image ID="txtServicesImage" runat="server" ImageUrl='<%# Bind("Image")%>' Height="100px" />
                    <asp:FileUpload ID="uploadServicesImage" runat="server" /><br />
                    <asp:Label ID="lblServicesHeadline" runat="server" Text="Заглавие: " /><asp:TextBox ID="txtServicesHeadline" runat="server" Text='<%# Bind("Headline")%>' /><br />
                    <asp:Label ID="lblServicesBody" runat="server" Text="Описание: " /><asp:TextBox ID="txtServicesBody" runat="server" Text='<%# Bind("Body")%>' TextMode="MultiLine" /><br />
                    <asp:Label ID="lblServicesDataUpload" runat="server" Text="Дата: " /><asp:TextBox ID="txtServicesDateUpload" runat="server" Text='<%# Bind("DateUploaded")%>' /><br />
                    <ajaxToolkit:CalendarExtender ID="lblServicesDateUploadExtender" runat="server" TargetControlID="txtServicesDateUpload" />
                    <asp:Label ID="lblServicesPrice" runat="server" Text="Цена: " /><asp:TextBox ID="txtServicesPrice" runat="server" Text='<%# Bind("Price")%>' /><br />
                    <asp:Button ID="btnUpdateServices" runat="server" Text="Запамети" OnCommand="SubmitService" />
                    <asp:Button ID="btnCancelServices" runat="server" Text="Отмени" CommandName="Cancel" /><br />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="lblServicesImage" runat="server" Text="Снимка: " />
                    <asp:FileUpload ID="uploadServicesImage" runat="server" /><br />
                    <asp:Label ID="lblServicesHeadline" runat="server" Text="Заглавие: " /><asp:TextBox ID="txtServicesHeadline" runat="server" Text='<%# Bind("Headline")%>' /><br />
                    <asp:Label ID="lblServicesBody" runat="server" Text="Описание: " /><asp:TextBox ID="txtServicesBody" runat="server" Text='<%# Bind("Body")%>' TextMode="MultiLine" /><br />
                    <asp:Label ID="lblServicesDataUpload" runat="server" Text="Дата: " /><asp:TextBox ID="txtServicesDateUpload" runat="server" Text='<%# Bind("DateUploaded")%>' /><br />
                    <ajaxToolkit:CalendarExtender ID="lblServicesDateUploadExtender" runat="server" TargetControlID="txtServicesDateUpload" />
                    <asp:Label ID="lblServicesPrice" runat="server" Text="Цена: " /><asp:TextBox ID="txtServicesPrice" runat="server" Text='<%# Bind("Price")%>' /><br />
                    <asp:Button ID="btnUpdateServices" runat="server" Text="Запамети" OnCommand="SubmitService" />
                    <asp:Button ID="btnCancelServices" runat="server" Text="Отмени" CommandName="Cancel" /><br />
                </InsertItemTemplate>
            </asp:ListView>
        </div>
    </form>
</body>
</html>
