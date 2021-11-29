<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Demo2.aspx.vb" Inherits="OWASPWebFormsDemos.Demo2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            Use the login form below to login as <a href="javascript:login();"><span class="badge badge-danger">user1 / password1</span></a>.
            <ul>
                <li>Edit the cookies for this site - notice they're in plain text and contain sesitive information.</li>
                <li>Change the user id to 2, navigate away from this page and back to it.</li>
            </ul>
        </p>
        <table class="table table-border">
            <tr>
                <td>
                    <asp:Label runat="server" ID="LoginStatusLabel" />
                    <br />
                    <asp:Login runat="server" ID="Login" OnAuthenticate="Login_Authenticate" />
                </td>
            </tr>
        </table>
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
                        <li>Client token (cookie in this case) is unecrypted</li>
                        <li>Client token contains sensitive information (password!)</li>
                        <li>Client token never expires (different from cookie expiration)</li>
                        <li>Form is open to credential stuffing (try as many times as you want)</li>
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
                        <li>Manually setting credential info in the session, cookie, or local storage</li>
                        <li>Sending unencrypted info to the client</li>
                        <li>Implementing our own authentication system (almost never as secure as ASP.NET Forms Auth or Identity Server).</li>
                        <li>Using something simple like base64 encoding to "encrypt" information. Obfuscation is not encryption!</li>
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
                        <li>Use ASP.NET Authentication system and configure beyond the defaults</li>
                        <li>Use strong encryption on everything related to auth (don't forget the passwords in the database!)</li>
                        <li>Ideally, enable multi-factor authentication (soft token, email, text message, etc)</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        function login() {
            document.getElementById("MainContent_Login_UserName").value = "user1";
            document.getElementById("MainContent_Login_Password").value = "password1";
        }
    </script>
</asp:Content>
