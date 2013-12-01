Imports System.IO

Partial Class admin_services_default
    Inherits System.Web.UI.Page

    Private Shared servicesFolder As String = System.Configuration.ConfigurationManager.AppSettings("servicesFolder")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lvServices.DataSource = Madam.Services.GetServicesList
            DataBind()
        End If
    End Sub

    Private Sub lvServices_ItemCanceling(sender As Object, e As ListViewCancelEventArgs) Handles lvServices.ItemCanceling
        lvServices.InsertItemPosition = InsertItemPosition.None
        lvServices.EditIndex = -1
        lvServices.DataSource = Madam.Services.GetServicesList
        DataBind()
    End Sub

    Private Sub lvServices_ItemEditing(sender As Object, e As ListViewEditEventArgs) Handles lvServices.ItemEditing
        'lvServices.EditIndex = 0
        'lvServices.DataSource = WhitePaper.GetWhitePaper(lvServices.DataKeys(e.NewEditIndex).Value)

        lvServices.EditIndex = e.NewEditIndex
        lvServices.DataSource = Madam.Services.GetServicesList

        lvServices.DataBind()
    End Sub

    Protected Sub NewService(sender As Object, e As EventArgs)
        lvServices.InsertItemPosition = InsertItemPosition.FirstItem
        lvServices.DataSource = Madam.Services.GetServicesList
        DataBind()

    End Sub

    Protected Sub SubmitService(sender As Object, e As CommandEventArgs)
        Dim lvItem As ListViewItem = CType(sender, Button).Parent
        Dim txtID As Label = lvItem.FindControl("txtServicesID")
        Dim txtHeadline As TextBox = lvItem.FindControl("txtServicesHeadline")
        Dim txtImage As Image = lvItem.FindControl("txtServicesImage")
        Dim txtPrice As TextBox = lvItem.FindControl("txtServicesPrice")
        Dim txtBody As TextBox = lvItem.FindControl("txtServicesBody")
        Dim txtDate As TextBox = lvItem.FindControl("txtServicesDateUpload")
        Dim imageUpload As FileUpload = lvItem.FindControl("uploadServicesImage")


        Dim updateService As New Madam.Services
        updateService.Headline = txtHeadline.Text
        updateService.Body = txtBody.Text
        updateService.DateUploaded = CType(txtDate.Text, DateTime)
        updateService.Image = ""
        updateService.Price = txtPrice.Text

        'Check if we are inserting or editting
        If txtID Is Nothing Then
            updateService.ID = updateService.Insert()
        Else
            updateService.ID = txtID.Text
        End If

        'Check whether to update the image
        If Not txtImage Is Nothing Then
            updateService.Image = txtImage.ImageUrl
        End If
        If imageUpload.HasFile Then
            updateService.Image = UploadImage(updateService.ID, imageUpload)
        End If

        'Check whether to update the PDF
        'If Not txtPrice Is Nothing Then
        '    updateService.Price = txtPrice.Text
        'End If
        'If pdfUpload.HasFile Then
        '    updateWhitePaper.PDF = UploadImage(updateWhitePaper.ID, pdfUpload)
        'End If

        updateService.Update()

        lvServices.InsertItemPosition = InsertItemPosition.None
        lvServices.EditIndex = -1
        lvServices.DataSource = Madam.Services.GetServicesList
        DataBind()
    End Sub

    Protected Sub DeleteService(sender As Object, e As CommandEventArgs)

        Dim id As Integer = e.CommandArgument
        Dim ServiceToDelete As New Madam.Services(id)
        ServiceToDelete.Delete()
        If Directory.Exists(Server.MapPath(servicesFolder & id)) Then
            Directory.Delete(Server.MapPath(servicesFolder & id), True)
        End If
        lvServices.DataSource = Madam.Services.GetServicesList
        DataBind()

    End Sub

    Protected Function UploadImage(ID As Integer, UploadControl As FileUpload) As String
        Dim imageUrl As String = servicesFolder & ID & "/" & UploadControl.FileName
        If Not Directory.Exists(Server.MapPath(servicesFolder & ID)) Then
            Directory.CreateDirectory(Server.MapPath(servicesFolder & ID))
        End If
        UploadControl.SaveAs(Server.MapPath(imageUrl))
        Return imageUrl
    End Function

End Class
