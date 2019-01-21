<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ScheduledPTO.ascx.cs" Inherits="pto.Controls.ScheduledPTO" %>
<asp:Panel ID="pnl_ptoRequests" Visible="false"  runat="server">
            <section id="ptoRequests">
                <div class="form-horizontal">
                    <div class="report-employee">
                    Employee: <asp:Label ID="lblUserName" runat="server"  Text="Employee Name"></asp:Label>
                    </div>
                    <asp:GridView CssClass="table table-hover table-striped" AutoGenerateColumns="false"  ID="gvReport" EmptyDataText="No Scheduled PTO found!" OnRowDataBound="gvReport_RowDataBound" runat="server">
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