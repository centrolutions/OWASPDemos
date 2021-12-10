<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Demo6.aspx.vb" Inherits="OWASPWebFormsDemos.Demo6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
        <p>
            Use the button to cause an error and notice the error message.
        </p>
        <table class="table table-border">
            <tr>
                <td>
                    <asp:Button runat="server" ID="TheButton" Text="Cause an error" OnClick="TheButton_Click" />
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
                        <li>The app was compiled in Debug mode, so code is exposed to the end user.</li>
                        <li>The version number of the framework and other items are shown that may help an attacker.</li>
                        <li>Additionally, notice the x-aspnet-version and x-powered-by headers that give attackers hints.</li>
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
                        <li>Debug build is running in production.</li>
                        <li>Error handling is missing either in the class itself or elsewhere in the pipeline.</li>
                        <li>Default accounts or settings still enabled</li>
                        <li>Features enabled in the server, database, or app that are not used or are no longer used</li>
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
                        <li>Never deploy a Debug build</li>
                        <li>Don't deploy *.pdb files!</li>
                        <li>Use custom error pages (in the web.config) so yellow screen of death is never shown.</li>
                        <li>Clean up the headers Global.asmx or in the Web.config</li>
                        <li>Deploy from an automated build system so all servers in the cluster are configured with the same code and config files</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
