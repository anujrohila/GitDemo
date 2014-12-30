<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False"
        Font-Size="Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Red"
        Text="Want To Create New Account ?"></asp:Label>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_registerforfree.png"
        Style="left: -201px; position: relative; top: 43px" />
    <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid"
        BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" style="left: 450px; position: relative; top: -35px">
        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
    </asp:Login>
</asp:Content>

