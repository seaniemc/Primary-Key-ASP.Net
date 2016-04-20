<%@ Page Theme="CustomisedTheme"  Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Content_Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../styles/login.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div id="container">
        
        <!--::::::::::::::::::::::::::::PAGE CONTENT HERE:::::::::::::::::::::::::::::::-->

        <h3>Login.</h3>

        <div id="logedin" runat="server" class="logedin">
            <asp:Label ID="lblUser" runat="server" Text="" CssClass="lblLogoff"></asp:Label><br />
            <asp:Button ID="btnLogof" runat="server" Text="Logout" 
                onclick="btnLogof_Click" CssClass="btnLogout" />
        </div>

        <div id="loginSection" runat="server" class="loginSection">
            
            <p id="pLoginMemo">All fields must be completed. Password should be 8 - 16 charachters long and
            must contain at least one character and one number.</p>

            <asp:Label ID="lblUsername" runat="server" Text="Username:" CssClass="labels" 
                Width="150px"></asp:Label>


            <asp:TextBox ID="tbxUsername" runat="server" CssClass="text" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="requeredUsername" runat="server" 
                ControlToValidate="tbxUsername" ErrorMessage="Username field is requered" 
                ForeColor="Red">*</asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblPassword" runat="server" CssClass="labels" Text="Password:" 
                Width="150px"></asp:Label>
            <asp:TextBox ID="txbPassword" runat="server" CssClass="text" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredPassword" runat="server" 
                ControlToValidate="txbPassword" Display="Dynamic" 
                ErrorMessage="Password field is requered" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txbPassword" ErrorMessage="Password is not valid." 
                ForeColor="Red" ValidationExpression="[A-Za-z0-9]{8,16}">*</asp:RegularExpressionValidator>
            <br />

            <div runat="server" id="errorMsg" class="errorMsg">
                <p>Entered username or password is not correct.</p>
            </div>
            <asp:ValidationSummary ID="summaryLogin" runat="server" ForeColor="Red" />
            <br />

            <div id="btns">
                <asp:Button ID="btnRegister" CssClass="btnLogin" runat="server" Text="Register" 
                    Width="104px" onclick="btnRegister_Click" />
                <asp:Button ID="btnLogin" runat="server" CssClass="btnLogin" Text="Login" 
                    Width="104px" onclick="btnLogin_Click" />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="sdsLogin" runat="server" 
        ConnectionString="<%$ ConnectionStrings:primary_quey_restourantConnectionString %>" 
        SelectCommand="SELECT login.* FROM login"></asp:SqlDataSource>
</asp:Content>

