Imports System.Data.SqlClient
Partial Class shiping
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Dim id As Integer
        If TextBox1.Text <> "" And TextBox1.Text <> "" Then
            Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            con.Open()
            Dim cmd As New SqlCommand("select * from Shiping", con)
            Dim da As New SqlDataAdapter(cmd)
            Dim ds As New Data.DataSet
            da.Fill(ds)
            id = ds.Tables(0).Rows.Count
            If id = 0 Then
                id = 1
            Else
                cmd.CommandText = "select max(id) from Shiping"
                id = cmd.ExecuteScalar + 1
            End If
            cmd.CommandText = "insert into Shiping values(" & id & ",'" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & Date.Now & "'," & Session("tot") & ",'" & User.Identity.Name & "')"
            cmd.ExecuteNonQuery()
            ds.Tables.RemoveAt(0)
            cmd.CommandText = "select * from tempShoping where sid='" & Session.SessionID & "'"
            Dim da1 As New SqlDataAdapter(cmd)
            da1.Fill(ds)
            Dim i As Integer
            For i = 0 To ds.Tables(0).Rows.Count - 1
                Try
                    Dim pn, qty, amt, tot As String
                    pn = ds.Tables(0).Rows(i)(0)
                    qty = ds.Tables(0).Rows(i)(1)
                    amt = ds.Tables(0).Rows(i)(2)
                    tot = ds.Tables(0).Rows(i)(3)
                    cmd.CommandText = "insert into custord values(" & id & ",'" & pn & "','" & amt & "','" & qty & "','" & tot & "')"
                    cmd.ExecuteNonQuery()
                Catch ex As Exception
                    MsgBox(ex.ToString)
                End Try
            Next
            MsgBox("Thanks for purchasing your products will be delivered in 7 days", MsgBoxStyle.OkOnly, "Thank You")
            cmd.CommandText = "delete from tempShoping where sid='" & Session.SessionID & "'"
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("Paypal.htm")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("t") <> "u" Then
            MsgBox("Sorry You Cannot View This Page !!!!!!!")
            Response.Redirect("Home.aspx")
        Else
            If User.Identity.Name = "" Then
                MsgBox("You Need To Login For The Shipping Process")
                Response.Redirect("Home.aspx")
            Else
                Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
                con.Open()
                Dim cmd As New SqlCommand("Select * from tempShoping where sid='" & Session.SessionID & "'", con)
                Dim da As New SqlDataAdapter(cmd)
                Dim ds As New Data.DataSet
                da.Fill(ds)
                If ds.Tables(0).Rows.Count = 0 Then
                    MsgBox("You Need To Add Products On The Shoping Cart")
                    Response.Redirect("Home.aspx")
                End If
            End If
        End If

    End Sub
End Class
