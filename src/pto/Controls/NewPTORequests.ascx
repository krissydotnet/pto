<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="NewPTORequests.ascx.cs" Inherits="pto.Controls.NewPTORequests" %>

<div class="custom-card">
    <div class="custom-card-title">
        <div class="custom-heading">
            <div class="custom-icon">
                <i class="fa fa-suitcase fa-3x"></i>
            </div>
            <div class="custom-heading-container">
                 <div class="custom-title">
                    <div class="custom-heading-heading">New PTO Request</div>
                    <div class="custom-heading-value">
                        <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        

    </div>
    <!--
    <a href="#">
        <div class="custom-card-details">
            <span class="custom-details-left">View Details</span>
            <span class="custom-details-right" id="view-new-requests"><i class="fa fa-arrow-circle-right fa-2x rotate"></i></span>
        
        </div>
    </a>
    -->
    <!-- /.panel-heading -->
    <div class="custom-card-body" id="new-requests">
        <asp:HiddenField id="divVisibility" runat="server"/>
        
        <asp:GridView ID="gvNewRequests"  CssClass="table table-hover table-striped" AutoGenerateColumns="False" runat="server">
 
            <Columns>
                <asp:TemplateField HeaderText="NAME">
                    <ItemTemplate>
                        <i class="fa fa-user"></i>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DATE(S)">
                    <ItemTemplate>
                        <asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("start_date", "{0:MM/dd/yyyy}") %>'></asp:Label>
                        <asp:Label ID="lblEndDate" runat="server" Text='<%# Eval("end_date", "- {0:MM/dd/yyyy}") %>'></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" >
                    <ItemTemplate>
                       <div class="newrequest-type">
                            <asp:Label ID="lblPTOType" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                        </div>
                        <div class="newrequest-type-comments">
                            <asp:Label ID="lblPTOComment" runat="server" Text='<%# Bind("comments") %>'></asp:Label></div>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="HOURS">
                    <ItemTemplate>
                        <asp:Label ID="lblHours" runat="server" Text='<%# Bind("hours") %>'></asp:Label>
                        hours
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField ItemStyle-Width = "30px" HeaderText = "">
   <ItemTemplate>
       <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("Id") %>'   OnClick="ApprovePTO" Text="Approve"></asp:LinkButton>
   </ItemTemplate>
</asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="err"></asp:Label>
    </div>

</div>
<div style="visibility:hidden">
<asp:Button id="ButtonHidden" runat="server"/>
</div>

