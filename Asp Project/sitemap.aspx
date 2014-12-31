<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="sitemap.aspx.vb" Inherits="sitemap" Title="Untitled Page" %>

<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="center_title_bar" id="DIV1">Sitemap</div>
    <div class="prod_box" style="width: 536px; height: 304px; position: relative;">
        <div class="bottom_prod_box" style="width: 520px; position: relative; height: 200px">
            <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
            <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ImageSet="Arrows"
                Style="position: relative">
                <ParentNodeStyle Font-Bold="False" />
                <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px"
                    VerticalPadding="0px" />
                <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
                    NodeSpacing="0px" VerticalPadding="0px" />
            </asp:TreeView>
        </div>
    </div>
</asp:Content>
