<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Demo7.aspx.vb" MasterPageFile="~/Site.Master" Inherits="OWASPWebFormsDemos.Demo7" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w-w-100 row">
        <p>
            <ul>
                <li>Use the form below to sign in as <a href="javascript:loginnormal();"><span class="badge badge-danger">normaluser / normaluser</span></a> and then submit a comment.</li>
                <li>Make a bad comment: &lt;script src="http://localhost:5050/badxss.js"&gt;&lt;/script&gt;I like your cat!</li>
            </ul>
        </p>
        <div class="card row">
            <span class="body-content text-left">
                <img src="Images/placeholder-profile-male.png" width="40" />
                TomCatLover88
            </span>
            <a href="#" class="btn btn-primary" data-remote="true">
                <i id="Follow" class="icon-ok icon-white"></i>
                Follow
            </a>
            <hr />
            <img src="Images/fruit-hats8.jpg" height="400" /><br />
            <span class="body-glyphicon-th-large">He loves it when I let him where hats! Like, comment, and follow!</span>
        </div>
        <hr />
        <asp:DataGrid runat="server" ID="CommentDataGrid" AutoGenerateColumns="true" CssClass="table table-table-striped">
        </asp:DataGrid>
        <asp:LoginView runat="server" ID="TheLoginView">
            <LoggedInTemplate>
                You are logged in as
                            <asp:LoginName runat="server" ID="TheLoginName" />
                <asp:LinkButton runat="server" ID="LogoutLinkButton" OnClick="LogoutLinkButton_Click">Log Out</asp:LinkButton>
            </LoggedInTemplate>
            <AnonymousTemplate>
                <span>To comment, please log in.</span>
                <asp:Login runat="server" ID="TheLogin" DestinationPageUrl="~/Demo7.aspx"></asp:Login>
            </AnonymousTemplate>
        </asp:LoginView>

        <asp:LoginView runat="server" ID="AnotherLoginView">
            <LoggedInTemplate>
                <div class="row">
                    <asp:Label runat="server" ID="NewCommentLabel" Text="New Comment" /><br />
                    <asp:TextBox runat="server" ID="NewCommentTextBox" TextMode="MultiLine" CssClass="form-control" />
                    <br />
                    <asp:Button runat="server" ID="NewCommentButton" Text="Comment" CssClass="btn btn-btn-default" OnClick="NewCommentButton_Click" />
                </div>
            </LoggedInTemplate>
        </asp:LoginView>
    </div>









    <hr />

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
                        <li>Users are allowed to enter information and it is never validated (going in or coming out).</li>
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
                        <li>If an ASP.NET WebForms form has "ValidateRequest='false'"</li>
                        <li>Web.config has &lt;pages validateRequest="false" /&gt; in it!</li>
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
                        <li>Don't disable page validation. Instead, use markup to allow user annotations in long text fields.</li>
                        <li>Don't disable site-wide validation in the web.config</li>
                        <li>Validate and sanitize data from users.</li>
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
    </script>
</asp:Content>
