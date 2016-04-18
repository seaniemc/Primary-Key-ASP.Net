using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Content_Pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["userid"] == null && Request.Cookies["username"] == null)
            {
                loginSection.Visible = true;
                logedin.Visible = false;
            }
            else
            {
                lblUser.Text = "Hello " + Request.Cookies["username"].Value + ", press Logout button if you want to be loged out.";
                loginSection.Visible = false;
                logedin.Visible = true;
            }
        }
        errorMsg.Visible = false;
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserReg.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        int count = 0;
        bool match = false;

        if(IsValid){

            DataView dv = (DataView)sdsLogin.Select(new DataSourceSelectArguments());
            DataTable table = dv.Table;

            for (int i = 0; i < table.Rows.Count; i++)
            {
                int userid = (int)table.Rows[i][0];
                string username = String.Format("{0}", table.Rows[i][1]);
                string password = String.Format("{0}", table.Rows[i][2]);

                if (username.Equals(tbxUsername.Text, StringComparison.OrdinalIgnoreCase))
                {
                    if (password.Equals(txbPassword.Text, StringComparison.Ordinal))
                    {
                        match = true;
                        addCookie("userid", String.Format("{0}", userid));
                        addCookie("username", username);
                        lblUser.Text = "Hello " + username + ", press Logout button if you want to be loged out.";
                        loginSection.Visible = false;
                        logedin.Visible = true;
                        return;
                    }
                    else
                    {
                        count++;
                    }
                }
                else
                {
                    count++;
                }
            }

            if (count == table.Rows.Count && match == false)
            {
                errorMsg.Visible = true;
            }
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

    protected void btnLogof_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["userid"] != null && Request.Cookies["username"] != null)
        {
            deleteCookie("userid");
            deleteCookie("username");
            Response.Redirect("Home.aspx");
        }
    }
}