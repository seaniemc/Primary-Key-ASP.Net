<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <link rel="stylesheet" type="text/css" href="../styles/HomePage.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>

        <asp:Image ID="Image1" 
                   runat="server" 
                   ImageAlign="AbsMiddle" 
                   ImageUrl="~/Images/stolen_pic.jpg" />

    </div>

</asp:Content>

