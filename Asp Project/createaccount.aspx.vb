Imports System.Data.SqlClient
Partial Class createaccount
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection("")
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        available()
    End Sub
    Sub available()
        Dim a, b As Integer
        a = 0
        b = 0
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        con.Open()
        Dim cmd As New SqlCommand("select * from login_us where username='" & TextBox1.Text & "'", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New Data.DataSet
        da.Fill(ds)
        a = ds.Tables(0).Rows.Count
        cmd.CommandText = "select * from login_ad where uname='" & TextBox1.Text & "'"
        Dim da2 As New SqlDataAdapter(cmd)
        ds.Tables.RemoveAt(0)
        da2.Fill(ds)
        b = ds.Tables(0).Rows.Count
        If a = 0 And b = 0 Then
            Label8.Text = "User name " + TextBox1.Text + " is available"
            Label8.ForeColor = Drawing.Color.Green
        Else
            Label8.Text = "User name " + TextBox1.Text + " is not available"
            TextBox1.Text = ""
            Label8.ForeColor = Drawing.Color.Red
        End If
        con.Close()
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        available()
        If Label8.ForeColor = Drawing.Color.Green And txtconfirm.Text = txtpass.Text Then
            Label9.Text = ""
            insert()
            MsgBox("Successfully Create Account........Press Ok To Redirect On The Home Page")
            Response.Redirect("Home.aspx")
        Else
            If txtconfirm.Text <> txtpass.Text Then
                Label9.ForeColor = Drawing.Color.Red
                Label9.Text = "Sorry password doesn't match"
                txtconfirm.Text = ""
                txtpass.Text = ""
            End If
        End If
    End Sub
    Sub insert()
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        con.Open()
        Dim cmd As New SqlCommand("", con)
        cmd.CommandText = "insert into login_us values('" & TextBox1.Text & "','" & txtpass.Text & "','" & TextBox4.Text & "','" & TextBox5.Text & "','" & TextBox6.Text & "','" & TextBox7.Text & "')"
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class
