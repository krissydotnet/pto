<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PTORequestForm.ascx.cs" Inherits="pto.Controls.PTORequestForm" %>
<asp:Panel ID="pnlPTORequestForm" runat="server">
    <section id="ptoRequests">
        <div class="form-horizontal">
            <h2>Request Time Off</h2>
            <div class="form-group" id="rowEmployee" runat="server">
                <asp:Label runat="server" AssociatedControlID="ptoEmployee" CssClass="col-md-3 control-label">Employee *</asp:Label>
                <div class="col-md-9">
                    <asp:DropDownList ID="ptoEmployee" runat="server"></asp:DropDownList>

                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ptoType" CssClass="col-md-3 control-label">Time of type *</asp:Label>
                <div class="col-md-9">
                    <asp:DropDownList ID="ptoType" runat="server"></asp:DropDownList>

                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ptoFrom" CssClass="col-md-3 control-label">From *</asp:Label>
                <div class="col-md-9">
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
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ptoTo" CssClass="col-md-3 control-label">To *</asp:Label>
                <div class="col-md-9">
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
            <div class="form-group" id="rowHours">
                <asp:Label runat="server" AssociatedControlID="ptoHours" CssClass="col-md-3 control-label">Hours</asp:Label>
                <div class="col-md-9">
                    <asp:DropDownList ID="ptoHours" runat="server">
                        <asp:ListItem Text="Half Day" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Full Day" Value="8" Selected="True"></asp:ListItem>
                    </asp:DropDownList>

                </div>
            </div>


            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ptoComments" CssClass="col-md-3 control-label">Note</asp:Label>
                <div class="col-md-9">
                    <asp:TextBox ID="ptoComments" runat="server" Height="71px" MaxLength="100" TextMode="MultiLine" Width="366px"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-2 col-md-9">
                    <asp:HiddenField ID="Mode" runat="server" />
                    <asp:HiddenField ID="UserID" runat="server" />
                    <asp:HiddenField ID="ptoID" runat="server" />
                    <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
                    <asp:Button runat="server" OnClick="SubmitForm" Text="Submit Request" CssClass="btn btn-default" />
                    <asp:Button runat="server" OnClick="Cancel" Text="Cancel" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </section>
</asp:Panel>
<asp:Panel ID="pnlExistingPTO" Visible="false" runat="server">
    <section id="ptoExistingRequests">
        <div class="form-horizontal">
            <h2>Existing PTO Requests</h2>
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:GridView ID="gvExistingRequests" DataKeyNames="id" OnRowEditing="gvExistingRequests_RowEditing" OnRowCommand="gvExistingRequests_RowCommand" AutoGenerateColumns="false" CssClass="table table-hover table-striped" runat="server">
                <Columns>
                    <asp:BoundField HeaderText="Start" DataField="start_date" DataFormatString="{0:d}" />
                    <asp:BoundField HeaderText="End" DataField="end_date" DataFormatString="{0:d}" />
                    <asp:BoundField HeaderText="Description" DataField="description" />
                    <asp:BoundField HeaderText="Hours" DataField="hours" />
                    <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" />
                </Columns>
            </asp:GridView>
            <asp:Button OnClick="Cancel" Text="Cancel" CssClass="btn btn-default" runat="server" />
        </div>
    </section>
</asp:Panel>
