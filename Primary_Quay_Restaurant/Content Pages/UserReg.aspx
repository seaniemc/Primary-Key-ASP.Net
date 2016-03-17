<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserReg.aspx.cs" Inherits="UserReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../styles/userReg.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="container">

    <h3>USER REGISTRATION</h3>
    
    <div id="user">
    <p>User Details</p>
        <table class="style1">
            <tr>
                <td width="200">
                    <asp:Label ID="Label1" runat="server" Text="Name:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbName" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredName" runat="server" 
                        ErrorMessage="Name required." ControlToValidate="txbName" 
                        Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td width="200">
                    <asp:Label ID="Label2" runat="server" Text="Age:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbAge" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredAge" runat="server" 
                        ErrorMessage="Age required." ControlToValidate="txbAge" Display="Dynamic" 
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="vlAgeRange" runat="server" ControlToValidate="txbAge" 
                        ErrorMessage="You must be over 18." ForeColor="Red" MaximumValue="99" 
                        MinimumValue="18" Type="Integer">*</asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td width="200">
                    <asp:Label ID="Label3" runat="server" Text="Email:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbEmail" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredEmail" runat="server" 
                        ControlToValidate="txbEmail" Display="Dynamic" ErrorMessage="Email required." 
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="vlEmailPatern" runat="server" 
                        ControlToValidate="txbEmail" ErrorMessage="Must be email." ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="200">
                    <asp:Label ID="Label4" runat="server" Text="Phone Num.:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbPhone" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredPhone" runat="server" 
                        ErrorMessage="Phone required" ControlToValidate="txbPhone" 
                        Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        
    </div>
    <div id="address">
    <p>Address</p>
        <table class="style1">
            <tr>
                <td width="200">
                    <asp:Label ID="Label5" runat="server" Text="Street1:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbStreet1" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredStreet" runat="server" 
                        ErrorMessage="Street required" ControlToValidate="txbStreet1" 
                        Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td width="200">
                    <asp:Label ID="Label6" runat="server" Text="Street2:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbStreet2" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td width="200">
                    <asp:Label ID="Label7" runat="server" Text="City/Town:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbCity" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredCity" runat="server" 
                        ErrorMessage="City/Town required" ControlToValidate="txbCity" 
                        Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td width="200">
                    <asp:Label ID="Label8" runat="server" Text="County:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:DropDownList ID="ddlCounty" runat="server" DataSourceID="dsCounty" 
                        DataTextField="county" DataValueField="id" Width="226px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredCounty" runat="server" 
                        ErrorMessage="County required." ControlToValidate="ddlCounty" 
                        Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>

    
    <div id="login">
    <p>Login</p>
        <table class="style1">
            <tr>
                <td width="200">
                    <asp:Label ID="Label9" runat="server" Text="Username:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbUsername" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredUsername" runat="server" 
                        ErrorMessage="Username required" ControlToValidate="txbUsername" 
                        Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td width="200">
                    <asp:Label ID="Label10" runat="server" Text="Password:" Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbPass" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredPass" runat="server" 
                        ErrorMessage="Password required" ControlToValidate="txbPass" 
                        Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="vlPassPattern" runat="server" 
                        ControlToValidate="txbPass" ErrorMessage="Password is not valid." 
                        ForeColor="Red" ValidationExpression="[A-Za-z0-9]{8,16}">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="200">
                    <asp:Label ID="Label11" runat="server" Text="Confirm Password:" 
                        Font-Names="Calibri"></asp:Label>
                </td>
                <td width="250">
                    <asp:TextBox ID="txbPass2" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="vlRequiredPass2" runat="server" 
                        ErrorMessage="Confirm password required." ControlToValidate="txbPass2" 
                        Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="vlPassCompare" runat="server" 
                        ControlToCompare="txbPass" ControlToValidate="txbPass2" 
                        ErrorMessage="Password is not matched." ForeColor="Red">*</asp:CompareValidator>
                </td>
            </tr>
        </table>

    </div>

    <div id="buttons">

        <asp:Button ID="btnBack" runat="server" Text="Back" Width="116px" />
&nbsp;
        <asp:Button ID="btnClear" runat="server" Text="Clear" Width="116px" />
&nbsp;
        <asp:Button ID="btnSubmit" runat="server" Text="Register" Width="116px" 
            onclick="btnSubmit_Click" />

    </div>

    <div id="errors">
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

        
        
        <asp:ValidationSummary ID="vlRegistration" runat="server" ForeColor="Red" 
            HeaderText="Form is incoplete" />
        
    </div>
    <asp:SqlDataSource ID="dsCounty" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        SelectCommand="SELECT * FROM [countys]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsUser" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        SelectCommand="SELECT id FROM users WHERE email = @email" 
        
        InsertCommand="INSERT INTO users(name, age, email, phone, street1, street2, city, countyid) VALUES (@name, @age, @email, @phone, @street1, @street2, @city, @county)">
        <InsertParameters>
            <asp:Parameter Name="name" />
            <asp:Parameter Name="age" />
            <asp:Parameter Name="email" />
            <asp:Parameter Name="phone" />
            <asp:Parameter Name="street1" />
            <asp:Parameter Name="street2" />
            <asp:Parameter Name="city" />
            <asp:Parameter Name="county" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txbEmail" 
                DefaultValue="andrei.lavrinovic@gmail.com" Name="email" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsLogin" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        InsertCommand="INSERT INTO login(userid, username, password) VALUES (@userid, @username, @password)" 
        SelectCommand="SELECT login.* FROM login">
        <InsertParameters>
            <asp:Parameter Name="userid" />
            <asp:Parameter Name="username" />
            <asp:Parameter Name="password" />
        </InsertParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>

