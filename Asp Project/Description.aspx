<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Description.aspx.vb" Inherits="Description" title="Untitled Page" %>
<%-- Add content controls here --%>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT Product.Name, Product.Amount, Product.Image, Descr.Notes FROM Descr INNER JOIN Product ON Descr.Id = Product.id WHERE (Product.Name = @par)">
        <SelectParameters>
            <asp:SessionParameter Name="par" SessionField="pname" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <table style="left: 427px; width: 328px; position: absolute; top: 393px; z-index: 100;">
        <tr>
            <td style="width: 296px" align="center">
    <asp:Label ID="Label1" runat="server" 
        Text="Enter Quantity :(Maximum 5)" Width="152px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 296px" align="center">
    <asp:TextBox ID="TextBox1" runat="server"  Width="24px" >1</asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 296px" align="center">
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/buttons/addtocart.png"
        /></td>
        </tr>
        <tr>
            <td style="width: 296px" align="center">
    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/buttons/button_preview.png" CausesValidation="False"
        /></td>
        </tr>
        <tr>
            <td style="width: 296px" align="center">
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1"
        ErrorMessage="Please Enter Value In Proper Number Format Or In Proper Range" MaximumValue="5" MinimumValue="1" Width="314px" SetFocusOnError="True"  ></asp:RangeValidator></td>
        </tr>
        <tr>
            <td style="width: 296px; height: 29px" align="center">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
        ErrorMessage="Quantity Requiered" Height="5px" SetFocusOnError="True"  ></asp:RequiredFieldValidator></td>
        </tr>
    </table>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Style="position: relative; z-index: 103; left: 2px; top: 0px;">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# "~\img\" + Eval("Image") %>'
                Style="position: relative" Width="200px" />&nbsp;<br />
            <br />
            &nbsp; 
            <asp:Label ID="Label2" runat="server" ForeColor="Green" Text="Product Name :"></asp:Label>
            &nbsp;
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label><br />
            <br />
            <br />
            &nbsp;<br />
            &nbsp;
            <asp:Label ID="Label3" runat="server" ForeColor="Green" Text="MRP Rs."></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>'></asp:Label><br />
            <br />
            <br />
            &nbsp;
            <asp:Label ID="Label4" runat="server" ForeColor="Green" Text="Description : "></asp:Label><br />
            <br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp;
            <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>'></asp:Label><br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp;&nbsp;
</asp:Content>
