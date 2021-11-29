Imports System.Net
Imports System.Web.Http

Public Class CustomersController
    Inherits ApiController

    Dim _Database As New SqliteDatabase(Global_asax.ConnectionString)

    ' GET api/<controller>
    Public Function GetValues() As IEnumerable(Of Customer)
        Dim results As List(Of Customer) = _Database.Execute(Of Customer)("SELECT * FROM Customers ORDER BY State")
        Return results
#Region "The Fix"
        'Dim summaryResults As New List(Of CustomerSummary)
        'For Each result In results
        '    summaryResults.Add(CType(result, CustomerSummary))
        'Next
        'Return summaryResults
#End Region
    End Function
End Class
