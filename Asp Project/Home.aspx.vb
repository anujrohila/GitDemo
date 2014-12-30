
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("pname") = sender.Text
        Response.Redirect("Description.aspx")
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("man") = sender.text
        Session("view") = "0"
        Response.Redirect("Home.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("View") = "0" Then
            MultiView1.ActiveViewIndex = 0
        End If
        If Session("View") = "1" Then
            MultiView1.ActiveViewIndex = 1
        End If
    End Sub

    Protected Sub LinkButton2_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("pname") = sender.Text
        Response.Redirect("Description.aspx")
    End Sub
End Class
