Imports System.Security.Permissions

'The Fix: <PrincipalPermission(SecurityAction.Demand, Role:="Users")>
Public Class NormalUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class