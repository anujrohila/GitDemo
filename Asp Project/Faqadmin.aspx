<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="Faqadmin.aspx.vb" Inherits="Faqadmin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_add.png" />
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_preview.png" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table cellpadding="5">
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server"
                            Text="Enter Question : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="763px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="Please enter your question." Display="Dynamic"
                            ControlToValidate="TextBox1" ValidationGroup="faq"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server"
                            Text="Answer : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="129px"
                            TextMode="MultiLine" Width="582px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Please enter your answer." Display="Dynamic"
                            ControlToValidate="TextBox2" ValidationGroup="faq"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/button_save.png"
                            ValidationGroup="faq" />
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/buttons/button_back.png" /></td>
                    <td></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [FAQ] WHERE [id] = @original_id AND [Question] = @original_Question AND [Answer] = @original_Answer"
                InsertCommand="INSERT INTO [FAQ] ([id], [Question], [Answer]) VALUES (@id, @Question, @Answer)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [Question], [Answer] FROM [FAQ]"
                UpdateCommand="UPDATE [FAQ] SET [Question] = @Question, [Answer] = @Answer WHERE [id] = @original_id AND [Question] = @original_Question AND [Answer] = @original_Answer">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_Question" Type="String" />
                    <asp:Parameter Name="original_Answer" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Question" Type="String" />
                    <asp:Parameter Name="Answer" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_Question" Type="String" />
                    <asp:Parameter Name="original_Answer" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="Question" Type="String" />
                    <asp:Parameter Name="Answer" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" EnableModelValidation="True" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="false" />
                    <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                    <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" />
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" DeleteImageUrl="~/buttons/button_delete.png"
                        EditImageUrl="~/buttons/button_edit.png" ShowDeleteButton="True" ShowEditButton="True"
                        UpdateImageUrl="~/buttons/button_save.png" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <br />
            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_back.png" />
        </asp:View>
    </asp:MultiView>&nbsp;
</asp:Content>

