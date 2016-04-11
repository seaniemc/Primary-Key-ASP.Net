using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu : System.Web.UI.Page
{

    private List<OrderList> orderlist;
    private OrderList order;
 
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvMeals_SelectedIndexChanged(object sender, EventArgs e)
    {
        order = new OrderList();
        try
        {
            TextBox tb = (TextBox)gvMeals.Rows[gvMeals.SelectedIndex].FindControl("tbxQty");
            order.mealid = Convert.ToInt32(gvMeals.SelectedValue);
            order.qty = Convert.ToInt32(tb.Text);

            orderlist.Add(order);
        }
        catch (ApplicationException ex)
        {
            return;
        }
    }
}