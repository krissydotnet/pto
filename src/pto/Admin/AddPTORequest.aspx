<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AddPTORequest.aspx.cs" Inherits="pto.Admin.AddPTORequest" %>

<%@ Register Src="~/Controls/PTORequestFormCtrl.ascx" TagPrefix="uc1" TagName="PTORequestFormCtrl" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainAdminContent" runat="server">
     <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg"
                data-toggle="modal" data-backdrop="static" data-target="#myModal">
            </button>
    
                    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">


                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">
                                        <asp:Label ID="lblModalHeader" runat="server" Text="Request Time Off"></asp:Label>
                                    </h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                                        <ContentTemplate>
                                            <uc1:PTORequestFormCtrl runat="server" ID="PTORequestFormCtrl" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="modal-footer">
                                </div>
                            </div>


                        </div>
                    </div>

            
            <!-- End PTORequestForm -->
     <script>
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>
</asp:Content>   
