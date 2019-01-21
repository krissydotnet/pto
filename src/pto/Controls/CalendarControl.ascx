<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarControl.ascx.cs" Inherits="pto.Controls.CalendarControl" %>
<div class="myCalendar-wrapper">
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" CssClass="myCalendar-display" AutoPostBack="false" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="Calendar1_SelectionChanged">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
    <br />
    <h4>Scheduled PTO</h4>
    <asp:GridView CssClass="table table-hover table-striped" AutoGenerateColumns="false" ID="gvFuturePTO" EmptyDataText="No Scheduled PTO found!" OnRowDataBound="gvFuturePTO_RowDataBound" runat="server">
        <Columns>
            <asp:TemplateField HeaderText="Dates">
                <ItemTemplate>
                    <asp:Label ID="lblDates" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField datafield="hours" HeaderText="Hours" />
        </Columns>
    </asp:GridView>

</div>
<asp:HiddenField ID="ValueSelected" runat="server" />


