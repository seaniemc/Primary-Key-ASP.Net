using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Order : System.Web.UI.Page
{

    private int userid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            // check if user is loged in
            string userId = getCookieUserId();
            if (userId != null)
            {
                userid = Convert.ToInt32(userId);
                doLogin.Visible = false;
                doOrder.Visible = true;
            }
            else
            {
                doLogin.Visible = true;
                doOrder.Visible = false;
            }
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserReg.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    private string getCookieUserId()
    {
        if (Request.Cookies["userid"] != null)
        {
            return Request.Cookies["userid"].Value;
        }
        else
        {
            return null;
        }
    }

    private void addCookie(string name, string value)
    {
        HttpCookie cookie = new HttpCookie(name, value);
        cookie.Expires = DateTime.Now.AddMinutes(5);
        Response.Cookies.Add(cookie);
    }

    private void deleteCookie(string name)
    {
        HttpCookie cookie = new HttpCookie(name);
        cookie.Expires = DateTime.Now.AddSeconds(-1);
        Response.Cookies.Add(cookie);
    }

    protected void btnMakeOrder_Click(object sender, EventArgs e)
    {
        // enter query params and create order record
        sdsMakeOrder.InsertParameters["userid"].DefaultValue = String.Format("{0}", userid);
        sdsMakeOrder.Insert();

        // retrieve id form order table
        DataView dv = (DataView)sdsOrder.Select(new DataSourceSelectArguments());
        int id = (int)dv.Table.Rows[0][0];
        addCookie("orderid", String.Format("{0}", id));
    }
}