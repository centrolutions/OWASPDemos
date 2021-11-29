<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Demo4.aspx.vb" Inherits="OWASPWebFormsDemos.Demo4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            <ol>
                <li>Upload the good.xml file (found in the App_Data folder of this project) and notice how the entity gets replaced</li>
                <li>Upload the notgood.xml file and notice how the entity is replaced with the contents of the external file</li>
                <li>Upload the evil.xml file and notice on the evil server how the contents of the external file are sent to the external / evil server</li>
            </ol>
        </p>
        <table class="table table-border">
            <tr>
                <td>
                    <asp:FileUpload runat="server" ID="XmlFileUpload" />
                    <br />
                    <asp:Button runat="server" ID="SubmitButton" OnClick="SubmitButton_Click" Text="Upload" />
                    <br />
                    <asp:Label runat="server" ID="StatusLabel" />
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
                        <li>Potential Denial of Service attack by overloading a server</li>
                        <li>Private data can be pulled into the process</li>
                        <li>Can cause the server to access resources outside of its network and share private data</li>
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
                        <li>Parsing with an XmlDocument or XmlReader and not disabling the resolver</li>
                        <li>Taking a file's contents without a guard expression (sometimes not feasible depending on file size)</li>
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
                        <li>Upgrade the project to .NET 4.5.2 (at least!)</li>
                        <li>Disable XmlResolver in earlier versions of .NET</li>
                        <li>Guard expression to remove DTD and Entity elements from XML</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        function loadData() {
            var tableBody = document.getElementById("dataTable").getElementsByTagName("tbody")[0];
            var request = new XMLHttpRequest();
            request.open("GET", "/api/customers", true);
            request.send(null);
            request.onload = function () {
                var results = JSON.parse(this.response);
                for (let i = 0; i < results.length; i++) {
                    addRow(tableBody, results[i]);
                }
            }
        }

        function addRow(tbody, record) {
            let newRow = tbody.insertRow();
            let firstName = newRow.insertCell();
            let lastName = newRow.insertCell();
            let state = newRow.insertCell();

            firstName.appendChild(document.createTextNode(record.FirstName));
            lastName.appendChild(document.createTextNode(record.LastName));
            state.appendChild(document.createTextNode(record.State));
        }

        loadData();
    </script>
</asp:Content>
