<%@ Control Language="C#" EnableViewState="false" AutoEventWireup="true" CodeBehind="NewPTORequests.ascx.cs" Inherits="pto.Controls.NewPTORequests" %>

<div class="custom-card">

    <div class="custom-card-title">
        <div class="custom-title">
        <h3 ><i class="fa fa-suitcase"></i>
            New PTO Requests</h3>
             <!--       <div class="custom-heading-value">
            <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
        </div> -->
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
        <asp:HiddenField ID="divVisibility" runat="server" />

        <asp:GridView ID="gvNewRequests" CssClass="table table-hover table-striped" OnRowDataBound="gvNewRequests_RowDataBound" AutoGenerateColumns="False" EmptyDataText="No Pending PTO Requests" runat="server">

            <Columns>
                
                <asp:TemplateField HeaderText="NAME">
                    <ItemTemplate>
                        <i class="fa fa-user"></i>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <div class="container-fluid">
                        <div class="form-horizontal">
                            <div class="form-group row">
                                <div class="ctl-label">
                                    Dates: 
                                </div>
                                <asp:Label ID="lblDates" runat="server" Text="{Dates}"></asp:Label>

                            </div>
                            <div class="form-group row">
                                <div class="ctl-label"> Hours: </div>
                                <asp:Label ID="lblHours" runat="server" Text='{Hours}'></asp:Label>


                            </div>
                            <div class="form-group row">
                                <div class="ctl-label"> Type:  </div>
                                <asp:Label ID="lblPTOType" runat="server" Text='{description}'></asp:Label>

                            </div>
                            <div class="form-group row">
                                <div class="ctl-label"> Comments:  </div>
                                <asp:Label ID="lblComments" runat="server" Text='{Comments}'></asp:Label>

                            </div>
                        </div> 
                            </div>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-Width="30px" HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("Id") %>' OnClick="ApprovePTO" Text="Approve"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="err"></asp:Label>
    </div>

</div>
<div style="visibility: hidden">
    <asp:Button ID="ButtonHidden" runat="server" />
</div>

