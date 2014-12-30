<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="Categoryadmin.aspx.vb" Inherits="Categoryadmin" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_add.png" />&nbsp;<asp:ImageButton
                ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_preview.png" /></asp:View>
        <asp:View ID="View2" runat="server">
            <br />
            <asp:Label ID="Label1" runat="server" Style="left: 0px; position: relative; top: 24px"
                Text="Enter Category Name : "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Style="position: relative; left: 64px; top: 24px;"></asp:TextBox><br />
            <br />
            <br />
            <br />
            <br />
            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/buttons/button_save.png" />
            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_back.png" /><br />
            <br />
            <br />
            <br />
            <br />
            </asp:View>
        <asp:View ID="View3" runat="server">
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [cat] WHERE [cat_id] = @cat_id" InsertCommand="INSERT INTO [cat] ([cat_id], [Name]) VALUES (@cat_id, @Name)"
                SelectCommand="SELECT * FROM [cat]" UpdateCommand="UPDATE [cat] SET [Name] = @Name WHERE [cat_id] = @cat_id">
                <DeleteParameters>
                    <asp:Parameter Name="cat_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="cat_id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="cat_id" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="cat_id" DataSourceID="SqlDataSource1"
                PageSize="15"  Width="328px" style="left: 16px; position: relative; top: -30px">
                <Columns>
                    <asp:BoundField DataField="cat_id" HeaderText="cat_id" ReadOnly="True" SortExpression="cat_id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" DeleteImageUrl="~/buttons/button_delete.png" EditImageUrl="~/buttons/button_edit.png" UpdateImageUrl="~/buttons/button_save.png" />
                </Columns>
            </asp:GridView>
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/button_back.png" />&nbsp;
            <br />
            <br />
            <br />
            </asp:View>
    </asp:MultiView>
</asp:Content>

