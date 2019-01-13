<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto.Users.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Manage PTO</h1>
        <ul class="nav navbar-nav">
            <li><a runat="server" href="NewPTORequest.aspx">Enter PTO Request</a></li>
            <li><a runat="server" href="Reports.aspx">Report</a></li>
        </ul>
    </div>
</asp:Content>
