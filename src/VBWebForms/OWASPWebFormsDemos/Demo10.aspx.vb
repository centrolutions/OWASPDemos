Imports System.IO

Public Class Demo10
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

#Region "The Fix"
    Protected Sub TheLogin_LoginError(sender As Object, e As EventArgs)
        Dim loginCtrl = CType(sender, Login)
        Logger.LogWarning("Invalid login attempt for user '" & loginCtrl.UserName & "' from address " & Request.UserHostAddress)
        Dim user = Membership.GetUser(loginCtrl.UserName)
        If (user IsNot Nothing AndAlso user.IsLockedOut) Then
            loginCtrl.FailureText = "Your account has been locked."
            Logger.LogError("Account '" & user.UserName & "' was locked because the number of password tries was exceeded.")
        End If
    End Sub
#End Region
End Class