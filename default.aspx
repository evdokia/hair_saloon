<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="_Default" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Фризьорско студио “Мадам”</title>
    <meta name="description" content="Фризьорско студио “Мадам”" />
    <meta name="keywords" content="подстригване, навиване с маша, боядисване" />
   

        <!-- Google Font Links -->
    <link href='http://fonts.googleapis.com/css?family=Poiret+One|Roboto:400,100,300|Open+Sans:400,300,600,700|Jura:400,300,500,600&subset=cyrillic' rel='stylesheet' type='text/css'>
    
    <!-- CSS Links -->
    <link href="css/global.css" rel="stylesheet" />
   
    

</head>
<body>
    <form id="form1" runat="server">
        <madam:header runat="server" ID="site_header" />
    <div class="content_centered">
        <div id="welcome_text">
            <br /><br />
            <span class="text_Intro" >Здравейте!</span>
            <br /><br />
            <span class="text_Main">
            Фризьорско студио “Мадам” Ви предлага модерен интериорен дизайн, уютна обстановка и любезно отношение на персонала. Престоят в нашия салон може да Ви донесе само красота и наслада, релакс и добро настроение.
            <br /><br />
            Салонът разполага с две фризьорски места. За удобство и улеснение на клиента - предлагаме безплатен Wi Fi .
            </span>
            
        </div>
        
    </div>
    <madam:footer runat="server" ID="site_footer" />
    </form>
</body>
</html>
