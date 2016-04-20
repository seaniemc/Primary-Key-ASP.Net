<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../styles/order.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="container">
        
        <!--::::::::::::::::::::::::::::PAGE CONTENT HERE:::::::::::::::::::::::::::::::-->

        <h3>Make an order.</h3>

        <div id="orderSection">
            
            <div runat="server" id="doLogin" class="doLogin">
                <p>To make an order you must be registered user. If you already registered you need to be loged in.</p>
                <asp:Button ID="btnRegister" runat="server" Text="Register" 
                    onclick="btnRegister_Click" Width="100px" />
                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                    onclick="btnLogin_Click" Width="100px" />
            </div>

            <div runat="server" id="doOrder" class="doOrder">
                <p>After clicking the button "Make order" you will be redirected to the menu page, where you can pic
                our delicious meal. Enjoy.</p>
                <asp:Button ID="btnMakeOrder" runat="server" Text="Make order" 
                    onclick="btnMakeOrder_Click" />
            </div>

        </div>
    
    </div>
    <asp:SqlDataSource ID="sdsOrder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        DeleteCommand="DELETE FROM orderlist WHERE (id = @id)" 
        SelectCommand="SELECT orderlist.id, meals.name, orderlist.qty, meals.price FROM orderlist INNER JOIN meals ON orderlist.mealid = meals.mealid WHERE (orderlist.orderid = @orderid)" 
        UpdateCommand="UPDATE orderlist SET qty = @qty WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <SelectParameters>
            <asp:CookieParameter CookieName="orderid" Name="orderid" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="qty" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsMakeOrder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        InsertCommand="INSERT INTO [order] (userid) VALUES (@userid)" 
        SelectCommand="SELECT MAX(orderid) FROM [order]">
        <InsertParameters>
            <asp:Parameter Name="userid" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

