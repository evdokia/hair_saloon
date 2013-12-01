Imports System.Data.SqlClient
Imports Madam

Partial Class admin_users_edit
    Inherits System.Web.UI.Page

    Protected userName As String
    Private userInfo As MembershipUser
    Private con As New SqlConnection(ConfigurationManager.ConnectionStrings("MyDB").ConnectionString)

    Protected Sub btnSuspend_Click(sender As Object, e As System.EventArgs) Handles btnSuspend.Click
        If userInfo.IsApproved Then
            userInfo.IsApproved = False
        Else
            userInfo.IsApproved = True
        End If
        Membership.UpdateUser(userInfo)
        If userInfo.IsApproved Then
            btnSuspend.Text = "Suspend"
        Else
            btnSuspend.Text = "Unsuspend"
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        userName = HttpContext.Current.Request.QueryString("user")
        userInfo = Membership.GetUser(userName)
        If userInfo.IsApproved Then
            btnSuspend.Text = "Suspend"
        Else
            btnSuspend.Text = "Unsuspend"
        End If
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As System.EventArgs) Handles btnDelete.Click
        Dim deleteUserTrack As New SqlCommand("DELETE FROM [Users] WHERE [UserEmail] = '" & userName & "'", con)
        con.Open()
        If deleteUserTrack.ExecuteNonQuery() = 1 Then
            Membership.DeleteUser(userName)
        End If
        con.Close()
    End Sub

End Class
