﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

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
                    <asp:BoundField DataField="mealid" HeaderText="Id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="mealid" Visible="False" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" >
                    </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="description" 
                        SortExpression="description" >
                    </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" 
                        DataFormatString="{0:c}" >
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:TextBox ID="tbxQty" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
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
</asp:Content>

