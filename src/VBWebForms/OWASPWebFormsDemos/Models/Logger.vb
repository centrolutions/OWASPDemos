Public Class Logger

    Public Shared Sub LogWarning(warning As String)
        Debug.WriteLine(warning, "Warning")
    End Sub

    Public Shared Sub LogError(err As String)
        Debug.WriteLine(err, "Error")
    End Sub
End Class
