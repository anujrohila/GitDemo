Imports System.Data.SqlClient
Partial Class productadmin
    Inherits System.Web.UI.Page
    Shared row As Integer
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub ImageButton3_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton3.Click
        Try
            If TextBox1.Text <> "" And TextBox2.Text <> "" And FileUpload2.HasFile = True Then
                Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
                Dim row, tid, pid As Integer
                con.Open()
                Dim cmd As New SqlCommand("Select id from Trans Where catid=" & Catagory.SelectedValue & " And manid=" & Manufacturer.SelectedValue & "", con)
                Dim da As New SqlDataAdapter(cmd)
                Dim ds As New Data.DataSet
                da.Fill(ds)
                row = ds.Tables(0).Rows.Count
                If row = 1 Then
                    tid = cmd.ExecuteScalar
                Else
                    cmd.CommandText = "select max(id) from Trans"
                    tid = cmd.ExecuteScalar + 1
                    cmd.CommandText = "insert into Trans values(" & tid & "," & Catagory.SelectedValue & "," & Manufacturer.SelectedValue & ")"
                    cmd.ExecuteNonQuery()
                End If
                cmd.CommandText = "select max(id) from Product"
                pid = cmd.ExecuteScalar + 1
                cmd.CommandText = "insert into product values(" & pid & ",'" & TextBox1.Text & "'," & CInt(TextBox2.Text) & ",'" & FileUpload2.FileName & "'," & tid & ")"
                cmd.ExecuteNonQuery()
                FileUpload2.SaveAs(Server.MapPath("img") & "\" & FileUpload2.FileName)
                cmd.CommandText = "insert into descr values(" & pid & ",'" & TextBox3.Text & "')"
                cmd.ExecuteNonQuery()
                con.Close()
                Response.Redirect("productadmin.aspx")
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("t") <> "a" Then
            Response.Redirect("Home.aspx")
        End If
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        MultiView1.ActiveViewIndex = 2
    End Sub

End Class
