
Partial Class logoutpage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("t") = ""
        Response.Redirect("Home.aspx")
    End Sub
End Class
