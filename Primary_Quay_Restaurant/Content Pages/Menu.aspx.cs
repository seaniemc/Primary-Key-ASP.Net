﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
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
                string formatedPrice = gvMeals.Rows[gvMeals.SelectedIndex].Cells[2].Text;
                if (formatedPrice.Contains("&#163;"))
                {
                    string[] price = formatedPrice.Split(';');
                    order.price = Convert.ToDouble(price[1]);
                }

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

            addCookie("userid", "1001");

            // insert into users
            sdsOrder.InsertParameters["userid"].DefaultValue = Request.Cookies["userid"].Value;
            sdsOrder.InsertParameters["price"].DefaultValue = Convert.ToString(totalPrice);

            sdsOrder.Insert();

            // retrieve id form order table
            DataView dv = (DataView)sdsOrder.Select(new DataSourceSelectArguments());
            int id = (int)dv.Table.Rows[0][0];
            addCookie("orderid", String.Format("{0}", id));

            // populate orderlist database;
            foreach (OrderList order in orderlist)
            {
                sdsOrderlist.InsertParameters["orderid"].DefaultValue = String.Format("{0}", id);
                sdsOrderlist.InsertParameters["mealid"].DefaultValue = String.Format("{0}", order.mealid);
                sdsOrderlist.InsertParameters["qty"].DefaultValue = String.Format("{0}", order.qty);

                sdsOrderlist.Insert();
            }

            // empty List
            orderlist.Clear();

            // delete cookie
            deleteCookie("userid");

            // redirect into order page
            Response.Redirect("Order.aspx");
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
}