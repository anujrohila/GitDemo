<%@ Page Language="VB" MasterPageFile="~/adminmaster.master" AutoEventWireup="false" CodeFile="Faqadmin.aspx.vb" Inherits="Faqadmin" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/button_add.png" />
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_preview.png" /></asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Enter Question : "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Width="763px"></asp:TextBox><br />
            <br />
            <asp:Label ID="Label2" runat="server" Style="z-index: 100; left: 5px; position: relative;
                top: -116px" Text="Answer : "></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="129px" Style="z-index: 102; left: 33px;
                position: relative; top: -1px" TextMode="MultiLine" Width="582px"></asp:TextBox><br />
            <br />
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/buttons/button_save.png" />
            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/buttons/button_back.png" /></asp:View>
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
                AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/buttons/cancel.jpg" DeleteImageUrl="~/buttons/button_delete.png"
                        EditImageUrl="~/buttons/button_edit.png" ShowDeleteButton="True" ShowEditButton="True"
                        UpdateImageUrl="~/buttons/button_save.png" />
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                    <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/buttons/button_back.png" /></asp:View>
    </asp:MultiView>&nbsp;
</asp:Content>

