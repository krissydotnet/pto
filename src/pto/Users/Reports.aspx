<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="pto.Users.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">
            <section id="ptoRequests">
                <div class="form-horizontal">
                    <h2>Employee Detail Report (as of <%: DateTime.Now.ToShortDateString() %> )</h2>
                    <asp:Label ID="Label1" runat="server" Text="Employee Name"></asp:Label>
                    <asp:GridView CssClass="table table-hover table-striped" AutoGenerateColumns="false"  ID="gvReport" runat="server">
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
                                         <asp:Label ID="lblCredit" runat="server" Text='<%# Eval("credit").ToString() == "True" ? "+" : "-" %>'></asp:Label>
                                         <asp:Label ID="lblHours" runat="server" Text='<%# Bind("hours") %>'></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>   
                               
                             </Columns>
                    </asp:GridView>
                </div>
            </section>
        </div>
    </div>

</asp:Content>
