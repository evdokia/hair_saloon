
Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.QueryString("ReturnUrl") Is Nothing Then
            Dim redirect As String = Request.QueryString("ReturnUrl")
            RegButton.PostBackUrl = "register.aspx?RedirectUrl=" & redirect
        End If
    End Sub
    
End Class
