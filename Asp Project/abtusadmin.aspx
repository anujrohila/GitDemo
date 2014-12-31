<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="abtusadmin.aspx.vb" Inherits="abtusadmin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table cellpadding="5">
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server"
                            Text="Enter Title : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="379px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="Please enter your title." Display="Dynamic"
                            ControlToValidate="TextBox1" ValidationGroup="aboutus"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server"
                            Text="Description : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="136px"
                            Width="383px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Please enter description." Display="Dynamic"
                            ControlToValidate="TextBox2" ValidationGroup="aboutus"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_save.png"
                            ValidationGroup="aboutus" />
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_back.png" /></td>
                    <td></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="Label1" runat="server" Style="position: relative" Text="Enter Title : "></asp:Label>

            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Style="left: 1px; position: relative; top: -122px"
                Text="Enter Description : " Width="100px"></asp:Label><br />
            <br />
            <br />
            <br />
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/button_save.png"
                Style="left: 14px; position: relative; top: 20px" />
            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/buttons/button_back.png"
                Style="left: 24px; position: relative; top: 19px" /><br />
            <br />
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [abtus] WHERE [id] = @original_id AND [title] = @original_title AND [descr] = @original_descr"
                InsertCommand="INSERT INTO [abtus] ([id], [title], [descr]) VALUES (@id, @title, @descr)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [title], [descr] FROM [abtus]"
                UpdateCommand="UPDATE [abtus] SET [title] = @title, [descr] = @descr WHERE [id] = @original_id AND [title] = @original_title AND [descr] = @original_descr">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_title" Type="String" />
                    <asp:Parameter Name="original_descr" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="descr" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_title" Type="String" />
                    <asp:Parameter Name="original_descr" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="descr" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Style="position: relative">
                <Columns>
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" DeleteImageUrl="~/buttons/button_delete.png"
                        EditImageUrl="~/buttons/button_edit.png" ShowDeleteButton="True" ShowEditButton="True"
                        UpdateImageUrl="~/buttons/button_save.png" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="descr" HeaderText="descr" SortExpression="descr" />
                </Columns>
            </asp:GridView>
            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_back.png"
                Style="left: 7px; position: relative; top: 0px" />
        </asp:View>
    </asp:MultiView>
</asp:Content>

