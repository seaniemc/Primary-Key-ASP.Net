<%@ Page Theme="Default" Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link rel="stylesheet" type="text/css" href="../styles/About.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   

    <div id="container" >
          <asp:Image ID="imgLogoImage" 
                               runat="server" 
                               Height="75px" 
                               ImageUrl="~/Images/pk_logo.jpg" 
                               Width="103px" 
                               margin = "200px"/>
                       <p></p>        
  <h3>About the Primary Key Restaurant.</h3>
  
  <p>All of us here at the Primary Key Restaurant take great pride in the quality food we offer our customers.</p>
                
                <p></p><h4> Our Veg</h4>
                <p>Our Vegetables are all organic and  come from a privatly owened farm where our farming staff oversees that only the top quality Vegetables come to our Restaurant .</p>
                <p></p>
                <h4> Our Meat</h4>
                <p>The local butcher is our main source of all our meat and poultry. The beef is 100% organic irish beef and our fish is caught fresh every day.</p>
                <p></p>
                <h4> Staff</h4>
                <p>Headcheff:       Sean McGrath</p>
                <p>Cheff de parie:  Andrej Lavrinovic</p>
                <p>Pastry Cheff: Vusumuzi Khumalo</p>
                <p>Cheff: Christy Madden</p>
                <p>Cheff: Will Hogan</p>
                <p>Commi Cheff: Tim Daiber</p>

                <p></p>
                <p>All of our staff are highly trained professionals with at least 4 years experiance.</p>
                <p></p>
                <h4>Location</h4>
                <p>You can find our restaurant in GMIT on The Old Dublin Road in Galway.</p>
                <p></p>
                <p>Enjoy.</p>
    </div>
  
</asp:Content>

