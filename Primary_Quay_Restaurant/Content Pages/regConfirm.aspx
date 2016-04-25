<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="regConfirm.aspx.cs" Inherits="Content_Pages_regConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" type="text/css" href="../styles/menu.css" />

    <style type="text/css">
        #noteDiv
        {
            width: 400px;
            padding: 20px;
            margin: 50px auto;
            border: 1px solid #909090;
            border-radius: 4px;
            font: normal 16px arial;
            color: #303030;
        }
            
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="container">
    
    <!--::::::::::::::::::::::::::::PAGE CONTENT HERE:::::::::::::::::::::::::::::::-->

    <div id="noteDiv">

        <p>You are registered successfuly.<br />Thanks Thanks for using Primary Quey Restourant.</p>
    </div>

    <div id="btns">
        <asp:Button ID="btnHomePage" runat="server" Text="Home" 
            onclick="btnHomePage_Click" Width="100px" />
    </div>


</div>
</asp:Content>

