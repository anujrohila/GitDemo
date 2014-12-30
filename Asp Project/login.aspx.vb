Imports System.Data.SqlClient
Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Dim un, pw As String
        un = Login1.UserName
        pw = Login1.Password
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        con.Close()
        con.Open()
        Dim cmd As New SqlCommand("select * from login_us where username='" & un & "' AND password='" & pw & "'", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New Data.DataSet
        da.Fill(ds)
        If ds.Tables(0).Rows.Count = 1 Then
            e.Authenticated = True
            FormsAuthentication.RedirectFromLoginPage(un, False)
            Session("t") = "u"
            Response.Redirect("home.aspx")
        Else
            cmd.CommandText = "select * from login_ad where uname='" & un & "' AND password='" & pw & "'"
            da.SelectCommand = cmd
            ds.Tables.RemoveAt(0)
            da.Fill(ds)
            If ds.Tables(0).Rows.Count = 1 Then
                FormsAuthentication.RedirectFromLoginPage(un, False)
                e.Authenticated = True
                Session("t") = "a"
                Response.Redirect("homeadmin.aspx")
            End If
        End If
        e.Authenticated = False
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Response.Redirect("createaccount.aspx")
    End Sub
End Class
