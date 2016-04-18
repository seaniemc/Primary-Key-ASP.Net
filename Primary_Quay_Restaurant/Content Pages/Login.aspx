<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Content_Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../styles/login.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div id="container">
        
        <!--::::::::::::::::::::::::::::PAGE CONTENT HERE:::::::::::::::::::::::::::::::-->

        <h3>Login.</h3>

        <div id="loginSection">

            <asp:Label ID="lblUsername" runat="server" Text="Username:" CssClass="labels" 
                Width="150px"></asp:Label>


            <asp:TextBox ID="tbxUsername" runat="server" CssClass="text" Width="200px"></asp:TextBox>
            <br />
            <asp:Label ID="lblPassword" runat="server" CssClass="labels" Text="Password:" 
                Width="150px"></asp:Label>
            <asp:TextBox ID="txbPassword" runat="server" CssClass="text" Width="200px"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" CssClass="btnLogin" Text="Login" 
                Width="150px" />


        </div>


    </div>
</asp:Content>

