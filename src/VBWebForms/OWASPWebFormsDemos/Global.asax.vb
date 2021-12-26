Imports System.Data.SQLite
Imports System.Web.Optimization
Imports System.Web.Http

Public Class Global_asax
    Inherits HttpApplication

    Public Shared Property ConnectionString As String

    Sub Application_Start(sender As Object, e As EventArgs)
        ' Fires when the application is started
        RouteConfig.RegisterRoutes(RouteTable.Routes)
        BundleConfig.RegisterBundles(BundleTable.Bundles)
        SetupDatabase()
        RegisterApiRoutes()
    End Sub

#Region "Demo 6 Fix"
    'Sub PreSendHeaders(sender As Object, e As EventArgs) Handles Me.PreSendRequestHeaders
    '    Dim headersToRemove() As String = {"Server", "X-AspNet-Version"}
    '    For Each header In headersToRemove
    '        HttpContext.Current.Response.Headers.Remove(header)
    '    Next
    'End Sub
#End Region

    Private Sub SetupDatabase()
        ConnectionString = "Data Source=" & Server.MapPath("~/App_Data/owasp.db")
        Dim db As New SqliteDatabase(ConnectionString)
        db.DropUsersTable()
        db.CreateUsersTable()
        db.DropCustomersTable()
        db.CreateCustomersTable()
        db.DropCommentsTable()
        db.CreateCommentsTable()

        AddMembershipRolesAndUsersIfNeeded()
    End Sub

    Private Sub AddMembershipRolesAndUsersIfNeeded()
        If (Not Roles.RoleExists("users")) Then
            Roles.CreateRole("users")
        End If
        If (Not Roles.RoleExists("administrators")) Then
            Roles.CreateRole("administrators")
        End If

        If (Membership.FindUsersByName("adminuser").Count = 0) Then
            Membership.CreateUser("adminuser", "adminuser")
            Roles.AddUserToRole("adminuser", "administrators")
        End If

        If (Membership.FindUsersByName("normaluser").Count = 0) Then
            Membership.CreateUser("normaluser", "normaluser")
            Roles.AddUserToRole("normaluser", "users")
        End If
    End Sub

    Private Sub RegisterApiRoutes()
        RouteTable.Routes.MapHttpRoute("DefaultApi", "api/{controller}/{id}", New With {.Id = System.Web.Http.RouteParameter.Optional})
    End Sub
End Class