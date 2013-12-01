Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Namespace Madam
    Public Class User

        Private con As New SqlConnection(ConfigurationManager.ConnectionStrings("MyDB").ConnectionString)

        Public Function GetUserName(ByVal email As String) As String
            Dim userName As String = ""
            Dim sqlFullName As New SqlCommand("SELECT [FullName] FROM [Users] WHERE [UserEmail] = '" & email & "'", con)
            con.Open()
            userName = sqlFullName.ExecuteScalar()
            con.Close()

            Return userName
        End Function

        Public Function CheckAuth(Optional ByVal Require As Boolean = False) As String
            If HttpContext.Current.User.Identity.IsAuthenticated Then
                Dim userEmail As String = HttpContext.Current.User.Identity.Name
                Return userEmail
            ElseIf Require Then
                Dim currentPage As String = HttpUtility.UrlEncode(HttpContext.Current.Request.Url.PathAndQuery)
                HttpContext.Current.Response.Redirect("~/login.aspx?ReturnUrl=" & currentPage, True)
            Else
                Return ""
            End If
        End Function
    End Class
End Namespace
