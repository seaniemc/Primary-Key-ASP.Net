using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class UserReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ddlCounty.SelectedIndex = -1;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            SqlConnection connection = new SqlConnection("primary_quey_restourantConnectionString");

            string query = "INSERT INTO users " +
                "(name, age, email, phone, street1, street2, city, countyid)" +
                "VALUES " +
                "(@name, @age, @email, @phone, @street1, @street2, @city, @countyid)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.Add("@name", txbName.Text);
            command.Parameters.Add("@age", Convert.ToInt16(txbAge.Text));
            command.Parameters.Add("@email", txbEmail.Text);
            command.Parameters.Add("@phone", Convert.ToInt32(txbPhone.Text));
            command.Parameters.Add("@street1", txbStreet1.Text);
            command.Parameters.Add("@street2", txbStreet2.Text);
            command.Parameters.Add("@city", txbCity.Text);
            command.Parameters.Add("@countyid", Convert.ToInt16(ddlCounty.SelectedValue));

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }
    }
}