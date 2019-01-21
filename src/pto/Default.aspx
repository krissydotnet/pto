<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto._Default" %>

<%@ Register Src="~/Controls/LoginForm.ascx" TagPrefix="uc1" TagName="LoginForm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Home Page */

        .myJumbotron {
            background-image: url("/images/vacation_pic.jpg");
            background-size: cover;
            height: 80vh;
        }
        
    </style>
    <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron myJumbotron">
        <h1>PTO Tracking System</h1>

    </div>

    <button type="button" id="btnShowPopup" style="display: none;" class="btn btn-primary" data-toggle="modal" data-target=".bd-modal-sm"></button>
    <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="myModal" class="modal fade bd-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Login</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                        <uc1:LoginForm runat="server" ID="LoginForm" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
