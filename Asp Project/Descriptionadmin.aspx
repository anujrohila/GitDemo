<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="Descriptionadmin.aspx.vb" Inherits="Descriptionadmin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="color: orange;">Description</h1>
    <hr />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Descr] WHERE [Id] = @original_Id AND [Notes] = @original_Notes"
        InsertCommand="INSERT INTO [Descr] ([Id], [Notes]) VALUES (@Id, @Notes)" OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT [Id], [Notes] FROM [Descr]" UpdateCommand="UPDATE [Descr] SET [Notes] = @Notes WHERE [Id] = @original_Id AND [Notes] = @original_Notes">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Notes" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Notes" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" PageSize="20" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" EnableModelValidation="True" GridLines="Horizontal">
        <Columns>
            <%--<asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/buttons/select.jpg" />--%>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="false" />
            <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Height="192px" Text='<%# Bind("Notes") %>'
                        TextMode="MultiLine" Width="542px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Notes") %>' Width="547px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" EditImageUrl="~/buttons/button_edit.png" UpdateImageUrl="~/buttons/button_save.png" />
            <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/buttons/button_delete.png" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
</asp:Content>

