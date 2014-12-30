<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="createaccount.aspx.vb" Inherits="createaccount" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="User Name :"></asp:Label>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Width="148px" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
        ErrorMessage="UserName Is Requiered"></asp:RequiredFieldValidator>
    <asp:Button ID="Button1" runat="server" Text="Check Availibility" />&nbsp;<br />
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp;
    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label><br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Width="149px" MaxLength="20"></asp:TextBox><br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp;
    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label><br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Confirm Password :"></asp:Label>
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:TextBox ID="txtconfirm" runat="server" TextMode="Password" Width="148px" MaxLength="20"></asp:TextBox><br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Name : "></asp:Label>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp;
    <asp:TextBox ID="TextBox4" runat="server" MaxLength="30"></asp:TextBox><br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Address : "></asp:Label>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    &nbsp;
    <asp:TextBox ID="TextBox5" runat="server" Height="56px" TextMode="MultiLine" MaxLength="200"></asp:TextBox><br />
    <br />
    <asp:Label ID="Label6" runat="server" Text="Phone Number :"></asp:Label>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
    <asp:TextBox ID="TextBox6" runat="server" MaxLength="20"></asp:TextBox><br />
    <br />
    <asp:Label ID="Label7" runat="server" Text="E-mail"></asp:Label>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;<asp:TextBox ID="TextBox7" runat="server" MaxLength="50"></asp:TextBox>
    &nbsp; &nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox7"
        ErrorMessage="Please Enter Correct E-Mail Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
    <br />
    <br />
    <br />
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_createaccount.png" /><br />
</asp:Content>

