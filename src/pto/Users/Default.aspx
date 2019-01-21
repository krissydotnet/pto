<%@ Page Title="MyInfo" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto.Users.Default" %>

<%@ Register Src="~/Controls/PTORequestFormCtrl.ascx" TagPrefix="uc1" TagName="PTORequestForm" %>
<%@ Register Src="~/Controls/CalendarControl.ascx" TagPrefix="uc1" TagName="CalendarControl" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainUserContent" runat="server">

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
                                <div class="summary-label">Total PTO:</div>
                                <div class="summary-value">
                                    <asp:Label ID="lblTotal" runat="server" Text="{Total}"></asp:Label>
                                </div>
                            </div>
                            <div class="summary-row">
                                <div class="summary-label">Used PTO:</div>
                                <div class="summary-value">
                                    <asp:Label ID="lblUsedPTO" runat="server" Text="{UsedPTO}"></asp:Label>
                                </div>
                            </div>
                            <div class="summary-row">
                                <div class="summary-label">Current PTO Balance:</div>
                                <div class="summary-value">
                                    <asp:Label ID="lblBalance" runat="server" Text="{Balance}"></asp:Label>

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
             <!--
            <div class="middle-container">
                Middle Container -->





                <!-- End Middle Container 
            </div> -->
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
    


</asp:Content>
