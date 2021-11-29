<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Demo3.aspx.vb" Inherits="OWASPWebFormsDemos.Demo3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            The table below is filled using data from an api call. Look at the data that is actually transferred from the api to see th exposed sensitive data.
        </p>
        <table class="table table-border">
            <tr>
                <td>
                    <table id="dataTable" class="table table-border">
                        <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>State</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
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
                        <li>Sensitive data stored in database unencrypted</li>
                        <li>Entire database record returned to client</li>
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
                        <li>Blindly returning entire database records instead of DTOs</li>
                        <li>Code that saves sensitive information (like credit cards, ssn, account numbers, etc) to the database without first encrypting it.</li>
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
                        <li>Use a DTO instead of a database record as the result of the service call.</li>
                        <li>Not shown - save sensitive data with a strong encryption scheme. Pay attention to industry standards like <a target="_blank" href="http://en.wikipedia.org/wiki/Payment_Card_Industry_Data_Security_Standard">PCI Data Security Standards</a></li>
                        <li>Categorize the types of data -- at least three categories: non-sensitive, sensitive (like PII), and classified (SSNs, Credit Cards, etc) -- treat them appropriately.</li>
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
