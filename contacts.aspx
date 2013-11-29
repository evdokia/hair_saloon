<%@ Page Language="VB" AutoEventWireup="false" CodeFile="contacts.aspx.vb" Inherits="contacts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Фризьорско студио “Мадам” - Контакти</title>
    <meta name="description" content="Фризьорско студио “Мадам” - Контакти" />
    <meta name="keywords" content="подстригване, навиване с маша, боядисване" />
    <link href='http://fonts.googleapis.com/css?family=Poiret+One|Roboto:400,100,300|Open+Sans:400,300,600,700|Jura:400,300,500,600&subset=cyrillic' rel='stylesheet' type='text/css'>
    <link href="css/global.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <madam:header runat="server" ID="site_header" />
        <div class="content_centered">
            <div id="welcome_text">
                <br /><br />
                <span class="text_Intro">Адрес</span><br />
                <span class="text_Main">бул. България 5, Пазарджик, 4400, България</span><br /><br /><br />
                <span class="text_Intro">Телефон</span><br />
                <span class="text_Main">+359 (0)34 123 456; +359 (0)34 789 1011</span>
                <br />
                <br />
                <iframe width="930" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.uk/maps?q=%D0%B1%D1%83%D0%BB.+%D0%91%D1%8A%D0%BB%D0%B3%D0%B0%D1%80%D0%B8%D1%8F+5,+%D0%9F%D0%B0%D0%B7%D0%B0%D1%80%D0%B4%D0%B6%D0%B8%D0%BA,+4400,+%D0%91%D1%8A%D0%BB%D0%B3%D0%B0%D1%80%D0%B8%D1%8F&amp;ie=UTF8&amp;hl=en&amp;hq=&amp;hnear=bulevard+%22Bulgaria%22+5,+4400+Pazardzhik,+Bulgaria&amp;t=m&amp;ll=42.19546,24.333258&amp;spn=0.022256,0.079823&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
                <br />
                <small><a href="https://maps.google.co.uk/maps?q=%D0%B1%D1%83%D0%BB.+%D0%91%D1%8A%D0%BB%D0%B3%D0%B0%D1%80%D0%B8%D1%8F+5,+%D0%9F%D0%B0%D0%B7%D0%B0%D1%80%D0%B4%D0%B6%D0%B8%D0%BA,+4400,+%D0%91%D1%8A%D0%BB%D0%B3%D0%B0%D1%80%D0%B8%D1%8F&amp;ie=UTF8&amp;hl=en&amp;hq=&amp;hnear=bulevard+%22Bulgaria%22+5,+4400+Pazardzhik,+Bulgaria&amp;t=m&amp;ll=42.19546,24.333258&amp;spn=0.022256,0.079823&amp;z=14&amp;iwloc=A&amp;source=embed" style="text-align: left">View Larger Map</a></small>
                <br />
                <br />
                <br /><br />
            </div>
        </div>
        <madam:footer runat="server" ID="site_footer" />
    </form>
</body>
</html>
