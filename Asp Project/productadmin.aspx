<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="productadmin.aspx.vb" Inherits="productadmin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="color: orange;">Product</h1>
    <hr />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/buttons/button_add.png" />
            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_preview.png" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:SqlDataSource ID="cat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [Name], [cat_id] FROM [cat]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Man" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [id], [Name] FROM [Man]"></asp:SqlDataSource>
            <table cellpadding="5">
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server"
                            Text="Select Category : "></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="Catagory" runat="server"
                            DataSourceID="cat" DataTextField="Name" DataValueField="cat_id">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server"
                            Text="Select Manufacturer : "></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="Manufacturer" runat="server"
                            DataSourceID="Man" DataTextField="Name" DataValueField="id">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server"
                            Text="Product Name : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="Please enter product name." ControlToValidate="TextBox1"
                            ValidationGroup="product" Display="Dynamic"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server"
                            Text="Upload Image : "></asp:Label></td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" Width="256px" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server"
                            Text="Amount : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Please enter product amount." ControlToValidate="TextBox2"
                            ValidationGroup="product" Display="Dynamic"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">
                        <asp:Label ID="Label3" runat="server"
                            Text="Brief Description : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Height="118px" Width="417px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="Please enter product description." ControlToValidate="TextBox3" Display="Dynamic" ValidationGroup="product"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/button_save.png" ValidationGroup="product" />
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_back.png" /></td>
                    <td></td>
                </tr>
            </table>
        </asp:View>
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
                AutoGenerateColumns="False" DataKeyNames="id" 
                DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#336666" BorderStyle="Double" 
                BorderWidth="3px" CellPadding="4" EnableModelValidation="True" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="false" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-Width="300" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" ItemStyle-Width="150"/>
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" DeleteImageUrl="~/buttons/button_delete.png"
                        EditImageUrl="~/buttons/button_edit.png" ShowDeleteButton="True" ShowEditButton="True"
                        UpdateImageUrl="~/buttons/button_save.png" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_back.png" />
        </asp:View>
    </asp:MultiView>
</asp:Content>

