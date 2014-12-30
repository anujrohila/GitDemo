<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="contact.aspx.vb" Inherits="contact" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [notes], [phone], [mail], [address] FROM [Contact Us]"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Style="position: relative">
        <ItemTemplate>
            <table style="position: relative">
                <tr>
                    <td style="width: 100px; height: 77px">
                        <strong>
                        Contact Us: </strong>&nbsp;</td>
                    <td style="width: 396px; height: 77px">
                        <asp:Label ID="notesLabel" runat="server" Style="position: relative" Text='<%# Eval("notes") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 81px;">
                        <strong>
                        Contact By Phone:</strong>
                    </td>
                    <td style="width: 396px; height: 81px;">
                        <asp:Label ID="phoneLabel" runat="server" Style="position: relative" Text='<%# Eval("phone") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 79px;">
                        <strong>
                        Contact By Mail:</strong>
                    </td>
                    <td style="width: 396px; height: 79px;">
                        <asp:Label ID="mailLabel" runat="server" Style="position: relative" Text='<%# Eval("mail") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 50px;">
                        <strong>
                        Address:</strong></td>
                    <td style="width: 396px; height: 50px;">
                        <asp:Label ID="addressLabel" runat="server" Style="position: relative" Text='<%# Eval("address") %>'></asp:Label></td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

