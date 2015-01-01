<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Cpassword.aspx.vb" Inherits="Cpassword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="center_title_bar" id="DIV1">Change Password</div>
    <div class="prod_box" style="width: 536px; height: 304px; position: relative;">
        <div class="bottom_prod_box" style="width: 520px; position: relative; height: 200px">
            <table border="0">
                <tr>
                    <td style="width:180px">
                        <asp:Label ID="Label1" runat="server" Text="Old Paasword :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="Old Password Required" Display="Dynamic" ValidationGroup="changepassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="New Paasword :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" ></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                            ErrorMessage="New Password Required" Display="Dynamic" ValidationGroup="changepassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Confirm New Paasword :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" ></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2"
                            ControlToValidate="TextBox3" ErrorMessage="New Password And Confirm New Password Must Be Matched" Display="Dynamic" ValidationGroup="changepassword"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3"
                            ErrorMessage="Confirm New Paasword Required" Width="400px" Display="Dynamic" ValidationGroup="changepassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_save.png" ValidationGroup="changepassword" />
                        <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" ImageUrl="~/buttons/cancel.jpg" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

