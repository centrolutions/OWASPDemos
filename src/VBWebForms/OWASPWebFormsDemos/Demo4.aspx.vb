Imports System.IO
Imports System.Xml

Public Class Demo4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs)

        Dim xmlContent As String = ReadXmlFromUploadedFile(XmlFileUpload.FileContent)
        Dim xml As XmlDocument = CreateXmlDocument(xmlContent)

        If xml IsNot Nothing Then
            StatusLabel.Text = xml("root").InnerText
        End If

    End Sub



    Function ReadXmlFromUploadedFile(fileContent As Stream) As String
        Dim result As String
        Using ms As New MemoryStream()
            fileContent.CopyTo(ms)
            result = Encoding.UTF8.GetString(ms.ToArray())
        End Using

        Dim preamble As String = Encoding.UTF8.GetString(Encoding.UTF8.GetPreamble())
        If result.StartsWith(preamble) Then
            result = result.Remove(0, preamble.Length)
        End If

        Return result
    End Function

    Function CreateXmlDocument(xmlContent As String) As XmlDocument
        Dim xml As New XmlDocument()
        xml.XmlResolver = New XmlUrlResolver() 'this is done by default prior to .NET 4.5.2
        xml.LoadXml(xmlContent)

        Return xml
    End Function

#Region "The Fix"
    'Function CreateXmlDocument(xmlContent As String) As XmlDocument
    '    Dim entities = GetEntities(xmlContent)
    '    If entities.Any(Function(x) x.Contains("SYSTEM") OrElse x.Contains("http")) Then
    '        StatusLabel.Text = "Cannot parse the XML. Invalid entities found."
    '        Return Nothing
    '    End If

    '    Dim xml As New XmlDocument()
    '    xml.XmlResolver = Nothing 'only have to do this in .NET versions before 4.5.2
    '    xml.LoadXml(xmlContent)

    '    Return xml
    'End Function

    'Iterator Function GetEntities(xmlContent As String) As IEnumerable(Of String)
    '    Dim startIndex = xmlContent.IndexOf("<!ENTITY")

    '    While startIndex > 0
    '        Dim endIndex = xmlContent.IndexOf(">", startIndex)
    '        Yield xmlContent.Substring(startIndex, endIndex - startIndex + 1)

    '        startIndex = xmlContent.IndexOf("<!ENTITY", endIndex)
    '    End While
    'End Function
#End Region
End Class