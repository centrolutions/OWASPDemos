Public Class Demo7
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        DisplayComments()
    End Sub

    Protected Sub LogoutLinkButton_Click(sender As Object, e As EventArgs)
        FormsAuthentication.SignOut()
        Response.Redirect("~/Demo7.aspx")
    End Sub

    Protected Sub NewCommentButton_Click()
        If (Request.IsAuthenticated) Then
            Dim txtBox As TextBox = AnotherLoginView.FindControl("NewCommentTextBox")
            SaveComment(Page.User.Identity.Name, txtBox.Text)
        End If

    End Sub


    Private Sub SaveComment(user As String, comment As String)
        Dim db As New SqliteDatabase(Global_asax.ConnectionString)
        db.Execute("INSERT INTO Comments (User, Text) VALUES ($user, $text)", "Comments", New SQLite.SQLiteParameter("$user", user), New SQLite.SQLiteParameter("$text", comment))
        DisplayComments()
    End Sub

    Private Sub DisplayComments()
        Dim db As New SqliteDatabase(Global_asax.ConnectionString)
        Dim comments = db.Execute(Of Comment)("SELECT * FROM Comments")
        CommentDataGrid.DataSource = comments
        CommentDataGrid.DataBind()
    End Sub
End Class