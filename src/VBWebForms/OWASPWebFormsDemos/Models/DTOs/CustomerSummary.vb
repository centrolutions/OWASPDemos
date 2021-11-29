Public Class CustomerSummary
    Public Property CustomerId As Integer
    Public Property FirstName As String
    Public Property LastName As String
    Public Property State As String

    Public Shared Narrowing Operator CType(ByVal customer As Customer) As CustomerSummary
        Dim result As New CustomerSummary With {
            .CustomerId = customer.CustomerId,
            .FirstName = customer.FirstName,
            .LastName = customer.LastName,
            .State = customer.State
        }

        Return result
    End Operator
End Class
