<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1" EnableTheming="True">
        <asp:View ID="View1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT Product.Name, Product.Amount, Product.Image FROM cat INNER JOIN Trans ON cat.cat_id = Trans.catid INNER JOIN Man ON Trans.manid = Man.id INNER JOIN Product ON Trans.id = Product.tranid WHERE (cat.Name = @par1) AND (Man.Name = @par2)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="Split AC" Name="par1" SessionField="cat" />
                    <asp:SessionParameter DefaultValue="LG" Name="par2" SessionField="man" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatColumns="3" RepeatDirection="Horizontal" Style="position: relative">
                <ItemTemplate>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" Style="position: relative"
                        Text='<%# Eval("Name") %>' OnClick="LinkButton2_Click1"></asp:LinkButton><br />
                    MRP Rs. :
                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>'></asp:Label><br />
                    &nbsp;<br />
                    <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# "~\img\"+Eval("Image") %>'
                        Style="position: relative" Width="150px" /><br />
                </ItemTemplate>
            </asp:DataList>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT Product.Name, Product.Amount, Product.Image FROM cat INNER JOIN Trans ON cat.cat_id = Trans.catid INNER JOIN Product ON Trans.id = Product.tranid WHERE (cat.Name = @par1)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="Split AC" Name="par1" SessionField="cat" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" RepeatColumns="3" RepeatDirection="Horizontal" Style="position: relative">
                <ItemTemplate>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"
                        Style="position: relative" Text='<%# Eval("Name") %>'></asp:LinkButton><br />
                    MRP Rs.:
                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>'></asp:Label><br />
                    &nbsp;<asp:Image ID="Image2" runat="server" Height="150px" ImageUrl='<%# "~\img\"+Eval("Image") %>'
                        Style="position: relative; top: 0px" Width="150px" /><br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Man.Name FROM Trans INNER JOIN cat ON Trans.catid = cat.cat_id INNER JOIN Man ON Trans.manid = Man.id WHERE (cat.Name = @par)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="Split AC" Name="par" SessionField="cat" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Style="position: relative">
        <ItemTemplate>
            &nbsp;<br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Style="position: relative"
                Text='<%# Eval("Name") %>'></asp:LinkButton><br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>


