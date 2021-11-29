Imports System.Data.SQLite

Public Class Demo1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LoginButton_Click(sender As Object, e As EventArgs) Handles LoginButton.Click
        Dim db As New SqliteDatabase(Global_asax.ConnectionString)
        Dim sql = "SELECT * FROM Users WHERE Username='" & UserNameTextBox.Text & "' AND Password='" & PasswordTextBox.Text & "'"
        Dim result = db.Execute(sql, "Users")
#Region "The Solution"
        ''Guard statements
        'If (String.IsNullOrWhiteSpace(UserNameTextBox.Text) OrElse String.IsNullOrWhiteSpace(PasswordTextBox.Text) OrElse UserNameTextBox.Text.Contains(" ")) Then
        '    ResultLabel.Text = "Invalid input!"
        '    Return
        'End If

        ''sanitize user intput
        'Dim regex = New Regex("[^a-zA-Z0-9]")
        'Dim username = regex.Replace(UserNameTextBox.Text, "")
        'Dim password = regex.Replace(PasswordTextBox.Text, "") 'should allow more characters for passwords in reality

        ''sql parameters
        'Dim sql = "SELECT * FROM Users WHERE Username=$username AND Password=$password"
        'Dim result = db.Execute(sql, "Users", New SQLiteParameter("$username", username), New SQLiteParameter("$password", password))
#End Region

        If result.Rows.Count <> 0 Then
            ResultLabel.Text = "You are logged in"
        Else
            ResultLabel.Text = "Login failed."
        End If
    End Sub

    Protected Sub RecreateDbLink_Click(sender As Object, e As EventArgs)
        Dim db As New SqliteDatabase(Global_asax.ConnectionString)
        db.DropUsersTable()
        db.CreateUsersTable()
        db.DropCustomersTable()
        db.CreateCustomersTable()
        ResultLabel.Text = "Database recreated"
    End Sub
End Class