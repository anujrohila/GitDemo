<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="shiping.aspx.vb" Inherits="shiping" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Height="2px" Style="left: 23px; position: relative;
        top: -114px" Text="Name : "></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Style="left: 110px; position: relative;
        top: -113px" Width="205px" MaxLength="50"></asp:TextBox>
    <asp:Label ID="Label2" runat="server" Style="left: -229px; position: relative; top: -75px"
        Text="Address : "></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" Height="135px" Style="left: -155px; position: relative;
        top: 45px" TextMode="MultiLine" Width="268px" MaxLength="500"></asp:TextBox><br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Style="left: 6px; position: relative; top: 0px"
        Text="Phone Number : "></asp:Label>
    <asp:TextBox ID="TextBox3" runat="server" Style="left: 71px; position: relative;
        top: 0px" Width="187px" MaxLength="50"></asp:TextBox><br />
    <br />
    <br />
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_completeorder.png"
        Style="left: 149px; position: relative; top: 2px" /><br />
    <br />
</asp:Content>

