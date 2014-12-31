Imports System.Data.SqlClient
Partial Class Shopingcart
    Inherits System.Web.UI.Page
    Shared row As Integer

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridView1.RowDeleted
        Response.Redirect("Shopingcart.aspx")
    End Sub
    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        row = e.NewEditIndex
    End Sub

    Protected Sub ImageButton3_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim price As New Label
        Dim tot As New Label
        Dim qty As New TextBox
        price = GridView1.Rows(row).FindControl("Label2")
        qty = GridView1.Rows(row).FindControl("Textbox1")
        tot = GridView1.Rows(row).FindControl("Label3")
        tot.Text = price.Text * qty.Text
        tot1()
    End Sub

    Protected Sub ImageButton5_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton5.Click
        Response.Redirect("Home.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        con.Open()
        Dim cmd As New SqlCommand("select * from tempShoping where sid='" & Session("sid") & "'", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New Data.DataSet
        da.Fill(ds)
        If ds.Tables(0).Rows.Count = 0 Then
            MultiView1.ActiveViewIndex = 1
        Else
            tot1()
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub


    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton6.Click
        Response.Redirect("Home.aspx")
    End Sub

    Protected Sub ImageButton7_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton7.Click
        If GridView1.Rows.Count = 0 Then
            Response.Redirect("Shopingcart.aspx")
        Else
            If User.Identity.Name = "" Then
                Response.Redirect("login.aspx")
            Else
                Response.Redirect("shiping.aspx")
            End If
        End If

    End Sub

    Sub tot1()
        Dim con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        con.Open()
        Dim cmd As New SqlCommand("select sum(Total) from tempShoping where sid='" & Session.SessionID & "'", con)
        Session("tot") = cmd.ExecuteScalar
        Label7.Text = Session("tot")
        con.Close()
    End Sub
    
    Protected Sub GridView1_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
        tot1()
    End Sub
End Class
