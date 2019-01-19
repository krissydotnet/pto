<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.ascx.cs" Inherits="pto.Controls.LoginForm" %>
<section id="loginForm">
                <div class="form-horizontal">

                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ddlUsers" CssClass="col-md-2 control-label">User: </asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="ddlUsers" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in"  CssClass="btn btn-primary" />
                            
                        </div>
                    </div>
                </div>


            </section>