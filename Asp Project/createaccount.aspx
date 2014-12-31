<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="createaccount.aspx.vb" Inherits="createaccount" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="center_title_bar" id="DIV1">Create Account</div>
    <div class="prod_box" style="width: 536px; height: 304px; position: relative;">
        <div class="bottom_prod_box" style="width: 520px; position: relative; height: 200px">
            <table>
                <tr>
                    <td style="width: 200px">
                        <asp:Label ID="Label1" runat="server" Text="User Name :"></asp:Label><span style="color: red">*</span>
                    </td>
                    <td style="width: 200px">
                        <asp:TextBox ID="txtUserName" runat="server" Width="148px" MaxLength="20"></asp:TextBox>

                    </td>
                    <td style="width: 150px">
                        <asp:Button ID="Button1" runat="server" Text="Check Availibility" OnClick="Button1_Click" ValidationGroup="CheckAvailablity" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblUserNameMessage" runat="server" Text=""></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="UserName is requiered." Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label><span style="color: red">*</span></td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="149px" MaxLength="20"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is requiered." Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Confirm Password :"></asp:Label><span style="color: red">*</span></td>
                    <td>
                        <asp:TextBox ID="txtconfirm" runat="server" TextMode="Password" Width="148px" MaxLength="20"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirm" ErrorMessage="Confirm password is requiered." Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password doesn't match." ControlToCompare="txtconfirm" ControlToValidate="txtPassword"></asp:CompareValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Name : "></asp:Label><span style="color: red">*</span></td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" TextMode="Password" Width="148px" MaxLength="20"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ErrorMessage="Name is requiered." Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Address : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Height="56px" TextMode="MultiLine" MaxLength="200"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Phone Number :"> </asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="20"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="E-mail"></asp:Label><span style="color: red">*</span></td>
                    <td>
                        <asp:TextBox ID="txtEmailAddress" runat="server" MaxLength="50"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="Email Address is requiered." Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="Please Enter Correct E-Mail Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                    <td></td>
                </tr>
                <tr style="height: 20px">
                    <td></td>
                    <td style="text-align: left"></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: left">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Left" Width="150px" ImageUrl="~/buttons/button_createaccount.png" />
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

