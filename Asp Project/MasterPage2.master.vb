
Partial Class MasterPage2
    Inherits System.Web.UI.MasterPage

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("cat") = sender.text
        Session("view") = "1"
        Response.Redirect("Home.aspx")
    End Sub

    Protected Sub LinkButton1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Response.Redirect("Cpassword.aspx")
    End Sub
End Class

