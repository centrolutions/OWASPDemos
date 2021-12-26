<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="OWASPWebFormsDemos._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET Web Forms OWASP Demos</h1>
        <p class="lead">A series of pages used to demonstrate the top 10 OWASP vulnerabilities and how to fix them in VB.NET / ASP.NET Web Forms</p>
        <p>Note: you will need Visual Studio 2017 or 2019 to run these demos.</p>
        <p><a href="https://www.youtube.com/watch?v=rWHvp7rUka8&list=PLyqga7AXMtPPuibxp1N0TdyDrKwP9H_jD" class="btn btn-primary btn-lg">Watch Videos &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>#1 Injection Attacks</h2>
            <p>
                A demonstration of a simple SQL-injection attack.
            </p>
            <p>
                <a class="btn btn-default" href="Demo1">Run Demo &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>#2 Broken Authentication</h2>
            <p>
                A demonstration of how a poor authentication system can allow access to a site.
            </p>
            <p>
                <a class="btn btn-default" href="Demo2">Run Demo &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>#3 Exposing Sensitive Data</h2>
            <p>
                A demonstration of how sensitive data can be exposed.
            </p>
            <p>
                <a class="btn btn-default" href="Demo3">Run Demo &raquo;</a>
            </p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>#4 XML External Entities</h2>
            <p>
                A demonstration of an XML parser vulnerability.
            </p>
            <p>
                <a class="btn btn-default" href="Demo4">Run Demo &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>#5 Broken Access Control</h2>
            <p>
                A demonstration of a broken access control system.
            </p>
            <p>
                <a  class="btn btn-default" href="Demo5">Run Demo &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>#6 Security Misconfiguration</h2>
            <p>
                A demonstration of security misconfiguration.
            </p>
            <p>
                <a  class="btn btn-default" href="Demo6">Run Demo &raquo;</a>
            </p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>#7 Cross Site Scripting</h2>
            <p>
                A demonstration of an XSS attack.
            </p>
            <p>
                <a class="btn btn-default" href="Demo7">Run Demo &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>#8 Insecure Deserialization</h2>
            <p>
                A demonstration of an insecure deserialization attack.
            </p>
            <p>
                <a  class="btn btn-default" href="Demo8">Run Demo &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>#9 Coming soon...</h2>
            <p>
                Standby...
            </p>
            <p>
                <a  class="btn btn-default" href="Demo9">Run Demo &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
