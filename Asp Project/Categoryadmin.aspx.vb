Imports System.Data.SqlClient
Partial Class Categoryadmin
    Inherits System.Web.UI.Page

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        MultiView1.ActiveViewIndex = 1

    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        MultiView1.ActiveViewIndex = 2
    End Sub

    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        If TextBox1.Text <> "" Then
            Dim i As Integer
            Dim cnn As SqlConnection
            Dim cmd As SqlCommand
            cnn = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            cnn.Open()
            cmd = New SqlCommand("Select Max(cat_id) from cat", cnn)
            i = cmd.ExecuteScalar + 1
            cmd.CommandText = "insert into cat values(" & i & ",'" & TextBox1.Text & "')"
            cmd.Connection = cnn
            cmd.ExecuteNonQuery()
            cnn.Close()
            TextBox1.Text = ""
            Response.Redirect("categoryadmin.aspx")
        Else
            MsgBox("Enter The Right Category")
        End If
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
