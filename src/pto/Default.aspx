<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pto._Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .myJumbotron {
            background-image: url("/images/vacation_pic.jpg");
            background-size: cover;
            height: 80vh;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron myJumbotron">
        <h1>PTO Tracking System</h1>

    </div>


</asp:Content>
