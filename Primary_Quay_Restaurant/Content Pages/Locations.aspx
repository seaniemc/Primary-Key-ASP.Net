<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Locations.aspx.cs" Inherits="Locations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 style="font-family: Arial; text-align: center;">
        Available Locations Nationwide</h2>
    <p>
        <asp:SqlDataSource ID="dsLocations" runat="server" 
            ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
            SelectCommand="SELECT [county] FROM [countys]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:ListView ID="lvwLocations" runat="server" DataSourceID="dsLocations" 
            GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775; text-align: center;">
                    
                    <asp:Label ID="countyLabel" runat="server" Text='<%# Eval("county") %>' />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">
                    
                    <asp:TextBox ID="countyTextBox" runat="server" Text='<%# Bind("county") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">
                    
                    <asp:TextBox ID="countyTextBox" runat="server" Text='<%# Bind("county") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td align="center" runat="server" style="background-color: #EDFFF0;color: #333333; text-align: center;  padding: 10px;">
                    
                    <asp:Label ID="countyLabel" runat="server" Text='<%# Eval("county") %>' />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table align="center" runat="server">
                    <tr runat="server">
                        <td runat="server">
                            
                            <table ID="groupPlaceholderContainer" runat="server" border="1" 
                                style="padding: 10px; background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr ID="groupPlaceholder" runat="server">
                                    <th id="Th1" runat="server">County</th>
                                    <th id="Th2" runat="server">
                                    County</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center; background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" 
                    style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    
                    <asp:Label ID="countyLabel" runat="server" Text='<%# Eval("county") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
    </p>
</asp:Content>

