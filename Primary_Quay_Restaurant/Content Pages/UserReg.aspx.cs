using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class UserReg : System.Web.UI.Page
{

    private string useremail;
    private string txt;

    protected void Page_Load(object sender, EventArgs e)
    {
        //ddlCounty.SelectedIndex = -1;
        useremail = "";
        txt = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        int id;

        if (IsValid)
        {

            // insert into users
            dsUser.InsertParameters["name"].DefaultValue = txbName.Text;
            dsUser.InsertParameters["age"].DefaultValue = txbAge.Text;
            dsUser.InsertParameters["email"].DefaultValue = txbEmail.Text;
            dsUser.InsertParameters["phone"].DefaultValue = txbPhone.Text;
            dsUser.InsertParameters["street1"].DefaultValue = txbStreet1.Text;
            dsUser.InsertParameters["street2"].DefaultValue = txbStreet2.Text;
            dsUser.InsertParameters["city"].DefaultValue = txbCity.Text;
            dsUser.InsertParameters["county"].DefaultValue = ddlCounty.SelectedValue;

            dsLogin.InsertParameters["username"].DefaultValue = txbUsername.Text;
            dsLogin.InsertParameters["password"].DefaultValue = txbPass.Text;

            try
            {

                dsUser.Insert();

                // retriev id
                DataView dv = (DataView)dsUser.Select(new DataSourceSelectArguments());
                id = (int)dv.Table.Rows[0][0];
                lblError.Text = "id = " + id + "\nCounty id = " + ddlCounty.SelectedValue;
                
                // insert into login
                dsLogin.InsertParameters["userid"].DefaultValue = Convert.ToString(id);
                dsLogin.Insert();

                // clear fields
                txbName.Text = "";
                txbAge.Text = "";
                txbEmail.Text = "";
                txbPhone.Text = "";
                txbStreet1.Text = "";
                txbStreet2.Text = "";
                txbCity.Text = "";
                ddlCounty.SelectedIndex = 0;
                txbUsername.Text = "";
                txbPass.Text = "";
                txbPass2.Text = "";

            }
            catch (Exception ex)
            {
                lblError.Text = "A database error has occured. <br />"
                    + "Message: " + ex.Message;
            }
        }
    }
}