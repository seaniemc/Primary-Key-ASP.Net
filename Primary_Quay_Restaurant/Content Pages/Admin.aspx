<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Content_Pages_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3 {
            width: 881px;
        }
        .style4
        {
            width: 1016px;
        }
        .style5
        {
            width: 125px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Administrator Page</h2>
    <table class="style4">
        <tr>
            <td class="style3">
        <asp:GridView ID="dsCustomersGrid" runat="server" AllowPaging="True" 
            DataSourceID="dsRegisteredCustomers" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="id">
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
                <asp:BoundField DataField="city" HeaderText="city" 
                    SortExpression="city" />
                <asp:BoundField DataField="countyid" HeaderText="countyid" 
                    SortExpression="countyid" />
                <asp:BoundField DataField="isadmin" HeaderText="isadmin" 
                    SortExpression="isadmin" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
            </td>
            <td class="style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <br />
            </td>
            <p>&nbsp;</p>
            <td class="style5">
                &nbsp;</td>
        </tr>
    </table>
                <asp:DetailsView ID="dvwCustomerDetails" runat="server" 
                    DataSourceID="dsRegisteredCustomersDetails" Height="50px" 
        Width="140px" AutoGenerateRows="False" DataKeyNames="id">
                    <Fields>
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
                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                        <asp:BoundField DataField="countyid" HeaderText="countyid" 
                            SortExpression="countyid" />
                        <asp:BoundField DataField="isadmin" HeaderText="isadmin" 
                            SortExpression="isadmin" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                            ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
        <asp:SqlDataSource ID="dsRegisteredCustomers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
            SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRegisteredCustomersDetails" runat="server" 
            ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
            SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
            <br />
</asp:Content>