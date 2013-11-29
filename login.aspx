<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Фризьорско студио “Мадам” - Вход/Регистрация</title>
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
            <span class="text_Intro">Вход</span>
            <br />

            <br />
            <br />
            <span class="text_Intro">Регистрация</span>
        </div>
        <madam:footer runat="server" ID="site_footer" />
    </form>
</body>
</html>
