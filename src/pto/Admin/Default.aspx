<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto.Admin.Default" %>

<%@ Register Src="~/Controls/NewPTORequests.ascx" TagPrefix="uc1" TagName="NewPTORequests" %>
<%@ Register Src="~/Controls/Summary.ascx" TagPrefix="uc1" TagName="Summary" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/panels.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/Controls/NewPTORequests.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Admin Dashboard</h1>
                <div class="dashboard-container">
                    <div class="left-container">
                        <!--  Left Container -->
                            <uc1:NewPTORequests runat="server" ID="NewPTORequests" />
                                        <ul class="nav navbar-nav">
                    <li><a runat="server" href="AddPTORequest.aspx">New PTO Request</a></li>
                    <li><a runat="server" href="Reports.aspx">Report</a></li>
                </ul>
                        <!-- Left Container -->
                    </div>
                    <div class="middle-container">
                        <div class="panel panel-primary" id="reports-panel">
                        <div class="panel-heading">
                            <h3>
                            Reports
                                </h3></div>
                        <div class="panel-body">
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



            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
       


        <!-- /.row -->

    </div>
    <!-- /.page-wrapper -->
</asp:Content>
