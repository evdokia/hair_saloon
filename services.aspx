<%@ Page Language="VB" AutoEventWireup="false" CodeFile="services.aspx.vb" Inherits="services" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="description" content="Фризьорско студио “Мадам” - Услуги" />
    <meta name="keywords" content="подстригване, навиване с маша, боядисване" />
    <title>Фризьорско студио “Мадам” - Услуги</title>
    <link href='http://fonts.googleapis.com/css?family=Poiret+One|Roboto:400,100,300|Open+Sans:400,300,600,700|Jura:400,300,500,600&subset=cyrillic' rel='stylesheet' type='text/css'>
    <link href="css/global.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <madam:header runat="server" ID="site_header" />
    <div class="content_centered">
        <div id="welcome_text">
         <br />
        <br />
        <br />
            <span class="text_Intro" style="margin-bottom: 10px;">Подстригване</span>
            <table class="text_Main">
                <tr>
                    <td>
                        <h2 style="margin: 0px;">Дамско подстригване, измиване и подсушаване </h2>
                    </td>
                    <td>
                        <div style="width: 20px;"></div>
                    </td>
                    <td>
                        <h2 style="margin: 0px;"><b>Цена: 20лв</b></h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2 style="margin: 0px;">Мъжко подстригване, измиване и подсушаване </h2>
                    </td>
                    <td>
                        <div style="width: 20px;"></div>
                    </td>
                    <td>
                        <h2 style="margin: 0px;"><b>Цена: 15лв</b></h2>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <span class="text_Intro" style="margin-bottom: 10px;">Навиване с маша</span>
            <table class="text_Main">
                <tr>
                    <td>
                        <h2 style="margin: 0px;">Къса Коса</h2>
                    </td>
                    <td>
                        <div style="width: 20px;"></div>
                    </td>
                    <td>
                        <h2 style="margin: 0px;"><b>Цена: 10лв</b></h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2 style="margin: 0px;">Средна Коса</h2>
                    </td>
                    <td>
                        <div style="width: 20px;"></div>
                    </td>
                    <td>
                        <h2 style="margin: 0px;"><b>Цена: 15лв</b></h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2 style="margin: 0px;">Дълга Коса</h2>
                    </td>
                    <td>
                        <div style="width: 20px;"></div>
                    </td>
                    <td>
                        <h2 style="margin: 0px;"><b>Цена: 35лв</b></h2>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <span class="text_Intro" style="margin-bottom: 10px;">Боядисване</span>
            <table class="text_Main">
                <tr>
                    <td>
                        <h2 style="margin: 0px;">Къса Коса</h2>
                    </td>
                    <td>
                        <div style="width: 20px;"></div>
                    </td>
                    <td>
                        <h2 style="margin: 0px;"><b>Цена: 25лв</b></h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2 style="margin: 0px;">Средна Коса</h2>
                    </td>
                    <td>
                        <div style="width: 20px;"></div>
                    </td>
                    <td>
                        <h2 style="margin: 0px;"><b>Цена: 30лв</b></h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2 style="margin: 0px;">Дълга Коса</h2>
                    </td>
                    <td>
                        <div style="width: 20px;"></div>
                    </td>
                    <td>
                        <h2 style="margin: 0px;"><b>Цена: 50лв</b></h2>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />
    </div>
        <madam:footer runat="server" ID="site_footer" />
    </form>
</body>
</html>
