<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="Manufactureradmin.aspx.vb" Inherits="Manufactureradmin" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            &nbsp;
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_add.png" />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_preview.png" /></asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="Label1" runat="server" Style="position: relative; left: 0px;" Text="Name :"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Style="position: relative"></asp:TextBox>&nbsp;<br />
            <br />
            <br />
            <br />
            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/buttons/button_save.png" />
            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_back.png" /></asp:View>
        <asp:View ID="View3" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Man] WHERE [id] = @original_id AND [Name] = @original_Name"
                InsertCommand="INSERT INTO [Man] ([id], [Name]) VALUES (@id, @Name)" OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT [id], [Name] FROM [Man]" UpdateCommand="UPDATE [Man] SET [Name] = @Name WHERE [id] = @original_id AND [Name] = @original_Name">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                DataSourceID="SqlDataSource1" PageSize="15" Style="position: relative">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" DeleteImageUrl="~/buttons/button_delete.png" EditImageUrl="~/buttons/button_edit.png" UpdateImageUrl="~/buttons/button_save.png" />
                </Columns>
            </asp:GridView>
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/button_back.png" /></asp:View>
    </asp:MultiView>
</asp:Content>

