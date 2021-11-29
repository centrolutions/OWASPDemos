Public Class Customer
    Implements IFillable

    Public Property CustomerId As Integer
    Public Property FirstName As String
    Public Property LastName As String
    Public Property Address As String
    Public Property City As String
    Public Property State As String
    Public Property Zip As String
    Public Property CreditCard As String

    Public Sub Fill(dr As IDataReader) Implements IFillable.Fill
        CustomerId = dr.GetInt32(0)
        FirstName = dr.GetString(1)
        LastName = dr.GetString(2)
        Address = dr.GetString(3)
        City = dr.GetString(4)
        State = dr.GetString(5)
        Zip = dr.GetString(6)
        CreditCard = dr.GetString(7)
    End Sub
End Class
