
Partial Class OrderSuccess
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.QueryString("oid") <> "" Then
            lblOrderNo.Text = Request.QueryString("oid").ToString()
        End If
    End Sub
End Class
