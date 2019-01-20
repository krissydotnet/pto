<%@ Page Title="Reports" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="pto.Admin.Reports" %>

<%@ Register Src="~/Controls/Admin_Reports.ascx" TagPrefix="uc1" TagName="Admin_Reports" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainAdminContent" runat="server">
    <div class="row">
        <div class="col-md-8">

            <asp:Panel ID="pnl_ptoRequests" Visible="false"  runat="server">
                <uc1:Admin_Reports runat="server" id="Admin_Reports" />
         </asp:Panel>
        </div>
    </div>

</asp:Content>
