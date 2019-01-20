<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeBalanceReport.ascx.cs" Inherits="pto.Controls.Reports.EmployeeBalanceReport" %>

<asp:Panel id="pnlEmployeeBalance" runat="server">
    <div class="report-header">
        <asp:Label ID="lblReportHeader" runat="server" Text="Label"></asp:Label>
    </div>
    <asp:GridView CssClass="table table-hover table-striped" AutoGenerateColumns="false" ID="gvReport" OnRowDataBound="gvReport_RowDataBound" runat="server">
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Balance">
                <ItemTemplate>
                    <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("balance_pto") %>'></asp:Label>
                    hours
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Next Scheduled PTO Event">
                <ItemTemplate>
                    <asp:Label ID="lblNextEvent" runat="server" Text=''></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>
</asp:Panel>