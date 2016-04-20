<%@ Page Theme="Default" Title="Admin Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Content_Pages_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../styles/Admin.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2>Administrator Page</h2>

    <table class="style4">
        <tr>
            <td class="style3">
        <asp:GridView ID="gbwCustomers" runat="server" AllowPaging="True" 
            DataSourceID="dsRegisteredCustomers" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="id" CellPadding="5" ForeColor="#333333" 
                    GridLines="Both" >
            <AlternatingRowStyle BackColor="White" />
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
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#4C4C4C" Font-Bold="True" ForeColor="#FFFFFF" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
            </td>
            <td class="style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <br />
                <asp:DetailsView ID="dvwCustomerDetails" runat="server" 
                    DataSourceID="dsRegisteredCustomersDetails" Height="50px" 
                    onitemdeleted="dvwCustomerDetails_ItemDeleted" 
                    oniteminserted="dvwCustomerDetails_ItemInserted" 
                    onitemupdated="dvwCustomerDetails_ItemUpdated"
                    Width="140px" AutoGenerateRows="False" DataKeyNames="id" 
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
                    CellSpacing="2" ForeColor="Black" AllowPaging="True">
                    <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
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
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                </asp:DetailsView>
                <br />
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
            </td>
        </tr>
    </table>
        <asp:SqlDataSource ID="dsRegisteredCustomers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
            SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRegisteredCustomersDetails" runat="server" 
            ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
            
        SelectCommand="SELECT id, name, age, email, phone, street1, street2, city, countyid, isadmin FROM users WHERE (id = @id)" 
        DeleteCommand="DELETE FROM [users] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [users] ([name], [age], [email], [phone], [street1], [street2], [city], [countyid], [isadmin]) VALUES (@name, @age, @email, @phone, @street1, @street2, @city, @countyid, @isadmin)" 
        UpdateCommand="UPDATE [users] SET [name] = @name, [age] = @age, [email] = @email, [phone] = @phone, [street1] = @street1, [street2] = @street2, [city] = @city, [countyid] = @countyid, [isadmin] = @isadmin WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="phone" Type="Int64" />
                <asp:Parameter Name="street1" Type="String" />
                <asp:Parameter Name="street2" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="countyid" Type="Int32" />
                <asp:Parameter Name="isadmin" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gbwCustomers" Name="id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="phone" Type="Int64" />
                <asp:Parameter Name="street1" Type="String" />
                <asp:Parameter Name="street2" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="countyid" Type="Int32" />
                <asp:Parameter Name="isadmin" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
    </asp:SqlDataSource>
            <br />
</asp:Content>