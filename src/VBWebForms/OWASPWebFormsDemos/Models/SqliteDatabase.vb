Imports System.Data.SQLite

Public Class SqliteDatabase
    Private m_Connection As SQLiteConnection

    Public Sub New(connectionString As String)
        m_Connection = New SQLiteConnection(connectionString)
    End Sub

    Public Sub DropUsersTable()
        m_Connection.Open()
        Using comm As SQLiteCommand = m_Connection.CreateCommand()
            comm.CommandText = "DROP TABLE IF EXISTS Users"
            comm.ExecuteNonQuery()
        End Using
        m_Connection.Close()
    End Sub

    Public Sub CreateUsersTable()
        m_Connection.Open()
        Using comm As SQLiteCommand = m_Connection.CreateCommand()
            comm.CommandText = "CREATE TABLE IF NOT EXISTS Users (UserId INTEGER PRIMARY KEY AUTOINCREMENT, Username VARCHAR(50), Password VARCHAR(50)); INSERT INTO Users (Username, Password) VALUES ('user1', 'password1'); INSERT INTO Users (Username, Password) VALUES ('user2', 'password2')"
            comm.ExecuteNonQuery()
        End Using
        m_Connection.Close()
    End Sub

    Public Sub DropCustomersTable()
        m_Connection.Open()
        Using comm As SQLiteCommand = m_Connection.CreateCommand()
            comm.CommandText = "DROP TABLE IF EXISTS Customers"
            comm.ExecuteNonQuery()
        End Using
        m_Connection.Close()
    End Sub

    Public Sub CreateCustomersTable()
        m_Connection.Open()
        Using comm As SQLiteCommand = m_Connection.CreateCommand()
            comm.CommandText = "CREATE TABLE IF NOT EXISTS Customers (CustomerId INTEGER PRIMARY KEY AUTOINCREMENT, FirstName VARCHAR(50), LastName VARCHAR(50), Address VARCHAR(50), City VARCHAR(50), State VARCHAR(2), Zip VARCHAR(12), CreditCard VARCHAR(16)); INSERT INTO Customers (FirstName, LastName, Address, City, State, Zip, CreditCard) VALUES ('John', 'Smith', '1234 Somestreet', 'Lincoln', 'NE', '68501', '4444555566667777'); INSERT INTO Customers (FirstName, LastName, Address, City, State, Zip, CreditCard) VALUES ('Jane', 'Doe', '9900 Thatstreet', 'Dallas', 'TX', '75236', '1111333355557777')"
            comm.ExecuteNonQuery()
        End Using
        m_Connection.Close()
    End Sub

    Public Function Execute(Of T As IFillable)(sql As String) As List(Of T)
        m_Connection.Open()
        Dim results As New List(Of T)
        Using comm As SQLiteCommand = m_Connection.CreateCommand()
            comm.CommandText = sql
            Using dr As SQLiteDataReader = comm.ExecuteReader()
                While dr.Read()
                    Dim record As T = Activator.CreateInstance(GetType(T))
                    record.Fill(dr)
                    results.Add(record)
                End While
            End Using
        End Using

        Return results
    End Function

    Public Sub CreateCommentsTable()
        m_Connection.Open()
        Using comm As SQLiteCommand = m_Connection.CreateCommand()
            comm.CommandText = "CREATE TABLE IF NOT EXISTS Comments (CommentId INTEGER PRIMARY KEY AUTOINCREMENT, User VARCHAR(50), Text TEXT)"
            comm.ExecuteNonQuery()
        End Using
        m_Connection.Close()
    End Sub

    Public Sub DropCommentsTable()
        m_Connection.Open()
        Using comm As SQLiteCommand = m_Connection.CreateCommand()
            comm.CommandText = "DROP TABLE IF EXISTS Comments"
            comm.ExecuteNonQuery()
        End Using
        m_Connection.Close()
    End Sub

    Public Function Execute(sql As String, tableName As String) As DataTable
        m_Connection.Open()
        Dim result As New DataTable(tableName)
        Using comm As SQLiteCommand = m_Connection.CreateCommand()
            comm.CommandText = sql
            Using dr As SQLiteDataReader = comm.ExecuteReader()
                result.Load(dr)
            End Using
        End Using

        Return result
    End Function

    Public Function Execute(sql As String, tableName As String, ParamArray parameters As SQLiteParameter()) As DataTable
        m_Connection.Open()
        Dim result As New DataTable(tableName)
        Using comm As SQLiteCommand = m_Connection.CreateCommand()
            comm.CommandText = sql
            comm.Parameters.AddRange(parameters)
            Using dr As SQLiteDataReader = comm.ExecuteReader()
                result.Load(dr)
            End Using
        End Using

        Return result
    End Function
End Class
