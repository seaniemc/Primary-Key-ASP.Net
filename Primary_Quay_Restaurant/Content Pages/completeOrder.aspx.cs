using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_Pages_completeOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string name = HttpContext.Current.Session["Username"].ToString();
        lblName.Text = name;
        lblPrice.Text = String.Format("{0}", ViewState["totalPrice"]);
    }
    protected void btnHomePage_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}