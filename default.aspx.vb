Imports System.Data.SqlClient
Imports System.Data
Imports Madam

Partial Class _Default
    Inherits System.Web.UI.Page
    Private userName As String = System.Web.HttpContext.Current.User.Identity.Name
    Private con As New SqlConnection(ConfigurationManager.ConnectionStrings("MyDB").ConnectionString)

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If User.Identity.IsAuthenticated Then
            Dim nameCommand As New SqlCommand("SELECT [FullName] FROM [Users] WHERE [UserEmail] = '" & userName & "'", con)
            con.Open()
            UserNameTxt.Text = nameCommand.ExecuteScalar()
            Page.Header.Title = UserNameTxt.Text & " | Фризьорско студио 'Мадам' "
            UserGreetTxt.Text = "Здравейте, "
            con.Close()
            UserNameTxt.Visible = True
        Else
            UserGreetTxt.Text = "Здравейте!"
            UserNameTxt.Visible = False
        End If


        lvServices.DataSource = Madam.Services.GetServicesList
        lvServices.DataBind()

    End Sub
End Class
