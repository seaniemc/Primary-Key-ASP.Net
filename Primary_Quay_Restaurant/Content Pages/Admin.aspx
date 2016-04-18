<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Content_Pages_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Admin</h1>
    <p>&nbsp;</p>
    <p>Registered Customers</p>
    <p>
        <asp:SqlDataSource ID="dsRegisteredCustomers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
            SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            DataSourceID="dsRegisteredCustomers" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="street1" HeaderText="street1" 
                    SortExpression="street1" />
                <asp:BoundField DataField="street2" HeaderText="street2" 
                    SortExpression="street2" />
                <asp:BoundField DataField="street2" HeaderText="street2" 
                    SortExpression="street2" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="countyid" HeaderText="countyid" 
                    SortExpression="countyid" />
                <asp:BoundField DataField="isadmin" HeaderText="isadmin" 
                    SortExpression="isadmin" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>