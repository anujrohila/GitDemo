<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="Contactadmin.aspx.vb" Inherits="Contactadmin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <h1 style="color:orange;">Contact US</h1>
    <hr />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Contact Us] WHERE [id] = @original_id AND [notes] = @original_notes AND [phone] = @original_phone AND [mail] = @original_mail AND [address] = @original_address"
        InsertCommand="INSERT INTO [Contact Us] ([notes], [phone], [mail], [address], [id]) VALUES (@notes, @phone, @mail, @address, @id)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [notes], [phone], [mail], [address], [id] FROM [Contact Us]"
        UpdateCommand="UPDATE [Contact Us] SET [notes] = @notes, [phone] = @phone, [mail] = @mail, [address] = @address WHERE [id] = @original_id AND [notes] = @original_notes AND [phone] = @original_phone AND [mail] = @original_mail AND [address] = @original_address">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_notes" Type="String" />
            <asp:Parameter Name="original_phone" Type="String" />
            <asp:Parameter Name="original_mail" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="notes" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="mail" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_notes" Type="String" />
            <asp:Parameter Name="original_phone" Type="String" />
            <asp:Parameter Name="original_mail" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="notes" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="mail" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
        DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#336666" BorderStyle="Double"
         BorderWidth="3px" CellPadding="4" EnableModelValidation="True" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="false" />
            <asp:TemplateField HeaderText="notes" SortExpression="notes">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Height="102px" Text='<%# Bind("notes") %>'
                        TextMode="MultiLine" Width="300"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Height="65px" Text='<%# Bind("notes") %>' Width="451px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:TemplateField HeaderText="mail" SortExpression="mail">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("mail") %>' Width="243px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("mail") %>' Width="180px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="address" SortExpression="address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Height="59px" Text='<%# Bind("address") %>'
                        TextMode="MultiLine" Width="302px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Height="43px" Text='<%# Bind("address") %>'
                        Width="221px"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" EditImageUrl="~/buttons/button_edit.png"
                ShowEditButton="True" UpdateImageUrl="~/buttons/button_save.png" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
</asp:Content>

