<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="center_title_bar" id="DIV1">Products List</div>
    <div class="prod_box" style="width: 536px; height: 304px; position: relative;">
        <div class="bottom_prod_box" style="width: 520px; position: relative; height: 200px">
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
                            <table style="width: 100%">
                                <tr>
                                    <td style="text-align: center">
                                        <asp:Image ID="Image1" runat="server" Height="120px" Width="150px" ImageUrl='<%# "~\img\"+Eval("Image") %>' Style="position: relative" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">
                                        <asp:LinkButton ID="LinkButton2" runat="server" Style="position: relative" Text='<%# Eval("Name") %>' OnClick="LinkButton2_Click1"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">Price(Rs):
                                <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
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
                            <table style="width: 100%">
                                <tr>
                                    <td style="text-align: center">
                                        <asp:Image ID="Image2" runat="server" Height="120px" Width="150px" ImageUrl='<%# "~\img\"+Eval("Image") %>' Style="position: relative; top: 0px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">
                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Style="position: relative" Text='<%# Eval("Name") %>'></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">Price(Rs):
                                <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="title_box">Manufacturers</div>
    <div style="z-index: 101; left: 0px; width: 184px; position: relative; top: -13px; height: 336px">
        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Man.Name FROM Trans INNER JOIN cat ON Trans.catid = cat.cat_id INNER JOIN Man ON Trans.manid = Man.id WHERE (cat.Name = @par)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="Split AC" Name="par" SessionField="cat" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Style="position: relative">
            <ItemTemplate>
                <div style="padding: 5px; background-color: #dad0d0; width: 185px">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Style="position: relative"
                        Text='<%# Eval("Name") %>'></asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>


