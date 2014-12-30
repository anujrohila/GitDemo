Imports System.Data.SqlClient
Partial Class Description
    Inherits System.Web.UI.Page

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        add()
        Response.Redirect("Shopingcart.aspx")
    End Sub
    Sub add()
        Dim con1 As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        con1.Open()
        Dim cmd1 As New SqlCommand("Select * from tempShoping where Product_Name='" & Session("pname") & "' And sid='" & Session.SessionID & "'", con1)
        Dim da1 As New SqlDataAdapter(cmd1)
        Dim ds1 As New Data.DataSet
        da1.Fill(ds1)
        If ds1.Tables(0).Rows.Count = 1 Then
            MsgBox("The Item Is Already Present In The Shoping Cart.... You Can Only Change It's Quantity But You Can Not Add It Twice", MsgBoxStyle.OkOnly, "Sorry!")
            con1.Close()
            Response.Redirect("Home.aspx")
        Else
            Dim id, price, qty, i As Integer
            Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            con.Open()
            Dim cmd As New SqlCommand("Select * from tempShoping", con)
            Dim da As New SqlDataAdapter(cmd)
            Dim ds As New Data.DataSet
            da.Fill(ds)
            i = ds.Tables(0).Rows.Count
            If i = 0 Then
                id = 1
            Else
                cmd.CommandText = ("select max(id) from tempShoping")
                cmd.Connection = con
                id = cmd.ExecuteScalar + 1
            End If
            cmd.CommandText = "select Amount from Product where Name='" & Session("pname") & "'"
            price = cmd.ExecuteScalar
            qty = CInt(TextBox1.Text)
            cmd.CommandText = "insert into tempShoping values('" & Session("pname") & "'," & qty & "," & price & "," & (qty * price) & "," & id & ",'" & Session.SessionID & "')"
            cmd.ExecuteNonQuery()
            con.Close()
        End If
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("Shopingcart.aspx")
    End Sub
End Class
