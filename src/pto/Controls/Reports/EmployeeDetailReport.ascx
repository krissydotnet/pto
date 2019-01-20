<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetailReport.ascx.cs" Inherits="pto.Controls.Reports.EmployeeDetailReport" %>
<asp:Panel ID="pnl_EmployeeDetail" Visible="false" runat="server">

    <div class="report-employee">
        Employee:
        <asp:Label ID="lblUserName" runat="server" Text="Employee Name"></asp:Label>
    </div>
    <asp:GridView CssClass="table table-hover table-striped" AutoGenerateColumns="false" ID="gvReport" OnRowDataBound="gvDetail_RowDataBound" runat="server">
        <Columns>
            <asp:TemplateField HeaderText="Date">
                <ItemTemplate>
                    <asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("start_date", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    <asp:Label ID="lblEndDate" runat="server" Text='<%# Eval("end_date", "- {0:MM/dd/yyyy}") %>'></asp:Label>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event/Description">
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hours">
                <ItemTemplate>
                    <asp:Label ID="lblCredit" runat="server" Text='<%# Eval("credit").ToString() == "True" ? "+" : "-" %>'></asp:Label>
                    <asp:Label ID="lblHours" runat="server" Text='<%# Bind("hours") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Balance">
                <ItemTemplate>

                    <asp:Label ID="lblBalance" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

</asp:Panel>
