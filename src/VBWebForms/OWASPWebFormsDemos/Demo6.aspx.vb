Public Class Demo6
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub TheButton_Click(sender As Object, e As EventArgs)
        'Login to the database server as user1
        DbLogin("user1", "password")
        Throw New Exception("An error happened here.")
    End Sub

    Private Sub DbLogin(username As String, password As String)

    End Sub
End Class