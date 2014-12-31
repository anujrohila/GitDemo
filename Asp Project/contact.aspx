<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="contact.aspx.vb" Inherits="contact" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="center_title_bar" id="DIV1">Contact Us</div>
    <div class="prod_box" style="width: 536px; height: 304px; position: relative;">
        <div class="bottom_prod_box" style="width: 520px; position: relative; height: 200px">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [notes], [phone], [mail], [address] FROM [Contact Us]"></asp:SqlDataSource>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Style="position: relative">
                <ItemTemplate>
                    <table style="position: relative" cellpadding="10">
                        <tr>
                            <td style="width: 150px; vertical-align: top">
                                <strong>Contact Us: </strong>&nbsp;</td>
                            <td>
                                <asp:Label ID="notesLabel" runat="server" Style="position: relative" Text='<%# Eval("notes") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 150px; vertical-align: top">
                                <strong>Contact By Phone:</strong>
                            </td>
                            <td>
                                <asp:Label ID="phoneLabel" runat="server" Style="position: relative" Text='<%# Eval("phone") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 150px; vertical-align: top">
                                <strong>Contact By Mail:</strong>
                            </td>
                            <td>
                                <asp:Label ID="mailLabel" runat="server" Style="position: relative" Text='<%# Eval("mail") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 150px; vertical-align: top">
                                <strong>Address:</strong></td>
                            <td>
                                <asp:Label ID="addressLabel" runat="server" Style="position: relative" Text='<%# Eval("address") %>'></asp:Label></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>

