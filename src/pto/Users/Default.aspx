<%@ Page Title="MyInfo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto.Users.Default" %>

<%@ Register Src="~/Controls/PTORequestFormCtrl.ascx" TagPrefix="uc1" TagName="PTORequestForm" %>
<%@ Register Src="~/Controls/CalendarControl.ascx" TagPrefix="uc1" TagName="CalendarControl" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>

    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">My Dashboard</h1>
                <div class="dashboard-container">
                <div class="left-container">
                    <!-- Left Container -->
                    <div class="panel panel-primary" id="summary-panel">
                        <div class="panel-heading">
                            <h3>Summary</h3>
                        </div>
                        <div class="panel-body">
                            <!-- Summary Body -->
                            <div class="summary-wrapper">
                                <div class="summary-row">
                                    <div class="summary-label">Current PTO Balance:</div>
                                    <div class="summary-value">
                                        <asp:Label ID="lblBalance" runat="server" Text="{Balance}"></asp:Label>
                                    </div>
                                 </div>
                                 <div class="summary-row">
                                    <div class="summary-label">Planned PTO:</div>
                                    <div class="summary-value">
                                        <asp:Label ID="lblFuturePTO" runat="server" Text="{FuturePTO}"></asp:Label>
                                    </div>
                                 </div>
                                 <div class="summary-row">
                                     <div class="summary-label">Future Accrual:</div>
                                     <div class="summary-value">
                                         <asp:Label ID="lblAccrual" runat="server" Text="{FutureAccrual}"></asp:Label>

                                     </div>
                                 </div>

                            </div>


                            <!-- Summary Body -->
                        </div>
                        <div class="panel-footer">
                            <a runat="server" href="~/Users/PTORequestForm.aspx" class="btn btn-primary">Request Time Off</a>
                        </div>
                    </div>



                    <!-- End Left Container -->
                </div>
                <div class="middle-container">
                    <!-- Middle Container -->
                    
                    <div class="panel panel-primary" id="reports-panel">
                        <div class="panel-heading">
                            <h3>
                            Reports
                                </h3></div>
                        <div class="panel-body">
                            <ul>
                                <li><a runat="server" href="~/Users/Reports.aspx?rid=1">PTO Taken</a></li>
                                <li><a runat="server" href="~/Users/Reports.aspx?rid=2">Planned PTO</a></li>
                            </ul>

                        </div>
                    </div>



                    <!-- End Middle Container -->
                    </div>
                <div class="right-container">
                    <!-- Right Container -->

                    <uc1:CalendarControl runat="server"  ID="CalendarControl" />

                    <!-- End Right Container -->
                </div>
            </div>

            </div>
            <!-- /.col-lg-12 -->

        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-5">
                <!-- Nav 
                <ul class="nav navbar-nav">
                    <li><a runat="server" href="~/Users/PTORequest.aspx" class="btn btn-primary">Request Time Off</a>
                    </li>

                    <li><a runat="server" href="~/Users/Reports.aspx" class="btn btn-primary">Report</a></li>
                </ul> -->
                <!-- Menu Item -->


            </div>
            <div class="col-lg-7">
                <!-- Report -->
            </div>
        </div>


        <!-- /.row -->

    </div>
    <!-- /.page-wrapper -->
    <!-- 
    <asp:Panel ID="pnlPTORequest" runat="server" >
    <div class="row">
        <div class="col-lg-12">

            <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered " role="document">
                    <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                        <ContentTemplate>

                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">New PTO Request</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <uc1:PTORequestForm runat="server" ID="PTORequestForm" />
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
        </asp:Panel>
        -->
</asp:Content>
