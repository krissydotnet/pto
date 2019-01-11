<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="pto.Account.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvReport" runat="server">
            </asp:GridView>
            <asp:Button ID="Button1" runat="server" Text="Submit Test" />
        </div>
    </form>
</body>
</html>
