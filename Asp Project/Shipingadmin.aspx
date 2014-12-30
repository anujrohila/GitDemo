<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="Shipingadmin.aspx.vb" Inherits="Shipingadmin" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Shiping] WHERE [id] = @original_id"
        InsertCommand="INSERT INTO [Shiping] ([id], [name], [address], [phone], [orderdate], [Total], [uname]) VALUES (@id, @name, @address, @phone, @orderdate, @Total, @uname)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [address], [phone], [orderdate], [Total], [uname] FROM [Shiping]"
        UpdateCommand="UPDATE [Shiping] SET [name] = @name, [address] = @address, [phone] = @phone, [orderdate] = @orderdate, [Total] = @Total, [uname] = @uname WHERE [id] = @original_id">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="orderdate" Type="DateTime" />
            <asp:Parameter Name="Total" Type="Decimal" />
            <asp:Parameter Name="uname" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="orderdate" Type="DateTime" />
            <asp:Parameter Name="Total" Type="Decimal" />
            <asp:Parameter Name="uname" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ButtonType="Image" SelectImageUrl="~/buttons/button_preview.png"
                ShowSelectButton="True" />
            <asp:TemplateField HeaderText="id" SortExpression="id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="orderdate" HeaderText="orderdate" SortExpression="orderdate" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
            <asp:BoundField DataField="uname" HeaderText="uname" SortExpression="uname" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/buttons/button_delete.png"
                ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>

