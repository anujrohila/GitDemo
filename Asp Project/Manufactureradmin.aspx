<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="Manufactureradmin.aspx.vb" Inherits="Manufactureradmin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            &nbsp;
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_add.png" />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_preview.png" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table cellpadding="5">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Style="position: relative; left: 0px;" Text="Name :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Style="position: relative"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="manufacturer" ControlToValidate="TextBox1" ErrorMessage="Please enter manufacturer."></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/buttons/button_save.png" ValidationGroup="manufacturer" />
                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_back.png" /></td>
                    <td></td>
                </tr>
            </table>
        </asp:View>
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
                AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1"
                PageSize="15" Width="328px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" EnableModelValidation="True" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" FooterStyle-Font-Bold="true" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" 
                        DeleteImageUrl="~/buttons/button_delete.png" EditImageUrl="~/buttons/button_edit.png" UpdateImageUrl="~/buttons/button_save.png" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/button_back.png" />
        </asp:View>
    </asp:MultiView>
</asp:Content>

