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
        Dim cmd As New SqlCommand("select * from login_us where username='" & txtUserName.Text & "'", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New Data.DataSet
        da.Fill(ds)
        a = ds.Tables(0).Rows.Count
        cmd.CommandText = "select * from login_ad where uname='" & txtUserName.Text & "'"
        Dim da2 As New SqlDataAdapter(cmd)
        ds.Tables.RemoveAt(0)
        da2.Fill(ds)
        b = ds.Tables(0).Rows.Count
        If a = 0 And b = 0 Then
            lblUserNameMessage.Text = "User name " + txtUserName.Text + " is available"
            lblUserNameMessage.ForeColor = Drawing.Color.Green
        Else
            lblUserNameMessage.Text = "User name " + txtUserName.Text + " is not available"
            lblUserNameMessage.ForeColor = Drawing.Color.Red
        End If
        con.Close()
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        available()
        If lblUserNameMessage.ForeColor = Drawing.Color.Green And txtconfirm.Text = txtPassword.Text Then
            'Label9.Text = ""
            insert()
            'MsgBox("Successfully Create Account........Press Ok To Redirect On The Home Page")
            Response.Redirect("RegisterSuccess.aspx")
        Else
            If txtconfirm.Text <> txtPassword.Text Then
                'Label9.ForeColor = Drawing.Color.Red
                'Label9.Text = "Sorry password doesn't match"
                txtconfirm.Text = ""
                txtPassword.Text = ""
            End If
        End If
    End Sub
    Sub insert()
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        con.Open()
        Dim cmd As New SqlCommand("", con)
        cmd.CommandText = "insert into login_us values('" & txtUserName.Text & "','" & txtPassword.Text & "','" & txtName.Text & "','" & txtAddress.Text & "','" & txtPhoneNo.Text & "','" & txtEmailAddress.Text & "')"
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class
