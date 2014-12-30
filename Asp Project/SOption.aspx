<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SOption.aspx.vb" Inherits="SOption" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="Label1" runat="server" Font-Size="Large" ForeColor="Red" Style="left: 165px;
        position: relative; top: 2px" Text="Select Type Of Your Shiping"></asp:Label><br />
    <br />
    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="a" Style="left: 0px;
        position: relative; top: 10px" Text="I Want To Purchse This Product For Self" /><asp:RadioButton
            ID="RadioButton2" runat="server" GroupName="a" Style="left: 84px; position: relative;
            top: 14px" Text="I Want To Purchse The Product For Other Person" /><br />
    <br />
    <br />
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_checkout.png"
        Style="left: 208px; position: relative; top: 2px" />
</asp:Content>

