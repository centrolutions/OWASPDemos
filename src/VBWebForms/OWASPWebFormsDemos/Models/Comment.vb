Public Class Comment
    Implements IFillable
    Public Property CommentId As Integer
    Public Property User As String
    Public Property Text As String

    Public Sub Fill(dr As IDataReader) Implements IFillable.Fill
        CommentId = dr.GetInt32(0)
        User = dr.GetString(1)
        Text = dr.GetString(2)
    End Sub
End Class
