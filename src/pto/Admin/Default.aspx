<%@ Page Title="Admin" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto.Admin.Default" %>

<%@ Register Src="~/Controls/NewPTORequests.ascx" TagPrefix="uc1" TagName="NewPTORequests" %>
<%@ Register Src="~/Controls/Summary.ascx" TagPrefix="uc1" TagName="Summary" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainAdminContent" runat="server">



    <h1 class="page-header">Admin Dashboard</h1>
    <div class="dashboard-container">
        <div class="left-container">
            <!--  Left Container -->
            <uc1:NewPTORequests runat="server" ID="NewPTORequests" />


            <div class="custom-card" id="reports-panel">
                <div class="custom-card-title">
                    <h3 class="custom-title">Reports
                    </h3>
                </div>
                <div class="custom-card-body">
                    <ul>
                        <li><a runat="server" href="~/Admin/Reports.aspx?rid=1">Employee Balances</a></li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="right-container">
            <!-- Right Container -->
            <uc1:Summary runat="server" ID="Summary" />
            <!-- Right Container -->
        </div>
    </div>







</asp:Content>
