<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="shiping.aspx.vb" Inherits="shiping" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="center_title_bar" id="DIV1">Unauthorized access</div>
    <div class="prod_box" style="width: 536px; height: 304px; position: relative;">
        <div class="bottom_prod_box" style="width: 520px; position: relative; height: 200px">
            <table cellpadding="10">
                <tr>
                    <td style="vertical-align: top" colspan="2">
                        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td style="width: 150px; vertical-align: top">
                        <asp:Label ID="Label1" runat="server"
                            Text="Name : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="205px" MaxLength="50"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please provide name." ControlToValidate="TextBox1" Display="Dynamic" ValidationGroup="shiping"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                        <asp:Label ID="Label2" runat="server" Text="Address : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="135px" Style="position: relative; top: 0px; left: 1px;"
                            TextMode="MultiLine" Width="268px" MaxLength="500"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please provide address." ControlToValidate="TextBox2" Display="Dynamic" ValidationGroup="shiping"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server"
                            Text="Phone Number : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"
                            Width="187px" MaxLength="50"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please provide phone no." ControlToValidate="TextBox3" Display="Dynamic" ValidationGroup="shiping"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_completeorder.png" OnClick="ImageButton1_Click" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

