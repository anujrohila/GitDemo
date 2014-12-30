<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="productadmin.aspx.vb" Inherits="productadmin" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/buttons/button_add.png" />
            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_preview.png" /></asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="Label1" runat="server" Style="position: relative" Text="Select Category"></asp:Label>
            <asp:DropDownList ID="Catagory" runat="server" Style="left: 8px; position: relative;
                top: 0px" DataSourceID="cat" DataTextField="Name" DataValueField="cat_id">
            </asp:DropDownList>
            <asp:DropDownList ID="Manufacturer" runat="server" Style="left: 205px; position: relative;
                top: 1px" DataSourceID="Man" DataTextField="Name" DataValueField="id">
            </asp:DropDownList>
            <asp:Label ID="Label2" runat="server" Style="position: relative" Text="Select Manufacturer"></asp:Label><br />
            <asp:SqlDataSource ID="cat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [Name], [cat_id] FROM [cat]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Man" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [id], [Name] FROM [Man]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label3" runat="server" Style="position: relative" Text="Product Name :"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Style="left: 48px; position: relative;
                top: 0px"></asp:TextBox><br />
            <br />
            <asp:Label ID="Label4" runat="server" Style="position: relative" Text="Upload Image : "></asp:Label>
            <asp:FileUpload ID="FileUpload2" runat="server" Style="left: 48px; position: relative;
                top: 0px" Width="256px" /><br />
            <asp:Label ID="Label5" runat="server" Style="left: 0px; position: relative; top: 16px"
                Text="Amount : " Width="72px"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" Style="left: 48px; position: relative;
                top: 16px"></asp:TextBox><br />
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Style="left: -3px; position: relative; top: -105px"
                Text="Brief Description : " Width="98px"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" Height="118px" Style="left: 22px; position: relative;
                top: 0px" Width="417px"></asp:TextBox><br />
            <br />
            &nbsp;<asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/button_save.png" />
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_back.png" /></asp:View>
        <asp:View ID="View3" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [id] = @original_id AND [Name] = @original_Name AND [Amount] = @original_Amount"
                InsertCommand="INSERT INTO [Product] ([id], [Name], [Amount]) VALUES (@id, @Name, @Amount)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [Name], [Amount] FROM [Product]"
                UpdateCommand="UPDATE [Product] SET [Name] = @Name, [Amount] = @Amount WHERE [id] = @original_id AND [Name] = @original_Name AND [Amount] = @original_Amount">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Decimal" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Amount" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="original_id" Type="Decimal" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Amount" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Decimal" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" DeleteImageUrl="~/buttons/button_delete.png"
                        EditImageUrl="~/buttons/button_edit.png" ShowDeleteButton="True" ShowEditButton="True"
                        UpdateImageUrl="~/buttons/button_save.png" />
                </Columns>
            </asp:GridView>
            <br />
            &nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_back.png" /></asp:View>
    </asp:MultiView>
</asp:Content>

