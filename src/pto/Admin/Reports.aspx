<%@ Page Title="Reports" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="pto.Admin.Reports" %>

<%@ Register Src="~/Controls/Reports/EmployeeBalanceReport.ascx" TagPrefix="uc1" TagName="EmployeeBalanceReport" %>
<%@ Register Src="~/Controls/Reports/EmployeeDetailReport.ascx" TagPrefix="uc1" TagName="EmployeeDetailReport" %>
<%@ Register Src="~/Controls/EmployeeCtrl.ascx" TagPrefix="uc1" TagName="EmployeeCtrl" %>
<%@ Register Src="~/Controls/Reports/ScheduledPTO.ascx" TagPrefix="uc1" TagName="ScheduledPTO" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainAdminContent" runat="server">
    <div class="row">
        <div class="col-md-8">

            <asp:Panel ID="pnl_EmployeeDetailReport" Visible="false" runat="server">
                <div class="container">
                    <div class="form-vertical">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="EmployeeCtrl" CssClass="control-label">Employee: </asp:Label>
                            <uc1:EmployeeCtrl runat="server" ID="EmployeeCtrl" />
                        </div>

                        <asp:Repeater ID="rptEmployeeDetailReport" OnItemDataBound="rptEmployeeDetailReport_ItemDataBound" runat="server">
                            <HeaderTemplate>
                                <div class="report-header">
                                    Employee Detail Report: PTO Taken Year To Date (as of <%# DateTime.Now.ToShortDateString() %>
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <uc1:EmployeeDetailReport runat="server" ID="EmployeeDetailReport" />
                            </ItemTemplate>

                        </asp:Repeater>
                    </div>
            </asp:Panel>
            <asp:Panel ID="pnl_EmployeeBalanceReport" Visible="false" runat="server">
                <asp:Label ID="lblEmployee"></asp:Label>
                <uc1:EmployeeBalanceReport runat="server" ID="EmployeeBalanceReport" />
            </asp:Panel>
            <asp:Panel ID="pnlScheduledPTO" Visible="false" runat="server">
                <div class="container">
                    <div class="form-vertical">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="EmployeeCtrl" CssClass="control-label">Employee: </asp:Label>
                            <uc1:EmployeeCtrl runat="server" ID="EmployeeCtrl1" />
                        </div>

                        <asp:Repeater ID="rptScheduledPTO" OnItemDataBound="rptScheduledPTO_ItemDataBound" runat="server">
                            <HeaderTemplate>
                                <div class="report-header">
                                    Employee Detail Report: Scheduled PTO (as of <%# DateTime.Now.ToShortDateString() %>)
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <uc1:ScheduledPTO runat="server" ID="ScheduledPTO" />
                            </ItemTemplate>

                        </asp:Repeater>
                    </div>
            </asp:Panel>
        </div>
    </div>

</asp:Content>
