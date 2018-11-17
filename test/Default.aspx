<%@ Page Language="C#" MaintainScrollPositionOnPostBack="true" Inherits="test.Default" %>
<!DOCTYPE html>
<html>
<title>Dissability App</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif;}
body, html {
    height: 100%;
    color: #777;
    line-height: 1.8;
}

/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
    background-image: url('/w3images/parallax1.jpg');
    min-height: 100%;
}

/* Second image (Portfolio) */
.bgimg-2 {
    background-image: url("/w3images/parallax2.jpg");
    min-height: 400px;
}

/* Third image (Contact) */
.bgimg-3 {
    background-image: url("/w3images/parallax3.jpg");
    min-height: 400px;
}

.w3-wide {letter-spacing: 10px;}
.w3-hover-opacity {cursor: pointer;}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1600px) {
    .bgimg-1, .bgimg-2, .bgimg-3 {
        background-attachment: scroll;
        min-height: 400px;
    }
}
</style>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-blue w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="#home" class="w3-bar-item w3-button">HOME</a>
    <a href="#about" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> ABOUT</a>
    <a href="#contact" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-envelope"></i> CONTACT</a>
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red">
      <i class="fa fa-search"></i>
    </a>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
    <a href="#about" class="w3-bar-item w3-button" onclick="toggleFunction()">ABOUT</a>
    <a href="#contact" class="w3-bar-item w3-button" onclick="toggleFunction()">CONTACT</a>
    <a href="#" class="w3-bar-item w3-button">SEARCH</a>
  </div>
</div>

<!-- First Parallax Image with Logo Text -->
<div class="bgimg-1 w3-display-container w3-opacity-min" id="home">
  <div class="w3-display-middle" style="white-space:nowrap;">
    <span class="w3-center w3-padding-large w3-blue w3-xlarge w3-wide w3-animate-opacity">NYC <span class="w3-hide-small">SUBWAY</span> ACCESSIBILITY</span>
  </div>
            <img src="images/nyc4k.jpg" class="w3-round w3-image " alt="Photo of NYC" >
</div>

<!-- Container (About Section) -->
<div class="w3-content w3-container w3-padding-64" id="about">
  <h3 class="w3-center">About us</h3>
  <p class="w3-center"><em>We want to improve the lives of disabled citizens in NYC</em></p>
  <p>We have created a Web App that will help display data of various NYC subway stations. Users will be able to check the status of the stations that we have in our database, and find out which stations have accessibility and outages in order to discover the best route.</p>
  <div class="w3-row">
    <div class="w3-col m6 w3-center w3-padding-large">
      <p><b><i class="fa fa-user w3-margin-right"></i>Table 25</b></p><br>
      <img src="images/trainimg.jpg" class="w3-round w3-image " alt="Photo of NYC" width="500" height="333">
    </div>

    <!-- Hide this text on small devices -->
    <div class="w3-col m6 w3-hide-small w3-padding-large">
      <p>Welcome to our website. Start searching by selecting a station.</p>
    </div>
  </div>
  
</div>

<div class="w3-row w3-center w3-blue w3-padding-16">
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">450+</span><br>
    Subway Stations
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">99,000+</span><br>
    Weelchair Users in NYC
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge">118+</span><br>
    Amount of accessible Stations
  </div>
  <div class="w3-quarter w3-section">
    <span class="w3-xlarge"></span><br>
    We help you find the best route:
  </div>
</div>

<!-- Second Parallax Image with Portfolio Text -->
<div class="bgimg-2 w3-display-container w3-opacity-min">
  <div class="w3-display-middle">
   
 <p>Start your search here: </p>
      <form runat="server">
        <div class="w3-row-padding" style="margin:0 -16px 8px -16px"  >
          <div class="w3-half">
           <!-- <input class="w3-input w3-border w3-hover-text-black w3-large" type="text" placeholder="Enter Zip-Code..." > -->
                            <div class="row">
                                 <asp:DropDownList id="ddlStations" runat="server" Visible="false" /> 
            <asp:Button id="b1" runat="server" Text="Get Details" OnClick="b1_Click" CssClass="w3-button w3-blue w3-right w3-section"/>
                            </div>
            
          </div>
        </div>
                   
                     
                   
                
      </form>
  </div>
</div>

        
        <div align= "center" style="border-style:1px solid grey;" runat="server" id="divDetails"> 
            
           <asp:Label id="lblStation" runat="server" />
           
             <p> Borough: <asp:Label id="lblBorough" runat="server" Style="color:red;" />   </p>
             <p> Outagedate: <asp:Label id="lbloutagedate" runat="server" Style="color:red;"/>   </p>
             <p> Estimated Return to Service:  <asp:Label id="lblestimatedreturntoservice" Style="color:red;" runat="server" />   </p>
            <p> Reasons:  <asp:Label id="lblreasons" Style="color:red;" runat="server" />   </p>
            <p> Equipment:  <asp:Label id="lblequipment" Style="color:red;" runat="server" />   </p>
            <p> ADA Compliant:  <asp:Label id="lblADA" Style="color:red;" runat="server" />   </p>
          
           
        </div>
        
        
        
        
        
<!-- Modal for full size images on click-->
<div id="modal01" class="w3-modal w3-blue" onclick="this.style.display='none'">
  <span class="w3-button w3-large w3-blue w3-display-topright" title="Close Modal Image"><i class="fa fa-remove"></i></span>
  <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
    <img id="img01" class="w3-image">
    <p id="caption" class="w3-opacity w3-large"></p>
  </div>
</div>

<!-- Third Parallax Image with Portfolio Text -->
<div class="bgimg-3 w3-display-container w3-opacity-min">
  <div class="w3-display-middle">
   
    </div>
  
            </div> 
<!-- Container (Contact Section) -->

  <div class="w3-row w3-padding-32 w3-section">
    <div class="w3-col m4 w3-container">
      <img src="/w3images/map.jpg" class="w3-image w3-round" style="width:100%">
    </div>
    <div class="w3-col m8 w3-panel">
      <div class="w3-large w3-margin-bottom">
        <i class="fa fa-map-marker fa-fw w3-hover-text-blue w3-xlarge w3-margin-right"></i> New York, USA<br>
        <i class="fa fa-phone fa-fw w3-hover-text-blue w3-xlarge w3-margin-right"></i> Phone: +00 000000<br>
        <i class="fa fa-envelope fa-fw w3-hover-text-blue w3-xlarge w3-margin-right"></i> Email: table25@mail.com<br>
      </div>
     
    </div>
  </div>


<!-- Footer -->
<footer class="w3-center w3-blue w3-padding-64 w3-opacity w3-hover-opacity-off">
  <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  <div class="w3-xlarge w3-section">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  
</footer>
 
<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

// Change style of navbar on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
    var navbar = document.getElementById("myNavbar");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        navbar.className = "w3-bar" + " w3-card" + " w3-animate-top" + " w3-white";
    } else {
        navbar.className = navbar.className.replace(" w3-card w3-animate-top w3-white", "");
    }
}

// Used to toggle the menu on small screens when clicking on the menu button
function toggleFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>

</body>
</html>

