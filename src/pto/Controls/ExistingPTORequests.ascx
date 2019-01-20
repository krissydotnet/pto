<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExistingPTORequests.ascx.cs" Inherits="pto.Controls.ExistingPTORequests" %>
    <section id="ptoExistingRequests">
        <div class="form-horizontal">
            <h2>Existing PTO Requests</h2>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <asp:GridView ID="gvExistingRequests" DataKeyNames="id"  AutoGenerateColumns="false" CssClass="table table-hover table-striped" runat="server">
                <Columns>
                    <asp:BoundField HeaderText="Start" DataField="start_date" DataFormatString="{0:d}" />
                    <asp:BoundField HeaderText="End" DataField="end_date" DataFormatString="{0:d}" />
                    <asp:BoundField HeaderText="Description" DataField="description" />
                    <asp:BoundField HeaderText="Hours" DataField="hours" />
                    <asp:TemplateField ItemStyle-Width = "30px" HeaderText = "">
   <ItemTemplate>
       <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("Id") %>'    Text="Edit Request"></asp:LinkButton>
   </ItemTemplate>
</asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button OnClick="Cancel" Text="Cancel" CssClass="btn btn-default" runat="server" />
        </div>
    </section>

