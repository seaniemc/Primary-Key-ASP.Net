<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../styles/menu.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container">
    
    <!--::::::::::::::::::::::::::::PAGE CONTENT HERE:::::::::::::::::::::::::::::::-->

    <h3>Menu</h3>

    <div id="menu">

        <div id="sides">

            <asp:Label ID="Label1" runat="server" Text="Choose sides for menu:&nbsp;&nbsp;&nbsp;&nbsp;"></asp:Label>

            <asp:DropDownList ID="ddlSides" runat="server" DataSourceID="sdsSides" 
                DataTextField="name" DataValueField="id"
                
                style="width: 150px; height: 30px; color: #303030; font-size: 14px; padding: 5px;" 
                AutoPostBack="True">
            </asp:DropDownList>

        </div>

        <div id="mealList">
            <asp:GridView ID="gvMeals" runat="server" AutoGenerateColumns="False" 
                DataSourceID="sdsMeals" DataKeyNames="mealid" 
                onselectedindexchanged="gvMeals_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name" >
                    <ItemStyle CssClass="mFields" Font-Names="Calibri" Font-Size="Smaller" />
                    </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="DESCRIPTION" 
                        SortExpression="description" >
                    <ItemStyle CssClass="mFields" Font-Names="Calibri" Font-Size="Smaller" />
                    </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="PRICE" 
                        SortExpression="price" DataFormatString="{0:c}" >
                    <ItemStyle CssClass="mFields" Font-Names="Calibri" Font-Size="Small" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="QTY">
                        <ItemTemplate>
                            <asp:TextBox ID="tbxQty" runat="server" BorderColor="Gray" CssClass="tbxQty" 
                                Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#333333" 
                                Width="50px">1</asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvQty" runat="server" 
                                ControlToValidate="tbxQty" ErrorMessage="Must be populated." ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvQty" runat="server" ControlToValidate="tbxQty" 
                                ErrorMessage="Choose the number of ortion." ForeColor="Red" 
                                Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                        </ItemTemplate>
                        <ItemStyle CssClass="mFields" />
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                    <ItemStyle CssClass="mFields" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
        </div>

        <!--:::::::::::::::::: VALIDATION CONTROL :::::::::::::::::-->
        <div id="validationControl">
            <asp:Label ID="lbInteger" runat="server"
                Text="You mast enter a number for quantity." Visible="False" ForeColor="Red"></asp:Label><br />
            <asp:Label ID="lbEmpty"
                runat="server"
                Text="There is no quantity for selected item." Visible="False" ForeColor="Red"></asp:Label><br />
            <asp:Label ID="lbNull"
                runat="server"
                Text="There is no quantity for selected item." Visible="False" ForeColor="Red">
            </asp:Label>
            

            

        </div>

        <!--:::::::::::::::::: MAKE ORDER BUTTON ::::::::::::::::::-->
        <div id="divBtnOrder">
            <asp:Button ID="btnMakeOrder" runat="server" Text="ORDER" CssClass="btnOrder" 
            onclick="btnMakeOrder_Click" />
        </div>
    </div>


</div>

    <asp:SqlDataSource ID="sdsSides" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        SelectCommand="SELECT * FROM [sides]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsMeals" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        SelectCommand="SELECT * FROM [meals] WHERE ([sideid] = @sideid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSides" DefaultValue="701" Name="sideid" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsOrder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        InsertCommand="INSERT INTO [order] (userid, price) VALUES (@userid, @price)" 
        SelectCommand="SELECT MAX(orderid) FROM [order]">
        <InsertParameters>
            <asp:Parameter Name="userid" />
            <asp:Parameter Name="price" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsOrderlist" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        InsertCommand="INSERT INTO orderlist(orderid, mealid, qty) VALUES (@orderid, @mealid, @qty)" 
        SelectCommand="SELECT id, orderid, mealid, qty FROM orderlist WHERE (orderid = @orderid)">
        <InsertParameters>
            <asp:Parameter Name="orderid" />
            <asp:Parameter Name="mealid" />
            <asp:Parameter Name="qty" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="orderid" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

