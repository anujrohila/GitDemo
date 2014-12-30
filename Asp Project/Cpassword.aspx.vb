Imports System.Data.SqlClient
Partial Class Cpassword
    Inherits System.Web.UI.Page

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        con.Open()
        Dim cmd As New SqlCommand("select password from login_us where username='" & User.Identity.Name & "'", con)
        Dim pwd As String
        pwd = cmd.ExecuteScalar
        If pwd <> TextBox1.Text Then
            MsgBox("Please Enter Correct Password...........")
        Else
            cmd.CommandText = "update login_us set password='" & TextBox2.Text & "' where username='" & User.Identity.Name & "'"
            cmd.ExecuteNonQuery()
            con.Close()
            MsgBox("Your Password Changed Successfully", MsgBoxStyle.OkOnly, "Success")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("t") <> "u" Then
            MsgBox("You Need To Login To Change Your Password", MsgBoxStyle.OkOnly, "Sorry !")
            Response.Redirect("Home.aspx")
        End If
    End Sub
End Class
