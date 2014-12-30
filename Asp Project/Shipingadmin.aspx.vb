
Partial Class Shipingadmin
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Dim lid As New Label
        lid = GridView1.SelectedRow.FindControl("Label1")
        Session("ord") = lid.Text
        Response.Redirect("orderadmin.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("t") <> "a" Then
            Response.Redirect("Home.aspx")
        End If
    End Sub
End Class
