<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestTimeOff.aspx.cs" Inherits="pto.Users.RequestTimeOff" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
        <link href="../Content/themes/base/jquery-ui.min.css" rel="stylesheet" /> 
        <script src="../Scripts/jquery-3.3.1.min.js"></script>
        <script src="../Scripts/jquery-ui-1.12.1.min.js"></script>
    <script src="../Scripts/RequestTimeOff.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">
            <section id="ptoRequests">
                <div class="form-horizontal">
                    <h2>Request Time Off</h2>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ptoFrom" CssClass="col-md-2 control-label">From *</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="ptoFrom" CssClass="ptoFrom" runat="server"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ptoTo" CssClass="col-md-2 control-label">To *</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="ptoTo" CssClass="ptoFrom" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ptoHours" CssClass="col-md-2 control-label">Hours</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="ptoHours" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ptoType" CssClass="col-md-2 control-label">Time of type *</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="ptoType" runat="server"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ptoComments" CssClass="col-md-2 control-label">Note</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox ID="ptoComments" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="Save" Text="Submit Request" CssClass="btn btn-default" />
                            <asp:Button runat="server" OnClick="Cancel" Text="Cancel" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
