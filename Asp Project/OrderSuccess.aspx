<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="OrderSuccess.aspx.vb" Inherits="OrderSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="center_title_bar" id="DIV1">Order Success</div>
    <div class="prod_box" style="width: 536px; height: 304px; position: relative;">
        <div class="bottom_prod_box" style="width: 520px; position: relative; height: 200px">
            <h1 style="color: green">Congratulation!
            </h1>
            <h2>Your order place successfully.</h2>
            <h2>Thanks for purchasing your products will be delivered in 7 days</h2>
            <h2>Your order no is :<asp:Label ID="lblOrderNo" runat="server" Text=""></asp:Label></h2>
            <h2>Amount will be taken as cash on delivery.</h2>
            <h2>Buy more product from us and get benift.</h2>
        </div>
    </div>
</asp:Content>

