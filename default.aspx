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
            <span class="text_Intro" ><asp:Label ID="UserGreetTxt" runat="server" Text="Здравейте!" /><asp:Label ID="UserNameTxt" runat="server" Visible="false" Text="UserName" /></span>
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
                <asp:ListView ID="lvServices" runat="server" >
                    <LayoutTemplate>
                        <div runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div style="width:930px; height:439px;"> 
                            <div style="position:absolute; top:0px; left:0px;">
                                <asp:image runat="server" ImageUrl='<%# Eval("Image")%>' AlternateText='<%# Eval("Body")%>'  />
                            </div>
                            <div class="text_Banner" style="position:relative; padding-top:150px;left:140px; width:500px; ">
                                <%# Eval("Headline")%>
                            </div>
                            <div class="text_Intro" style="position:relative;top:20px;left:140px; width:500px; ">
                                <%# Eval("Body") & " само за "%><b><%# Eval("Price") & "лв"%></b>
                            </div>
                       </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <img alt="Bottom border "  src="img/banner_border_bottom.png" style="padding-top: 6px;" />
            <!-- Captions for Orbit -->
        </div>
    </div>
    <madam:footer runat="server" ID="site_footer" />
    </form>
</body>
</html>
