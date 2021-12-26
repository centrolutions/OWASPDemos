Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq

Public Class Demo8
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub JSONButton_Click()
#Region "The Fix"
        'If (JSONTextBox.Text.Contains("$type")) Then
        '    Return
        'End If
        'Dim obj = JsonConvert.DeserializeObject(Of Customer)(JSONTextBox.Text)
#End Region
        Dim obj = JsonConvert.DeserializeObject(Of Object)(JSONTextBox.Text)
    End Sub
End Class