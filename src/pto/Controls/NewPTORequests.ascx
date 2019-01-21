<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="NewPTORequests.ascx.cs" Inherits="pto.Controls.NewPTORequests" %>

<div class="custom-card">

    <div class="custom-card-title">
        <div class="custom-title">
        <h3 ><i class="fa fa-suitcase"></i>
            New PTO Requests</h3>
        </div>

    </div>
    
    <!-- /.panel-heading -->
    <div class="custom-card-body" id="new-requests">
        <asp:HiddenField ID="divVisibility" runat="server" />
       

        <asp:GridView ID="gvNewRequests" CssClass="table table-hover table-striped" OnRowDataBound="gvNewRequests_RowDataBound" AutoGenerateColumns="False" EmptyDataText="No Pending PTO Requests" runat="server">
          
            <Columns>
                
                <asp:TemplateField HeaderText="REQUESTS" >
                    <ItemTemplate>
                        <div class="container mygrid">
                              <div class="row">
                                <div class="col-md-4 mygrid-label">
                                    Employee: 
                                </div>
                                  <div class="col-md-8 mygrid-content">
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                  </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mygrid-label">
                                    Dates: 
                                </div>
                                 <div class="col-md-8 mygrid-content">
                                <asp:Label ID="lblDates"  runat="server" Text="{Dates}"></asp:Label>
                                     </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mygrid-label"> Hours: </div>
                                 <div class="col-md-8 mygrid-content">
                                <asp:Label ID="lblHours"  runat="server" Text='{Hours}'></asp:Label>
</div>

                            </div>
                            <div class="row">
                                <div class="col-md-4 mygrid-label"> Type:  </div>
                                 <div class="col-md-8 mygrid-content">
                                <asp:Label ID="lblPTOType"  runat="server" Text='{description}'></asp:Label>
                                     </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 mygrid-label"> Comments:  </div>

                            </div>
                            <div class="row">
                                 <div class="col-md-12 mygrid-content">
                                <asp:Label ID="lblComments"  runat="server" Text='{Comments}'></asp:Label>
                                </div>
                            </div>
                        </div> 
                           
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-Width="30px" HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-primary" Font-Size="Smaller" CommandArgument='<%# Eval("Id") %>' OnClick="ApprovePTO" Text="Approve"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="err"></asp:Label>
    

</div></div>
<div style="visibility: hidden">
    <asp:Button ID="ButtonHidden" runat="server" />
</div>

