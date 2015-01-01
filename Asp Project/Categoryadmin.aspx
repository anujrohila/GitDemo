<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="Categoryadmin.aspx.vb" Inherits="Categoryadmin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="color:orange;">Category</h1>
    <hr />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_add.png" />&nbsp;<asp:ImageButton
                ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_preview.png" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table cellpadding="5">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" 
                            Text="Enter Category Name : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="category" ControlToValidate="TextBox1" ErrorMessage="Please enter category name."></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        </td>
                    <td>
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/buttons/button_save.png" ValidationGroup="category" />
                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_back.png" /></td>
                    <td></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
           <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/button_back.png" />
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
                AutoGenerateColumns="False" DataKeyNames="cat_id" DataSourceID="SqlDataSource1" Width="328px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" EnableModelValidation="True" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="cat_id" HeaderText="cat_id" ReadOnly="True" SortExpression="cat_id" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" FooterStyle-Font-Bold="true"   />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" DeleteImageUrl="~/buttons/button_delete.png" EditImageUrl="~/buttons/button_edit.png" UpdateImageUrl="~/buttons/button_save.png" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White"  HorizontalAlign="Left" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
</asp:Content>

