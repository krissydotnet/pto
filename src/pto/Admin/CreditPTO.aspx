<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="CreditPTO.aspx.cs" Inherits="pto.Admin.CreditPTO" %>

<%@ Register Src="~/Controls/CreditPTOCtrl.ascx" TagPrefix="uc1" TagName="CreditPTOCtrl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainAdminContent" runat="server">
   <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg"
                data-toggle="modal" data-backdrop="static" data-target="#myModal">
            </button>
    
                    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">


                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">
                                        <asp:Label ID="lblModalHeader" runat="server" Text="Credit PTO"></asp:Label>
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" id="modal-close" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                                        <ContentTemplate>
                                            <uc1:CreditPTOCtrl runat="server" id="CreditPTOCtrl" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>


                        </div>
                    </div>

         <script>
        function ShowPopup() {
            $("#btnShowPopup").click();
         }

        function DismissPopup() {
            $("#modal-dismiss").click();
        }
    </script>
</asp:Content>
