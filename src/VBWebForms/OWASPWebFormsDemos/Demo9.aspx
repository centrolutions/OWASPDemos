<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Demo9.aspx.vb" Inherits="OWASPWebFormsDemos.Demo9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            <ul>
                <li>Specific examples are hard to demonstrate since component companies usually fix their issues.</li>
                <li><a href="https://bishopfox.com/blog/cve-2019-18935-remote-code-execution-in-telerik-ui">Good example of CVE-2019-18935 - Telerik Upload / Deserialization Expoloit</a></li>
                <li><a href="https://nvd.nist.gov/vuln/detail/CVE-2021-44228">CVE-2021-44228 -- Log4J Arbitrary Code Execution Exploit</a></li>
            </ul>
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
                        <li>Components open a hole that exposes a vulnerability we went over in previous demos.</li>
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
                        <li>Libraries with old version numbers (check NuGet package manager to find newest version number)</li>
                        <li>Servers without Windows Update running or pending updates that are not installed</li>
                        <li>Using external libraries when they're not needed -- external libraries add technical debt.</li>
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
                        <li>Use external libraries in a limited fashion; on the periphery of the app.</li>
                        <li>Updated your dependencies! 1 - review change logs, 2 - install and review automated tests and manual functionality, 3 - deploy CAREFULLY</li>
                        <li>Turn on updates for operating systems and other server components (IIS, SQL, etc).</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
