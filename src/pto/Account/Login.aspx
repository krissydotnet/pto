<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="pto.Account.Login" Async="true" %>

<%@ Register Src="~/Controls/LoginForm.ascx" TagPrefix="uc1" TagName="LoginForm" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">


    <div class="row">
        <div class="col-md-8">

            <uc1:LoginForm runat="server" id="LoginForm" />

        </div>


    </div>
</asp:Content>
