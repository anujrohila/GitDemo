<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Shopingcart.aspx.vb" Inherits="Shopingcart" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;&nbsp;
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tempShoping] WHERE [id] = @original_id AND [Product_Name] = @original_Product_Name AND [Qty] = @original_Qty AND [Price] = @original_Price AND [Total] = @original_Total"
                InsertCommand="INSERT INTO [tempShoping] ([Product_Name], [Qty], [Price], [Total], [id]) VALUES (@Product_Name, @Qty, @Price, @Total, @id)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Product_Name], [Qty], [Price], [Total], [id] FROM [tempShoping] WHERE ([sid] = @sid)"
                UpdateCommand="UPDATE [tempShoping] SET [Product_Name] = @Product_Name, [Qty] = @Qty, [Price] = @Price, [Total] = @Total WHERE [id] = @original_id AND [Product_Name] = @original_Product_Name AND [Qty] = @original_Qty AND [Price] = @original_Price AND [Total] = @original_Total">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_Product_Name" Type="String" />
                    <asp:Parameter Name="original_Qty" Type="Int32" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_Total" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Product_Name" Type="String" />
                    <asp:Parameter Name="Qty" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Total" Type="Decimal" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_Product_Name" Type="String" />
                    <asp:Parameter Name="original_Qty" Type="Int32" />
                    <asp:Parameter Name="original_Price" Type="Decimal" />
                    <asp:Parameter Name="original_Total" Type="Decimal" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="sid" SessionField="sid" Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="Product_Name" Type="String" />
                    <asp:Parameter Name="Qty" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Total" Type="Decimal" />
                    <asp:Parameter Name="id" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="id" DataSourceID="SqlDataSource1">
                <PagerSettings FirstPageText="First" LastPageText="Last" />
                <Columns>
                    <asp:TemplateField HeaderText="Product_Name" SortExpression="Product_Name">
                        <EditItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qty" SortExpression="Qty">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="Please Enter Quantityty" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="Enter in Proper Range" MaximumValue="5" MinimumValue="1" SetFocusOnError="True"></asp:RangeValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price" SortExpression="Price">
                        <EditItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total" SortExpression="Total">
                        <EditItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            &nbsp;
                            <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Update" ImageUrl="~/buttons/button_save.png"
                                OnClick="ImageButton3_Click1" />
                            <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Cancel"
                                ImageUrl="~/buttons/cancel.jpg" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False"
                                CommandName="Delete" ImageUrl="~/buttons/button_delete.png"    />
                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Edit"
                                ImageUrl="~/buttons/button_edit.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            &nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/buttons/button_buynow.png"
                Style="left: 168px; position: relative; top: 33px" />
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="Red"
                Style="left: -44px; position: relative; top: -13px" Text="Total Rs."></asp:Label>
            <asp:Label ID="Label7" runat="server" Style="left: -34px; position: relative; top: -14px"></asp:Label><br />
            <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/buttons/button_continue.png" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Times New Roman"
                Font-Overline="False" Font-Size="Large" Font-Underline="False" ForeColor="Red"
                Text="Your shopping cart is empty!! You can buy some of the best products for the lowest prices possible. &#13;&#10;&#13;&#10;To buy a productr you can browse through the category of your choice. &#13;&#10;Just click on the button below and experience the best online shopping experience again"></asp:Label><br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_continue.png" /></asp:View>
    </asp:MultiView>
</asp:Content>

