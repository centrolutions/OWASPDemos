Imports System.Data.SQLite

Public Class Demo5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim user = Page.User.Identity.Name
    End Sub

    Protected Sub LogoutLinkButton_Click(sender As Object, e As EventArgs)
        FormsAuthentication.SignOut()
        Response.Redirect("~/Demo5.aspx")
    End Sub

    Protected Sub AdminOnlyButton_Click(sender As Object, e As EventArgs)
        Response.Redirect("~/SubPages/AdminUsersOnly.aspx")
    End Sub

    Protected Sub UsersButton_Click(sender As Object, e As EventArgs)
        Response.Redirect("~/SubPages/NormalUsers.aspx")
    End Sub
End Class