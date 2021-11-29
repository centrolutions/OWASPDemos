<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Demo1.aspx.vb" Inherits="OWASPWebFormsDemos.Demo1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            Use the textboxes in the login form below to inject SQL. Here are a few to help you get started (click the gray value to insert the statement into the Username field).
            <ul>
                <li>Use <a href="javascript:login();"><span class="badge badge-danger">user1' --</span></a> - in this case the attacker can log in to the User1 account without the password.</li>
                <li>Also try <a href="javascript:deleteAll();"><span class="badge badge-danger">'; delete from Users --</span></a> - in this case the attacker can delete the contents of the Users table.</li>
                <li>Also try <a href="javascript:drop();"><span class="badge badge-danger">'; drop table Users --</span></a> - in this case the attacker can drop the Users table.</li>
            </ul>

            <table class="table table-bordered">
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="UserNameTextBox" MaxLength="50" placeholder="Username" />
                        <asp:TextBox runat="server" ID="PasswordTextBox" MaxLength="50" placeholder="Password" />
                        <asp:Button runat="server" ID="LoginButton" Text="Login" />
                        <br />
                        <asp:Label runat="server" ID="ResultLabel" />
                    </td>
                </tr>
            </table>

            Did you break it? <br />
            You can <a runat="server" id="RecreateDbLink" onserverclick="RecreateDbLink_Click"><span class="badge badge-danger">Recreate the database</span></a> to restore the Users table.
        </p>
    </div>
    <div id="accordion">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                    <button class="btn" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" onclick="javascript: return false;">
                        The Problem(s)
                    </button>
                </h5>
            </div>
            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body">
                    <ul>
                        <li>Really bad authentication system -- simplistic for demo purposes.</li>
                        <li>String concatenation with unchecked user-values</li>
                        <li>Database user has full rights to the database so attacker can delete, drop, create users, etc.</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                    <button class="btn" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" onclick="javascript: return false;">
                        The Warning Signs / Code "smells" to Watch For
                    </button>
                </h5>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                <div class="card-body">
                    <ul>
                        <li>String concatenation or interpolation while creating SQL statements</li>
                        <li>Queries run as an admin user (sa)</li>
                        <li>No guard expressions on functions that user inputs are passed into.</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                    <button class="btn" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree" onclick="javascript: return false;">
                        The Fix
                    </button>
                </h5>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                <div class="card-body">
                    <ul>
                        <li>Easiest: use sql parameters to turn user input into string literals</li>
                        <li>A Little Harder: sanitize user input (guard expressions, regular expressions, find and replace, etc)</li>
                        <li>Ideally, use both</li>
                        <li>Install nuget package Microsoft.CodeAnalysis.NetAnalyzers</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        function login() {
            fillUsername('user1\' --');
            return false;
        }
        function drop() {
            fillUsername('\'; drop table Users --');
            return false;
        }
        function deleteAll() {
            fillUsername('\'; delete from Users --');
            return false;
        }
        function fillUsername(value) {
            document.getElementById("MainContent_UserNameTextBox").value = value;
        }
    </script>
</asp:Content>
