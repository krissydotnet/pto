<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Summary.ascx.cs" Inherits="pto.Controls.Summary" %>
<div class="custom-card">
    <div class="custom-card-title">
        <h3 class="custom-title"><i class="fa fa-balance-scale fa-fw"></i>
        Overall Employee Balances</h3>
    </div>
    <!-- /.panel-heading -->
    <div class="custom-body">
        <!-- Repeater -->
        <asp:Repeater ID="overviewRepeater" OnItemDataBound="overviewRepeater_ItemDataBound" runat="server">
            <HeaderTemplate>


                <div class="overview-container overview-header">
                    <div class="overview-user-container">
                        <asp:Label runat="server" Text='NAME'></asp:Label>
                    </div>
                    <div class="overview-balance-container">
                        <asp:Label runat="server" Text='BALANCE'></asp:Label>
                    </div>
                    <div class="overview-schedule-container">
                        <asp:Label runat="server" Text='NEXT SCHEDULED PTO'></asp:Label>
                    </div>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="overview-container">
                    <div class="overview-user-container">
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </div>
                    <div class="overview-balance-container">
                        <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("balance_pto") %>'></asp:Label>
                        hours
                    </div>
                    <div class="overview-schedule-container">
                        <div class="overview-schedule-date">
                            <asp:Label ID="lblNextEventDate" runat="server" Text=''></asp:Label>
                        </div>
                        <div class="overview-schedule-details">
                            <asp:Label ID="lblNextEvent" runat="server" Text=''></asp:Label></div>
                    </div>

                </div>
            </ItemTemplate>

        </asp:Repeater>

        <!-- Repeater End -->

    </div>
    <!-- /.panel-body -->
</div>
<!-- /.panel -->
