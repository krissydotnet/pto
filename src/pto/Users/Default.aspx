<%@ Page Title="MyInfo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto.Users.Default" %>

<%@ Register Src="~/Controls/PTORequestFormCtrl.ascx" TagPrefix="uc1" TagName="PTORequestForm" %>
<%@ Register Src="~/Controls/CalendarControl.ascx" TagPrefix="uc1" TagName="CalendarControl" %>
<%@ Register Src="~/Controls/User_Reports.ascx" TagPrefix="uc1" TagName="User_Reports" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
        <script>
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="page-wrapper">

        <h1 class="page-header">My Dashboard</h1>
        <div class="dashboard-container">
            <div class="left-container">
                <!-- Left Container -->

                <!-- Summary Body -->

                <div class="custom-card" id="summary-panel">
                    <div class="custom-card-title">
                        <h5 class="custom-title">Summary</h5>
                    </div>
                    <div class="custom-card-body">

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
                            <div class="summary-row summary-footer">

                                <a runat="server" href="~/Users/PTORequestForm.aspx" class="btn btn-primary">Request Time Off</a>

                            </div>
                        </div>

                    </div>
                </div>

                <!-- Summary Body -->





                <!-- End Left Container -->
            </div>
            <div class="middle-container">
                <!-- Middle Container -->

                <!-- Reports Panel -->
                <div class="custom-card" id="reports-panel">
                    <div class="custom-card-title">
                        <h3 class="custom-title">Reports</h3>
                    </div>
                    <div class="custom-card-body">
                        <nav>
                            <ul>
                                <li><asp:LinkButton ID="lnkReportPTOTaken" runat="server" OnClick="lnkReportPTOTaken_Click">PTO Taken Year To Date</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lnkScheduledPTO" runat="server" OnClick="lnkScheduledPTO_Click">Scheduled PTO</asp:LinkButton>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>




                <!-- End Middle Container -->
            </div>
            <div class="right-container">
                <!-- Right Container -->
                <!-- Calendar Panel -->
                <div class="custom-card" id="calendar-panel">
                    <div class="custom-card-title">
                        <h3 class="custom-title">Calendar</h3>
                    </div>
                    <div class="custom-card-body">
                        <uc1:CalendarControl runat="server" ID="CalendarControl" />
                    </div>
                </div>
                <!-- End Right Container -->
            </div>
        </div>






    </div>
    

    
            <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg"
                data-toggle="modal" data-backdrop="static" data-target="#myModal">
            </button>
    
                    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">


                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">
                                        <asp:Label ID="lblModalHeader" runat="server" Text=""></asp:Label>
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <asp:UpdatePanel ID="reportsModal" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                                        <ContentTemplate>
                                            <uc1:User_Reports runat="server" ID="User_Reports" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>


                        </div>
                    </div>



</asp:Content>
