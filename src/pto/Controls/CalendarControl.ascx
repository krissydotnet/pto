<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarControl.ascx.cs" Inherits="pto.Controls.CalendarControl" %>
<div class="myCalendar-wrapper">
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" CssClass="myCalendar-display" AutoPostBack="false"  BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
    <asp:Repeater ID="FuturePTO" OnItemDataBound="FuturePTO_ItemDataBound" runat="server">
            <ItemTemplate>
                <div class="overview-container">
                    <div class="overview-user-container">
                        <asp:Label ID="lblDates" runat="server" Text=''></asp:Label>
                    </div>

                    <div class="overview-balance-container">
                        <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                    </div>
                    <div class="overview-balance-container">
                        <asp:Label ID="lblHours" runat="server" Text='<%# Bind("hours") %>'></asp:Label>
                        hours
                    </div>
                </div>
            </ItemTemplate>
    </asp:Repeater>
</div>
