Imports System.Data.SQLite

Public Class Demo2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LoginStatusLabel.Text = "You are not logged in"

        If (Request.Cookies("auth") IsNot Nothing) Then
            Dim user = GetUserInfo(Request.Cookies("auth")("userid"))
            LoginStatusLabel.Text = "Welcome " & user(0)("username")
            Login.Visible = False
        End If
#Region "The Fix"
        'If (Request.IsAuthenticated) Then
        '    LoginStatusLabel.Text = "Welcome " & Request.LogonUserIdentity.Name
        '    Login.Visible = False
        'End If
#End Region

    End Sub

    Protected Sub Login_Authenticate(sender As Object, e As EventArgs)
        If (String.IsNullOrWhiteSpace(Login.UserName) OrElse String.IsNullOrWhiteSpace(Login.Password) OrElse Login.UserName.Contains(" ")) Then
            Login.FailureText = "Invalid username or password"
            Return
        End If

        Dim regex = New Regex("[^a-zA-Z0-9]")
        Dim username = regex.Replace(Login.UserName, "")
        Dim password = regex.Replace(Login.Password, "") 'should allow more characters for passwords in reality

        Dim db As New SqliteDatabase(Global_asax.ConnectionString)
        Dim sql = "SELECT * FROM Users WHERE Username=$username AND Password=$password"
        Dim result = db.Execute(sql, "Users", New SQLiteParameter("$username", username), New SQLiteParameter("$password", password))

        If (result.Rows.Count = 0) Then
            Login.FailureText = "Invalid username or password"
            Return
        End If

        Dim newCookie = New HttpCookie("auth")
        newCookie.Values.Add("userid", result(0)("UserId"))
        newCookie.Values.Add("username", result(0)("Username"))
        newCookie.Values.Add("password", result(0)("Password"))
        Response.Cookies.Add(newCookie)
#Region "The Fix"
        'FormsAuthentication.SetAuthCookie(result(0)("Username"), Login.RememberMeSet)
#End Region
        LoginStatusLabel.Text = "Welcome " & result(0)("Username")
        Login.Visible = False
    End Sub

    Private Function GetUserInfo(userId As String) As DataTable
        Dim db As New SqliteDatabase(Global_asax.ConnectionString)
        Dim sql = "SELECT * FROM Users WHERE UserId=$userid"
        Dim result = db.Execute(sql, "Users", New SQLiteParameter("$userid", userId))
        Return result
    End Function
End Class