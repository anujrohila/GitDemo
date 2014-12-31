<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="center_title_bar" id="DIV1">Login</div>
    <div class="prod_box" style="width: 536px; height: 304px; position: relative;">
        <div class="bottom_prod_box" style="width: 520px; position: relative; height: 200px">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False"
                            Font-Size="Large" Font-Strikeout="False" Font-Underline="False" ForeColor="Red"
                            Text="Want To Create New Account ?"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_registerforfree.png" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE"  BorderColor="#CCCC99" BorderStyle="Solid"
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt">
                            <TitleTextStyle BackColor="#45818C" Font-Bold="True" Height="30" ForeColor="#FFFFFF" />
                        </asp:Login>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

