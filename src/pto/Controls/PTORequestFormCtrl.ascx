<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PTORequestFormCtrl.ascx.cs" Inherits="pto.Controls.PTORequestFormCtrl" %>
<asp:Panel ID="pnlPTORequestForm" runat="server">
    <section id="ptoRequests">
        <div class="form-horizontal">
           
            <div class="form-group row" id="rowEmployee" runat="server">
                <asp:Label runat="server" AssociatedControlID="ptoEmployee" CssClass="col-md-2 control-label">Employee *</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="ptoEmployee" runat="server"></asp:DropDownList>

                </div>
            </div>
            <div class="form-group row">
                <asp:Label runat="server" AssociatedControlID="ptoType" CssClass="col-md-2 control-label">Time of type *</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="ptoType" runat="server"></asp:DropDownList>

                </div>
            </div>
            <div class="form-group row">
                <asp:Label runat="server" AssociatedControlID="ptoFrom" CssClass="col-md-2 control-label">From *</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="ptoFrom" CssClass="ptoFrom" AutoCompleteType="Disabled" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="btnFrom" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Bottom" CausesValidation="false" />
                    <ajaxToolkit:CalendarExtender ID="ptoFrom_CalendarExtender" BehaviorID="fromDate" runat="server" PopupButtonID="btnFrom" TargetControlID="ptoFrom" OnClientDateSelectionChanged="onSelectedStartDate" />
                    <asp:RequiredFieldValidator Display="Dynamic" ID="ptoFrom_RequiredFieldValidator" runat="server" ControlToValidate="ptoFrom" CssClass="err" ErrorMessage="Required field"></asp:RequiredFieldValidator>
                    <asp:CompareValidator
                        ID="ptoFrom_dateValidator" runat="server"
                        Type="Date"
                        Operator="DataTypeCheck"
                        ControlToValidate="ptoFrom"
                        Display="Dynamic"
                        CssClass="err"
                        ErrorMessage="Please enter a valid date.">
                    </asp:CompareValidator>
                </div>
            </div>
            <div class="form-group row">
                <asp:Label runat="server" AssociatedControlID="ptoTo" CssClass="col-md-2 control-label">To *</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="ptoTo" CssClass="ptoTo" AutoCompleteType="Disabled" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="btnTo" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Bottom" CausesValidation="false" />
                    <ajaxToolkit:CalendarExtender ID="ptoTo_CalendarExtender" runat="server" BehaviorID="toDate" PopupButtonID="btnTo" TargetControlID="ptoTo" />
                    <asp:RequiredFieldValidator ID="ptoTo_RequiredFieldValidator" Display="Dynamic" runat="server" ControlToValidate="ptoTo" CssClass="err" ErrorMessage="Required field"></asp:RequiredFieldValidator>
                    <asp:CompareValidator
                        ID="ptoTo_dateValidator" runat="server"
                        Type="Date"
                        Operator="DataTypeCheck"
                        ControlToValidate="ptoTo"
                        Display="Dynamic"
                        CssClass="err"
                        ErrorMessage="Please enter a valid date.">
                    </asp:CompareValidator>
                    <asp:CompareValidator ID="ptoTo_ValidateGreater" runat="server"
                        ControlToCompare="ptoFrom" CultureInvariantValues="true"
                        CssClass="err"
                        Display="Dynamic" EnableClientScript="true"
                        ControlToValidate="ptoTo"
                        ErrorMessage="End date must be after start date"
                        Type="Date" SetFocusOnError="true" Operator="GreaterThanEqual"></asp:CompareValidator>
                </div>
            </div>
            <div class="form-group row" id="rowHours">
                <asp:Label runat="server" AssociatedControlID="ptoHours" CssClass="col-md-2 control-label">Hours</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="ptoHours" runat="server">
                        <asp:ListItem Text="Half Day" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Full Day" Value="8" Selected="True"></asp:ListItem>
                    </asp:DropDownList>

                </div>
            </div>


            <div class="form-group row">
                <asp:Label runat="server" AssociatedControlID="ptoComments" CssClass="col-md-2 control-label">Note</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="ptoComments" runat="server" Height="71px" MaxLength="100" TextMode="MultiLine" Width="366px"></asp:TextBox>
                </div>
            </div>
             <div class="form-group row">
                 <div class="col-md-offset-2 col-md-10">
                     <asp:CustomValidator ID="ValidateDates" runat="server"  ErrorMessage="PTO request dates provided already exist." 
                         OnServerValidate="ValidateDates_ServerValidate" Display="Dynamic" ControlToValidate="ptoFrom" CssClass="err"></asp:CustomValidator>
                     <asp:CustomValidator ID="ValidateWeekDay" Display="Dynamic" runat="server"  ErrorMessage="PTO request must start and end on a weekday." 
                         OnServerValidate="ValidateWeekDay_ServerValidate" ControlToValidate="ptoFrom" CssClass="err"></asp:CustomValidator>

                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-offset-2 col-md-10">
                    <asp:HiddenField ID="Mode" runat="server" />
                    <asp:HiddenField ID="UserID" runat="server" />
                    <asp:HiddenField ID="ptoID" runat="server" />
                    <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
                    <asp:Button runat="server" OnClick="SubmitForm" Text="Submit Request" CssClass="btn btn-primary" />
                    <asp:Button runat="server" OnClick="Cancel" CausesValidation="false" Text="Cancel"  aria-label="Close" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </section>
</asp:Panel>
