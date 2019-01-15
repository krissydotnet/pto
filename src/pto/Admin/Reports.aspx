<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="pto.Admin.Reports" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/reports.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">

            <asp:Panel ID="pnl_ptoRequests" Visible="false"  runat="server">
            <section id="ptoRequests">
                <div class="form-horizontal">
                    <div class="report-header">
                        <asp:Label ID="lblReportHeader" runat="server" Text="Label"></asp:Label>
                    </div>
                    <asp:GridView CssClass="table table-hover table-striped" AutoGenerateColumns="false"  ID="gvReport" OnRowDataBound="gvReport_RowDataBound" runat="server">
                             <Columns>
                                 <asp:TemplateField HeaderText="Name">
                                     <ItemTemplate>
                                         <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Balance">
                                     <ItemTemplate>
                                         <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("balance_pto") %>'></asp:Label> hours
                                     </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Next Scheduled PTO Event">
                                     <ItemTemplate>
                                         <asp:Label ID="lblNextEvent" runat="server" Text=''></asp:Label>
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
