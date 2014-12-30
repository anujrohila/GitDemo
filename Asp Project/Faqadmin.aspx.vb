Imports System.Data.SqlClient
Partial Class Faqadmin
    Inherits System.Web.UI.Page

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        If TextBox1.Text <> "" And TextBox2.Text <> "" Then
            Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            con.Open()
            Dim cmd As New SqlCommand("select max(id) from FAQ", con)
            Dim id As Integer
            id = cmd.ExecuteScalar + 1
            cmd.CommandText = "insert into FAQ values(" & id & ",'" & TextBox1.Text & "','" & TextBox2.Text & "')"
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("Faqadmin.aspx")
        End If
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        MultiView1.ActiveViewIndex = 0

    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("t") <> "a" Then
            Response.Redirect("Home.aspx")
        End If
    End Sub
End Class
