<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="orderadmin.aspx.vb" Inherits="orderadmin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="color: orange;">Order</h1>
    <hr />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [pn], [amt], [qty], [tot] FROM [custord] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="ord" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" EnableModelValidation="True" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="pn" HeaderText="Product Name" SortExpression="pn" ItemStyle-Width="300" />
            <asp:BoundField DataField="amt" HeaderText="Amount" SortExpression="amt" ItemStyle-Width="100" />
            <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" ItemStyle-Width="100" />
            <asp:BoundField DataField="tot" HeaderText="Total" SortExpression="tot" ItemStyle-Width="100" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <br />
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_back.png" />
</asp:Content>

