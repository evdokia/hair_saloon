Imports Madam
Imports System.IO
Imports System.Data.SqlClient

Partial Class register
    Inherits System.Web.UI.Page

    Private con As New SqlConnection(ConfigurationManager.ConnectionStrings("MyDB").ConnectionString)


    Protected Sub buttonRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles buttonRegister.Click
        ' Create new user and retrieve create status result.
        If Page.IsValid Then
            regiter()
        Else
            Msg.Text = "Please enter the correct text from the image. Use refresh to change the image. "
        End If
        If IsPostBack Then
            ScriptManager.RegisterStartupScript(Me.Page, Me.Page.GetType(), "ReloadCaptcha", "recaptcha.reload();", True)
        End If
    End Sub

    Public Function GetErrorMessage(ByVal status As MembershipCreateStatus) As String

        Select Case status

            Case MembershipCreateStatus.DuplicateUserName
                Return "Email address already exists. Please enter a different email."

            Case MembershipCreateStatus.DuplicateEmail
                Return "A username for that e-mail address already exists. Please enter a different e-mail address."

            Case MembershipCreateStatus.InvalidPassword
                Return "Password too weak. Please use at least 6 alpha numerical characters."

            Case MembershipCreateStatus.InvalidEmail
                Return "The e-mail address provided is invalid. Please use a valid email address."

            Case MembershipCreateStatus.InvalidAnswer
                Return "The password retrieval answer provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidQuestion
                Return "The password retrieval question provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.InvalidUserName
                Return "The user name provided is invalid. Please check the value and try again."

            Case MembershipCreateStatus.ProviderError
                Return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact our support team."

            Case MembershipCreateStatus.UserRejected
                Return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact our support team."

            Case Else
                Return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact our support team."
        End Select

    End Function

    Public Function populateUserInfo() As Integer

        Dim fullName As String = NameTxt.Text
        Dim email As String = EmailTxt.Text.ToLower()

        Dim createQuery As String = "INSERT INTO [Users] ([UserEmail], [FullName], [Rating], [LastNotified]) VALUES ('" & email & "', '" & fullName & "', '0', '" & DateTime.Now().ToString("MM/dd/yyyy") & "')"
        Dim SqlCreateUserCommand As New SqlCommand(createQuery, con)
        con.Open()
        Dim i As Integer = SqlCreateUserCommand.ExecuteNonQuery()
        con.Close()
        Return i

    End Function

    Protected Sub regiter()
        Dim status As MembershipCreateStatus
        Dim passwordQuestion As String = Nothing
        Dim passwordAnswer As String = Nothing

        If Membership.RequiresQuestionAndAnswer Then
            passwordQuestion = PasswordTxt.Text
            passwordAnswer = PasswordTxt.Text
        End If

        Try
            Dim newUser As MembershipUser = Membership.CreateUser(EmailTxt.Text, PasswordTxt.Text, EmailTxt.Text, passwordQuestion, passwordAnswer, True, status)
            If newUser Is Nothing Then
                Msg.Text = GetErrorMessage(status)
            Else
                Roles.AddUserToRole(EmailTxt.Text, "user")
                If populateUserInfo() = 1 Then
                    Membership.ValidateUser(EmailTxt.Text, PasswordTxt.Text)
                    FormsAuthentication.SetAuthCookie(EmailTxt.Text, False)
                    If Not Request.QueryString("RedirectUrl") Is Nothing Then
                        Dim redirect As String = Request.QueryString("RedirectUrl")
                        Response.Redirect(redirect)
                    Else
                        Response.Redirect("/user/index.aspx")
                    End If
                Else
                    Membership.DeleteUser(EmailTxt.Text)
                    Msg.Text = "There was a problem creating your account. Please try again. If the problem persists please contact our support team."
                End If
            End If
        Catch ex As Exception
            'Dim err As New ErrorLog()
            'err.Log(ex)
        End Try

    End Sub

End Class
