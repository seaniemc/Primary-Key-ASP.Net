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
        lblPrice.Text = String.Format("{0:c}", Request.Cookies["totalPrice"].Value);
    }
    protected void btnHomePage_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
        deleteCookie("totalPrice");
        deleteCookie("userid");

    }


    private void deleteCookie(string name)
    {
        HttpCookie cookie = new HttpCookie(name);
        cookie.Expires = DateTime.Now.AddSeconds(-1);
        Response.Cookies.Add(cookie);
    }
}