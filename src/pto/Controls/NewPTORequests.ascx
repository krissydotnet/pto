<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="NewPTORequests.ascx.cs" Inherits="pto.Controls.NewPTORequests" %>

<div class="panel panel-primary">
    <div class="panel-heading">
        <div class="pnl-heading">
            <div class="pnl-icon">
                <i class="fa fa-suitcase fa-4x"></i>
            </div>
            <div class="pnl-container">
                 <div class="pnl-heading-section">
                    <div class="pnl-heading-heading">New PTO Request</div>
                    <div class="pnl-heading-value">
                        <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        

    </div>
    <a href="#">
        <div class="panel-footer">
            <span class="pull-left">View Details</span>
            <span class="pull-right" id="view-new-requests"><i class="fa fa-arrow-circle-right fa-2x rotate"></i></span>
            <div class="clearfix"></div>
        </div>
    </a>
    <!-- /.panel-heading -->
    <div class="panel-body" id="new-requests">
        <asp:HiddenField id="divVisibility" runat="server"/>
        
        <asp:GridView ID="gvNewRequests" OnSelectedIndexChanged="OnSelectedIndexChanged" CssClass="table table-hover table-striped" OnRowDataBound="gvNewRequests_RowDataBound" AutoGenerateColumns="False" runat="server">
 
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

<!-- card -->
<div class="modal fade" id="myModal" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered " role="document">
        <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>

    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Approve PTO Request</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            <div class="container">
                      <div class="form-horizontal">
                                   
    <div class="form-group">
            <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label  AssociatedControlID="lblEmployee" runat="server" Text="Employee:"></asp:Label>
            <asp:Label ID="lblEmployee" runat="server" Text="{Employee}"></asp:Label>

    </div>
    <div class="form-group">
            <asp:Label  AssociatedControlID="lblDates" runat="server" Text="Dates:"></asp:Label>
            <asp:Label ID="lblDates" runat="server" Text="{Dates}"></asp:Label>

    </div>
    <div class="form-group">
           <asp:Label  AssociatedControlID="lblHours" runat="server" Text="Hours:"></asp:Label>
           <asp:Label ID="lblHours" runat="server" Text="{Hours}"></asp:Label>

    </div>
    <div class="form-group">
         <asp:Label  AssociatedControlID="lblType" runat="server" Text="Type:"></asp:Label>
         <asp:Label ID="lblType" runat="server" Text="{Type}"></asp:Label>
    </div>
        <div class="form-group">
            <asp:Label  AssociatedControlID="lblComments" runat="server" Text="Comments:"></asp:Label>
            <asp:Label ID="lblComments" runat="server" Text="{Comments}"></asp:Label>
    </div>
    </div>
  
      </div></div>
      <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>

   </ContentTemplate></asp:UpdatePanel> 
          </div>
</div>
