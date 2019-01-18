<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPTORequest.aspx.cs" Inherits="pto.Admin.AddPTORequest" %>

<%@ Register Src="~/Controls/PTORequestForm.ascx" TagPrefix="uc1" TagName="PTORequestForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="~/Controls/PTORequestForm.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">
            <uc1:PTORequestForm runat="server" ID="PTORequestForm" />
        </div>
    </div>
</asp:Content>
