<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Cpassword.aspx.vb" Inherits="Cpassword" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0">
        <tr>
            <td style="width: 179px">
                <asp:Label ID="Label1" runat="server" Text="Old Paasword :"></asp:Label></td>
            <td style="width: 221px">
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" Width="179px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 179px">
                <asp:Label ID="Label2" runat="server" Text="New Paasword :"></asp:Label></td>
            <td style="width: 221px">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="178px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 179px">
                <asp:Label ID="Label3" runat="server" Text="Confirm New Paasword :"></asp:Label></td>
            <td style="width: 221px">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Width="178px"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="Old Password Required" Width="400px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2"
                    ControlToValidate="TextBox3" ErrorMessage="New Password And Confirm New Password Must Be Matched"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td colspan="2" style="height: 16px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="New Password Required"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 179px">
                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_save.png" /></td>
            <td style="width: 221px">
                <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" ImageUrl="~/buttons/cancel.jpg" /></td>
        </tr>
    </table>
</asp:Content>

