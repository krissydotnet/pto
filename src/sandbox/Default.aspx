<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="sandbox.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script src="./Scripts/jquery-3.3.1.min.js"></script>
        <script src="./Scripts/jquery-ui-1.12.1.min.js"></script>
        <script src="./Scripts/DateCompare.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section>
   
<div>  
    <asp:TextBox ID="txtDate" runat="server" CssClass="txtDate"></asp:TextBox>
</div>  
        
    
</section>
</asp:Content>
