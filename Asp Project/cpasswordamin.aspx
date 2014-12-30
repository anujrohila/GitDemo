<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="cpasswordamin.aspx.vb" Inherits="cpasswordamin" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp;&nbsp;<br />
    <br />
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp;&nbsp;
    <br />
    <br />
    <table border="0">
        <tr>
            <td style="width: 179px">
                <asp:Label ID="Label1" runat="server" Text="Old Paasword :"></asp:Label></td>
            <td style="width: 221px">
                <asp:TextBox ID="TextBox1" runat="server" Width="179px" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 179px">
                <asp:Label ID="Label2" runat="server" Text="New Paasword :"></asp:Label></td>
            <td style="width: 221px">
                <asp:TextBox ID="TextBox2" runat="server" Width="178px" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 179px">
                <asp:Label ID="Label3" runat="server" Text="Confirm New Paasword :"></asp:Label></td>
            <td style="width: 221px">
                <asp:TextBox ID="TextBox3" runat="server" Width="178px" TextMode="Password"></asp:TextBox></td>
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
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/cancel.jpg" CausesValidation="False" /></td>
        </tr>
    </table>
</asp:Content>

