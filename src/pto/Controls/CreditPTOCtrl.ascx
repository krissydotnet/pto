<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreditPTOCtrl.ascx.cs" Inherits="pto.Controls.CreditPTOCtrl" %>
<asp:Panel ID="pnlPTOCreditForm" runat="server">
    <section id="ptoCredit">
        <div class="form-horizontal">
           
            <div class="form-group row" id="rowEmployee" runat="server">
                <asp:Label runat="server" AssociatedControlID="ptoEmployee" CssClass="col-md-2 control-label">Employee *</asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="ptoEmployee" runat="server"></asp:DropDownList>

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
