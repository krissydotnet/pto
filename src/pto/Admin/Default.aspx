<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto.Admin.Default" %>

<%@ Register Src="~/Admin/Controls/NewPTORequests.ascx" TagPrefix="uc1" TagName="NewPTORequests" %>
<%@ Register Src="~/Admin/Controls/Summary.ascx" TagPrefix="uc1" TagName="Summary" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/panels.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.3.1.min.js"></script>
    <script src="../Scripts/Controls/NewPTORequests.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
           <div class="row">
             <div class="col-lg-5">
                 <uc1:NewPTORequests runat="server" ID="NewPTORequests" />
             </div>
                           <div class="col-lg-7">
                 <uc1:Summary runat="server" id="Summary" />
             </div>
           </div>

          
        <!-- /.row -->
               
        </div>
    <!-- /.page-wrapper -->
</asp:Content>
