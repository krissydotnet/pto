<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="pto.Users.Reports" %>

<%@ Register Src="~/Controls/User_Reports.ascx" TagPrefix="uc1" TagName="User_Reports" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/reports.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">

            <uc1:User_Reports runat="server" id="User_Reports" />
        </div>
    </div>

</asp:Content>
