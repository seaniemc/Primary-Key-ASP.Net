using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int isAdmin = 0;
        if (getCookieIsAdmin() != null)
        {
            isAdmin = Convert.ToInt32(getCookieIsAdmin());
            if (isAdmin == 0)
            {
                admin.Visible = false;
            }
            else
            {
                admin.Visible = true;
            }
        }
        else
        {
            admin.Visible = false;
        }

        if (HttpContext.Current.Request.Cookies["userid"] != null)
        {
            logoff.Visible = true;
        }
        else
            logoff.Visible = false;
    }
    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }

    private string getCookieIsAdmin()
    {
        if (Request.Cookies["isadmin"] != null)
        {
            return Request.Cookies["isadmin"].Value;
        }
        else
        {
            return null;
        }
    }
    protected void btnLogoff_Click(object sender, EventArgs e)
    {
        deleteCookie("userid");
        deleteCookie("username");
        deleteCookie("isadmin");
        admin.Visible = false;
        logoff.Visible = false;
    }

    private bool isCookieExist(string name)
    {
        if (HttpContext.Current.Request.Cookies[name] != null)
            return true;
        else
            return false;
    }


    private void deleteCookie(string name)
    {
        if (HttpContext.Current.Request.Cookies[name] != null)
        {
            HttpCookie cookie = new HttpCookie(name);
            cookie.Expires = DateTime.Now.AddSeconds(-1);
            Response.Cookies.Add(cookie);
        }
    }
}
