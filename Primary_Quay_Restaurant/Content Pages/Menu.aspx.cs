using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu : System.Web.UI.Page
{

    public static List<OrderList> orderlist = new List<OrderList>();
    private OrderList order;
 
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    if (!(Request.Cookies["userid"] == null))
        //    {
        //        Response.Redirect("Home.aspx");
        //    }
        //}
    }
    protected void gvMeals_SelectedIndexChanged(object sender, EventArgs e)
    {
        order = new OrderList();
        try
        {
            TextBox tb = (TextBox)gvMeals.Rows[gvMeals.SelectedIndex].FindControl("tbxQty");
            if (isTextboxValid(tb))
            {
                order.mealid = Convert.ToInt32(gvMeals.SelectedValue);
                order.qty = Convert.ToInt32(tb.Text);
                string price = gvMeals.Rows[gvMeals.SelectedIndex].Cells[2].Text;
                order.price = Convert.ToDouble(gvMeals.Rows[gvMeals.SelectedIndex].Cells[2].Text);

                orderlist.Add(order);
                tb.Text = "1";
            }
        }
        catch (ApplicationException ex)
        {
            return;
        }
    }

    private bool isTextboxValid(TextBox tb)
    {
        if (tb.Text != null && tb.Text != "" && tb.Text.All(char.IsDigit))
        {
            lbNull.Visible = false;
            lbEmpty.Visible = false;
            lbInteger.Visible = false;

            return true;
        }
        else
        {
            if (tb.Text == null)
            {
                lbNull.Visible = true;
            }
            if (tb.Text == "")
            {
                lbEmpty.Visible = true;
            }
            if (!tb.Text.All(char.IsDigit))
            {
                lbInteger.Visible = true;
            }

            return false;
        }
    }

    protected void btnMakeOrder_Click(object sender, EventArgs e)
    {

        if (orderlist != null)
        {
            double totalPrice = 0;

            foreach (OrderList order in orderlist)
            {
                totalPrice += order.price;
            }

            // insert into users
            sdsOrder.InsertParameters["userid"].DefaultValue = Request.Cookies["userid"].Value;
            sdsOrder.InsertParameters["price"].DefaultValue = Convert.ToString(totalPrice);

            sdsOrder.Insert();

            orderlist.Clear();

        }
    }

    private void addCookie(string name, string value)
    {
        HttpCookie cookie = new HttpCookie(name, value);
        cookie.Expires = DateTime.Now.AddMinutes(5);
        Response.Cookies.Add(cookie);
    }
}