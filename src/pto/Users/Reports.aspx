<%@ Page Title="Reports" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="pto.Users.Reports" %>

<%@ Register Src="~/Controls/Reports/EmployeeDetailReport.ascx" TagPrefix="uc1" TagName="EmployeeDetailReport" %>
<%@ Register Src="~/Controls/Reports/EmployeeBalanceReport.ascx" TagPrefix="uc1" TagName="EmployeeBalanceReport" %>
<%@ Register Src="~/Controls/Reports/ScheduledPTO.ascx" TagPrefix="uc1" TagName="ScheduledPTO" %>





<asp:Content ID="Content1" ContentPlaceHolderID="MainUserContent" runat="server">
    <div class="row">
        <div class="col-md-8">
            <div class="container">

                <asp:Panel ID="pnl_EmployeeDetailReport" Visible="false" runat="server">

                    <div class="report-header">
                        Employee Detail Report: PTO Taken Year To Date (as of <asp:Label ID="lblDetailDate" runat="server" Text=""></asp:Label>)
                    </div>
                    <uc1:EmployeeDetailReport runat="server" ID="EmployeeDetailReport" />


                </asp:Panel>
                <asp:Panel ID="pnl_EmployeeBalanceReport" Visible="false" runat="server">
                    <asp:Label ID="lblEmployee"></asp:Label>
                    <uc1:EmployeeBalanceReport runat="server" ID="EmployeeBalanceReport" />
                </asp:Panel>
                <asp:Panel ID="pnl_ScheduledPTO" Visible="false" runat="server">
                    <div class="report-header">
                        Employee Detail Report: Scheduled PTO (as of <asp:Label ID="lblBalanceDate" runat="server" Text=""></asp:Label>)
                    </div>

                    <uc1:ScheduledPTO runat="server" ID="ScheduledPTO" />

                </asp:Panel>
            </div>
        </div>
    </div>



</asp:Content>
