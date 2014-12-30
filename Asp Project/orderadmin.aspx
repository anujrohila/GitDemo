<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="orderadmin.aspx.vb" Inherits="orderadmin" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [pn], [amt], [qty], [tot] FROM [custord] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="ord" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="pn" HeaderText="Product Name" SortExpression="pn" />
            <asp:BoundField DataField="amt" HeaderText="Amount" SortExpression="amt" />
            <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
            <asp:BoundField DataField="tot" HeaderText="Total" SortExpression="tot" />
        </Columns>
    </asp:GridView>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_back.png" />
</asp:Content>

