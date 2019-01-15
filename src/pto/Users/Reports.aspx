<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="pto.Users.Reports" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/reports.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">
            <asp:DropDownList ID="ddlReports" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlReports_SelectedIndexChanged">
                <asp:ListItem Value="1" Text="PTO Taken To Date"></asp:ListItem>
                <asp:ListItem Value="2" Text="PTO Requested"></asp:ListItem>
            </asp:DropDownList>
            <asp:Panel ID="pnl_ptoRequests" Visible="false"  runat="server">
            <section id="ptoRequests">
                <div class="form-horizontal">
                    <div class="report-header">
                        <asp:Label ID="lblReportHeader" runat="server" Text="Label"></asp:Label> (<asp:Label ID="lblRange" runat="server" Text=""></asp:Label>)
                    </div>
                    <div class="report-employee">
                    Employee: <asp:Label ID="lblUserName" runat="server"  Text="Employee Name"></asp:Label>
                    </div>
                    <asp:GridView CssClass="table table-hover table-striped" AutoGenerateColumns="false"  ID="gvReport" OnRowDataBound="gvReport_RowDataBound" runat="server">
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
                </div>
            </section>
         </asp:Panel>
        </div>
    </div>

</asp:Content>
