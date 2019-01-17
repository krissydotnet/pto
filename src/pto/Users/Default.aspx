<%@ Page Title="MyInfo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto.Users.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Manage PTO</h1>
        <h2>Welcome <%# Session["username"] %></h2>
        <ul class="nav navbar-nav">
            <li><a runat="server" href="RequestTimeOff.aspx">Request Time Off</a></li>
            <li><a runat="server" href="Reports.aspx">Report</a></li>
        </ul>
        <asp:Calendar ID="Calendar1"  runat="server"></asp:Calendar>
    </div>
</asp:Content>
