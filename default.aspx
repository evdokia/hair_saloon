<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="_Default" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Фризьорско студио “Мадам”</title>
    <meta name="description" content="Фризьорско студио “Мадам”" />
    <meta name="keywords" content="подстригване, навиване с маша, боядисване" />
     <!-- JS Links -->
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.orbit-1.2.3.min.js"></script>

    <!-- plugins -->
    <script type="text/javascript">
        $(window).load(function () {
            $('#featured').orbit();
        });
		</script>

    <!-- Google Font Links -->
    <link href='http://fonts.googleapis.com/css?family=Poiret+One|Roboto:400,100,300|Open+Sans:400,300,600,700|Jura:400,300,500,600&subset=cyrillic' rel='stylesheet' type='text/css'>
    
    <!-- CSS Links -->
    <link rel="stylesheet" href="css/orbit-1.2.3.4.css" />
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
        <div id="slider">
            <img alt="Top border " src="img/banner_border_top.png" />
            <div id="featured" style="position:relative; top:0px; left:0px; ">
                <asp:LinkButton ID="btn1" runat="server">
                        <div style="position:relative; top:0px; left:0px;">
                            <img src="img/hp_1.jpg" alt="Боядисване на Къса, Средна и Дълга Коса"  />
                        </div>
                        <div class="text_Banner" style="position:absolute;top:150px;left:140px; width:500px; ">
                            Дамско подстригване
                        </div>
                </asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server">
                        <div style="position:relative; top:0px; left:0px;">
                            <img src="img/hp_2.jpg" alt="Боядисване на Къса, Средна и Дълга Коса"  />
                        </div>
                        <div class="text_Banner" style="position:absolute;top:150px;left:140px; width:500px; ">
                            Боядисване
                        </div>
                </asp:LinkButton>
                 <asp:LinkButton ID="LinkButton2" runat="server">
                        <div style="position:relative; top:0px; left:0px;">
                            <img src="img/hp_3.jpg" alt="Боядисване на Къса, Средна и Дълга Коса"  />
                        </div>
                        <div class="text_Banner" style="position:absolute;top:150px;left:140px; width:500px; ">
                            Навиване с маша
                        </div>
                </asp:LinkButton>
                 <asp:LinkButton ID="LinkButton3" runat="server">
                        <div style="position:relative; top:0px; left:0px;">
                            <img src="img/hp_4.jpg" alt="Боядисване на Къса, Средна и Дълга Коса"  />
                        </div>
                        <div class="text_Banner" style="position:absolute;top:150px;left:140px; width:500px; ">
                            Посетете ни още Днес!!!
                        </div>
                </asp:LinkButton>
                
            </div>
            <img alt="Bottom border "  src="img/banner_border_bottom.png" style="padding-top: 6px;" />
            <!-- Captions for Orbit -->
        </div>
    </div>
    <madam:footer runat="server" ID="site_footer" />
    </form>
</body>
</html>
