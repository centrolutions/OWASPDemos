<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Demo10.aspx.vb" Inherits="OWASPWebFormsDemos.Demo10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            Try to log in as a user as many times as you want.
            <ul>
                <li>Notice there are no lockouts (on the user or on the ip / session)</li>
                <li>Notice there are no alerts to administrators that someone is trying to break in.</li>
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
                            <asp:Login runat="server" ID="TheLogin" DestinationPageUrl="~/Demo10.aspx" OnLoginError="TheLogin_LoginError"></asp:Login>
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
                        <li>No lockout on invalid login attempts</li>
                        <li>No logging of failed login attempts</li>
                        <li>No monitoring system to aggregate the invalid login attempts</li>
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
                        <li>No logger object in a class</li>
                        <li>If the function exits early, perhaps that's a good place to put a log point</li>
                        <li>Make sure not to go crazy with logging (too much noise means no one pays attention to it)</li>
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
                        <li>Enable account lockout</li>
                        <li>Log invalid attempts AND lockouts</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
