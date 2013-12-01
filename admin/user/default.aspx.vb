Imports System.Data.SqlClient
Partial Class admin_users_default
    Inherits System.Web.UI.Page

    Private usersOnline As Integer = Membership.GetNumberOfUsersOnline()
    Private usersSuspended As Integer = 0
    Private usersRegistered As Integer = Membership.GetAllUsers.Count
    Private con As New SqlConnection(ConfigurationManager.ConnectionStrings("MyDB").ConnectionString)

    Protected Sub lvUsersList_DataBound(sender As Object, e As System.EventArgs) Handles lvUsersList.DataBound
        Dim countUsers As New SqlCommand("SELECT COUNT(UserEmail) FROM [Users]", con)
        con.Open()
        Dim count As String = countUsers.ExecuteScalar()
        con.Close()
        lblUsersOnline.Text += usersOnline.ToString()
        lblUsersSuspended.Text += usersSuspended.ToString()
        lblUsersRegistered.Text += usersRegistered.ToString() & " (" & count & ")"

    End Sub

    Protected Sub lvUsersList_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvUsersList.ItemDataBound
        Dim userRow As HtmlTableRow = CType(e.Item.FindControl("userRow"), HtmlTableRow)
        Dim emailHref As HiddenField = e.Item.FindControl("hiddenEmail")
        Dim roleImage As Image = e.Item.FindControl("RoleImage")
        Dim userEmail As String = emailHref.Value
        Dim user As MembershipUser = Membership.GetUser(userEmail)
        If user.IsOnline Then
            userRow.BgColor = "#99FF99"
        End If
        If Not user.IsApproved Then
            userRow.BgColor = "#FF6600"
            usersSuspended += 1
        End If
        If roleImage.Attributes("Role") = "admin" Then
            roleImage.ImageUrl = "~/admin/users/admin.png"
        End If
    End Sub

    Protected Sub changeRole(ByVal sender As Object, ByVal e As BulletedListEventArgs)
        Dim bullet As BulletedList = CType(sender, BulletedList)
        Dim userEmail As String = bullet.Attributes("UserName")

        Dim userId As String = Membership.GetUser(userEmail).ProviderUserKey.ToString()

        Dim removeRole As New SqlCommand("DELETE FROM [aspnet_UsersInRoles] WHERE [UserId] = '" & userId & "'", con)
        con.Open()
        removeRole.ExecuteNonQuery()
        con.Close()

        Dim role As String = bullet.Items(e.Index).Value
        Roles.AddUserToRole(userEmail, role)

        lvUsersList.DataBind()
    End Sub
End Class
