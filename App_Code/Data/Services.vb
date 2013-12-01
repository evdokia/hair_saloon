Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Namespace Madam
    Public Class Services

        'Declarations
        Private m_ServiceID As Integer
        Private m_ServiceImage As String
        Private m_ServiceHeadline As String
        Private m_ServiceBody As String
        Private m_ServicePrice As String
        Private m_ServiceDateUploaded As DateTime


        Private Shared con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("MyDB").ToString())

        'Attributes
        Public Property ID As Integer
            Get
                Return m_ServiceID
            End Get
            Set(value As Integer)
                m_ServiceID = value
            End Set
        End Property

        Public Property Image As String
            Get
                Return m_ServiceImage
            End Get
            Set(value As String)
                m_ServiceImage = value
            End Set
        End Property

        Public Property Headline As String
            Get
                Return m_ServiceHeadline
            End Get
            Set(value As String)
                m_ServiceHeadline = value
            End Set
        End Property

        Public Property Body As String
            Get
                Return m_ServiceBody
            End Get
            Set(value As String)
                m_ServiceBody = value
            End Set
        End Property

        Public Property DateUploaded As DateTime
            Get
                Return m_ServiceDateUploaded
            End Get
            Set(value As DateTime)
                m_ServiceDateUploaded = value
            End Set
        End Property

        Public Property Price As String
            Get
                Return m_ServicePrice
            End Get
            Set(value As String)
                m_ServicePrice = value
            End Set
        End Property

        'Constructors
        Public Sub New()

        End Sub

        Public Sub New(ID As Integer)
            Dim newServices As Services = GetServices(ID).Item(0)
            m_ServiceID = newServices.ID
            m_ServiceImage = newServices.Image
            m_ServiceHeadline = newServices.Headline
            m_ServiceBody = newServices.Body
            m_ServiceDateUploaded = newServices.DateUploaded
            m_ServicePrice = newServices.Price
        End Sub

        'Methods
        Public Shared Function GetServices(ID As Integer) As List(Of Services)

            Dim getSingleServicesCommand As New SqlCommand("SELECT * FROM Services WHERE ID = @ID", con)
            getSingleServicesCommand.Parameters.Add("@ID", SqlDbType.Int).Value = ID

            Dim dt As New DataTable
            Dim da As New SqlDataAdapter(getSingleServicesCommand)
            con.Open()
            da.Fill(dt)
            con.Close()

            Dim singleServices As List(Of Services) = ConvertServicesDS(dt)

            Return singleServices
        End Function

        Public Shared Function GetServicesList() As List(Of Services)

            Dim getSingleServicesCommand As New SqlCommand("SELECT * FROM Services ORDER BY DateUpload DESC", con)

            Dim dt As New DataTable
            Dim da As New SqlDataAdapter(getSingleServicesCommand)
            con.Open()
            da.Fill(dt)
            con.Close()

            Dim singleServices As List(Of Services) = ConvertServicesDS(dt)

            'Sorting example
            'singleServices = singleServices.OrderBy(Function(x) x.ServicesID).ToList()
            Return singleServices
        End Function

        Private Shared Function ConvertServicesDS(ServicessTable As DataTable) As List(Of Services)
            Dim ServicesList As New List(Of Services)

            For Each row As DataRow In ServicessTable.Rows
                Dim tempServices As New Services
                tempServices.ID = CType(row.Item("ID"), Integer)
                tempServices.Image = row.Item("Image").ToString()
                tempServices.Headline = row.Item("Headline").ToString()
                tempServices.Body = row.Item("Body").ToString()
                tempServices.DateUploaded = CType(row.Item("DateUpload"), DateTime)
                tempServices.Price = row.Item("Price").ToString()

                ServicesList.Add(tempServices)
            Next

            Return ServicesList
        End Function

        Public Function Insert() As Integer
            Dim insertServicesCommand As New SqlCommand("INSERT INTO Services (Image, Headline, Price, Body, DateUpload) OUTPUT Inserted.ID VALUES (@Image, @Headline, @Price, @Body, @DateUpload)", con)
            insertServicesCommand.Parameters.Add("@Image", SqlDbType.VarChar).Value = m_ServiceImage
            insertServicesCommand.Parameters.Add("@Headline", SqlDbType.NVarChar).Value = m_ServiceHeadline
            insertServicesCommand.Parameters.Add("@Price", SqlDbType.VarChar).Value = m_ServicePrice
            insertServicesCommand.Parameters.Add("@Body", SqlDbType.NVarChar).Value = m_ServiceBody
            insertServicesCommand.Parameters.Add("@DateUpload", SqlDbType.SmallDateTime).Value = m_ServiceDateUploaded

            con.Open()
            Dim result As Integer = insertServicesCommand.ExecuteScalar
            con.Close()

            Return result
        End Function

        Public Function Update() As Boolean
            Dim updateServicesCommand As New SqlCommand("UPDATE Services SET Image = @Image, Headline = @Headline, Price = @Price, Body = @Body, DateUpload = @DateUpload WHERE ID = @ID", con)
            updateServicesCommand.Parameters.Add("@ID", SqlDbType.Int).Value = m_ServiceID
            updateServicesCommand.Parameters.Add("@Image", SqlDbType.VarChar).Value = m_ServiceImage
            updateServicesCommand.Parameters.Add("@Headline", SqlDbType.NVarChar).Value = m_ServiceHeadline
            updateServicesCommand.Parameters.Add("@Price", SqlDbType.VarChar).Value = m_ServicePrice
            updateServicesCommand.Parameters.Add("@Body", SqlDbType.NVarChar).Value = m_ServiceBody
            updateServicesCommand.Parameters.Add("@DateUpload", SqlDbType.SmallDateTime).Value = m_ServiceDateUploaded

            con.Open()
            Dim result As Boolean = Convert.ToBoolean(updateServicesCommand.ExecuteNonQuery())
            con.Close()

            Return result
        End Function

        Public Function Delete() As Boolean
            Dim deleteServicesCommand As New SqlCommand("DELETE FROM Services WHERE ID = @ID", con)
            deleteServicesCommand.Parameters.Add("@ID", SqlDbType.Int).Value = m_ServiceID

            con.Open()
            Dim result As Boolean = Convert.ToBoolean(deleteServicesCommand.ExecuteNonQuery())
            con.Close()

            Return result
        End Function

    End Class

End Namespace
