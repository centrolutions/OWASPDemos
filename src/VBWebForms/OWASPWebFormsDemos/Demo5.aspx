<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Demo5.aspx.vb" Inherits="OWASPWebFormsDemos.Demo5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            Use the login form below to login as <a href="javascript:loginnormal();"><span class="badge badge-danger">normaluser / normaluser</span></a> or as <a href="javascript:loginadmin();"><span class="badge badge-danger">adminuser / adminuser</span></a>.
            <ul>
                <li>Notice the button and destination changes for each type of user.</li>
            </ul>
        </p>
        <table class="table table-border">
            <tr>
                <td>
                    <asp:LoginView runat="server" ID="TheLoginView">
                        <LoggedInTemplate>
                            You are logged in as
                            <asp:LoginName runat="server" ID="TheLoginName" />
                            <asp:LinkButton runat="server" ID="LogoutLinkButton" OnClick="LogoutLinkButton_Click">Log Out</asp:LinkButton>
                        </LoggedInTemplate>
                        <AnonymousTemplate>
                            <asp:Login runat="server" ID="TheLogin" DestinationPageUrl="~/Demo5.aspx"></asp:Login>
                        </AnonymousTemplate>
                    </asp:LoginView>

                    <asp:LoginView runat="server" ID="AnotherLoginView">
                        <RoleGroups>
                            <asp:RoleGroup Roles="administrators">
                                <ContentTemplate>
                                    <asp:Button runat="server" ID="AdminOnlyButton" Text="Admin Users Enter Here" OnClick="AdminOnlyButton_Click" />
                                </ContentTemplate>
                            </asp:RoleGroup>
                            <asp:RoleGroup Roles="users">
                                <ContentTemplate>
                                    <asp:Button runat="server" ID="UsersButton" Text="Normal Users Enter Here" OnClick="UsersButton_Click" />
                                </ContentTemplate>
                            </asp:RoleGroup>
                        </RoleGroups>
                    </asp:LoginView>
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
                        <li>Neither of the destination pages is protected by an authentication check.</li>
                        <li>We're relying on a user only navigating with the buttons; not guessing / knowing the url of the protected page(s).</li>
                        <li>No role checking in the onclick event handlers or in the destination pages.</li>
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
                        <li>Pages in a protected area with not explicit authentication or access checks.</li>
                        <li>Logic that assumes the user will never guess a url. ("Just hide the button from them")</li>
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
                        <li>Users should be broken up into roles</li>
                        <li>Use ASP.NET Membership and Roles providers</li>
                        <li>Use the PrincipalPermission attribute on classes and methods that should be protected.</li>
                        <li>Use the LoginView when appropriate</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        function loginnormal() {
            document.getElementById("MainContent_TheLoginView_TheLogin_UserName").value = "normaluser";
            document.getElementById("MainContent_TheLoginView_TheLogin_Password").value = "normaluser";
        }
        function loginadmin() {
            document.getElementById("MainContent_TheLoginView_TheLogin_UserName").value = "adminuser";
            document.getElementById("MainContent_TheLoginView_TheLogin_Password").value = "adminuser";
        }
    </script>
</asp:Content>
