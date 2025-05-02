<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
	HttpSession sessionObj = request.getSession();
	String username =(String) sessionObj.getAttribute("name");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medicine Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
 integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
 crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link rel="stylesheet" href="alert/dist/sweetalert.css">
 <link rel="icon" href="image/logo_img.png" type="image/x-icon">
</head>
<!-- CSS FOR MEDICINE PAGE -->
<style>
	
	body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

#top-container{
	background-color:#1B398C;
	height:30px;
	width:100%;
	display: flex;
    justify-content: space-evenly;
    align-items: center;
    color:white;
    font-size: 14px;
}
#content-1 a{
	color:white;
    text-decoration: none;
    margin-right:10px;
}
#main-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #0288D1;
    color: black;
}
#logo{
	display:flex;
	color:#b3e5fc;
	padding-left:20px;
	margin-top:5px;
}
#logo h1{
	font-size:30px;
}
#logo img{
	height:20px;
	width:30px;
}
#logo h2 {
    margin: 0;
}
#shop-by-cat{
	display: flex;
    justify-content: center;
    align-items: center;
    gap: 0.5rem;
    color:white;
	padding:5px;
}
#shop-by-cat:hover{
	border: 2px solid white;
}
#login-signup {
    display: flex;
    gap: 10px;
    align-items:center;
    height:60px;
    width:300px;
    justify-content:center;
}
#login-header, #signup-header{
	background: skyblue;
    height: 40px;
    width: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 5px;
}
#login-header:hover,#signup-header:hover{

	height:45px;
	width:85px;
}

#login-signup a {
    text-decoration:none;
    font-weight: bold;
    color:blue;
    font-size:13px;
}

#login-signup a:hover {
    text-decoration: underline; 
}
#name-after-login{
	color:white;
}
#logout{
	height: 40px;
    display: flex;
    width: 100px;
    align-items: center;
    background: #b3e5fc;
    justify-content: center;
    color: #0288D1;
    text-decoration:none;
    border-radius:5px;
}

hr {
    border: 1px solid #ddd;
}

#search-box {
    text-align: center;
    padding: 20px;
    display:flex;
    justify-content:center;
}

#search-box select, #search-box input {
    padding: 10px;
    margin: 5px;
    width: 250px;
    border: 1px solid #ccc;
    border-radius: 5px;
    color:grey;
}
/*slide show*/
	#hero-image{
		background-color:white;
		height:450px;
		display:flex;
	}
	#hero-sec-1{
		padding:20px;
		margin-top:50px;
		text-align:center;
	}
	#hero-sec-2{
		display:flex;
		flex-direction:column;
		font-size:1.2rem;
		line-height: 0px;
    	font-family: system-ui;
	}
	#hero-sec-1 p{
		font-size:12px;
		color:gray;
		margin-top:30px;
	}
	#hero-sec-1 button{
		width:80px;
		margin-top:50px;
	}
	#hero-sec-1 button a{
		color:white;
		text-decoration:none;
	}
	#off p{
		color:#0288D1;
		font-size: 26px;
    	margin-bottom: 5px;
	}
/*------------*/
#prod-info {
    display: none;
    justify-content: center;
    align-items: center;
    margin: 20px;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

#images-med{

	display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

#images-med img {
    width: 200px;
    height: auto;
}

#info {
    margin-left: 50px;
}

#info label {
    color:#2c3e50;
}

#info input {
    padding: 8px;
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

#medicineTable {
    width: 80%;
    margin: auto;
    background-color: white;
    border-collapse: collapse;
}

#medicineTable th, #medicineTable td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ccc;
}

#medicineTable th {
    background-color: #0288D1;
    color: white;
}

#total-amount {
    display: block;
    margin: 20px auto;
    padding: 10px;
    width: 200px;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 5px;
    background: white;
}
button{
	color: white;
    background: #0288D1;
    border: none;
    border-radius: 5px;
    height:32px;
    width:35px;
    curser:pointer;
}
#purchase-med{
	display:flex;
	justify-content:center;
	align-items:center;
}
#purchase{
	height:30px;
	width:200px;
	cursor:pointer;
}
#running-text{
	color:red;
	padding: 10px;
    background: #d0e8f3;
}
#outofstock{
	font-size:14px;
	color:red;
	display:none;
}
/* Hide the confirmation box by default */
#confirm-container {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 300px;
    background: rgba(0, 0, 0, 0.8); /* Semi-transparent dark background */
    color: white;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.3);
}

/* Blur effect for the background when modal is active */
body.modal-active {
    filter: blur(5px);
    pointer-events: none;
}

/* Yes/No buttons */
#y-n {
    display: flex;
    justify-content: space-evenly;
    margin-top: 15px;
}

#y-n a {
    text-decoration: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-weight: bold;
    transition: 0.3s ease;
}

#y-n a:first-child {
    background: #ff4d4d; /* Red for "Yes" */
    color: white;
}

#y-n a:first-child:hover {
    background: #cc0000;
}

#y-n a:last-child {
    background: #4CAF50; /* Green for "No" */
    color: white;
}

#y-n a:last-child:hover {
    background: #2E8B57;
}
 .category-container {
            position: relative;
            display: inline-block;
        }

        /* Shop By Category Button */
        .shop-category {
            
            color: white;
         	gap:0.5rem;
            display: flex;
            justify-content:center;
            align-items:center;
            cursor: pointer;
        }
	.shop-category:hover{
		border: 2px solid white;
	}
        /* Dropdown Content */
        .dropdown-content {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: skyblue;
            padding: 10px;
            min-width: 200px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        /* List Styles */
        .dropdown-content ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .dropdown-content ul li {
            padding: 5px;
        }

        .dropdown-content ul li a {
            text-decoration: none;
            color: black;
            font-weight: bold;
        }
         .dropdown-content ul li a:hover{
         	background:white;
         }

        /* Show Dropdown when Hover */
        .category-container:hover .dropdown-content {
            display: block;
        }
        

/*more items section*/	
body {
  font-family: Arial, sans-serif;
  margin: 0;
  background-color: #f8f8f8;
}

.featured-section {
  text-align: center;
  padding: 40px 20px;
  background-color:#13c2c214;
}

.featured-section h2 {
  font-size: 32px;
  margin-bottom: 10px;
}

.subtitle {
  color: #888;
  font-size: 14px;
  margin-bottom: 30px;
}

.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
  padding: 0 20px;
}

.product-card {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px #ddd;
  padding: 15px;
  position: relative;
  text-align: center;
}

.product-card img {
  max-width: 100%;
  height: auto;
}

.category {
  font-size: 12px;
  color: #999;
  display: block;
  margin: 10px 0 5px;
}

.product-card h3 {
  font-size: 16px;
  margin: 5px 0;
}

.stars {
  color: orange;
  margin: 5px 0;
}

.price {
  font-weight: bold;
  font-size: 18px;
  margin: 5px 0;
}

.cart-btn {
  background: #007bff;
  color: white;
  border: none;
  
  padding: 10px;
  font-size: 16px;
  cursor: pointer;
  margin-top: 10px;
  width:100px;
}
/*footer section*/
.footer {
  background-color: #f9f9f9;
  padding: 50px 20px 20px;
  font-family: Arial, sans-serif;
  color: #333;
}

.footer-container {
  display: flex;
  flex-wrap: wrap;
  gap: 40px;
  justify-content: space-between;
  max-width: 1200px;
  margin: auto;
}

.footer-col {
  flex: 1 1 300px;
}

.footer h2.logo {
  font-size: 24px;
  color: #1e90ff;
  margin-bottom: 10px;
}

.footer .phone {
  font-size: 18px;
  color: #4169e1;
  margin: 10px 0;
}

.news-list {
  list-style: none;
  padding: 0;
}

.news-list li {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
}

.news-list img {
  margin-right: 10px;
  border-radius: 5px;
}

.news-list .date {
  font-size: 12px;
  color: gray;
}

.newsletter {
  display: flex;
  margin-top: 10px;
}

.newsletter input {
  padding: 8px;
  flex: 1;
  border: 1px solid #ccc;
  border-radius: 5px 0 0 5px;
}

.newsletter button {
  padding: 8px 15px;
  background: #4285f4;
  color: white;
  border: none;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
}

.social-icons {
  margin: 15px 0;
}

.social-icons a {
  display: inline-block;
  margin-right: 10px;
  font-size: 18px;
  color: white;
  background: #333;
  width: 32px;
  height: 32px;
  text-align: center;
  line-height: 32px;
  border-radius: 5px;
}

.footer-bottom {
  text-align: center;
  padding-top: 30px;
  border-top: 1px solid #ddd;
  margin-top: 40px;
}

.footer-links {
  display: flex;
  justify-content: center;
  list-style: none;
  flex-wrap: wrap;
  padding: 0;
  gap: 15px;
  margin-bottom: 10px;
}

.footer-links a {
  text-decoration: none;
  color: #333;
  font-size: 14px;
}

.footer-links a:hover {
  color: #007bff;
}
#payment-method-image{
	width:300px;
}
</style>

<script type="text/javascript">
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
	
</script>
<script>
	let totalAmount = 0;
	function fetchMedName(){
		const medicineSelect = document.getElementById("med-select");
		const selectedMedicine = medicineSelect.value;
		var selectImg = document.getElementById("med-img");
		//let mediName = document.getElementById("medicine-name").value;
		
		var medicineImages = {
				
				"AZYTHROMYCIN":"https://5.imimg.com/data5/HQ/UL/PD/SELLER-22141969/azithromycin-tablet-250mg-1000x1000.jpg",
				"DART":"https://cdn01.pharmeasy.in/dam/products/052211/dart-strip-of-10-tablets-3-1647504036.jpg",
				"PARACITAMOL":"https://integratedlaboratories.in/wp-content/uploads/2022/08/Paracetamol-500mg-Tablets-Intemol-500-2.jpeg",
				"SOMPRAZ D40":"https://th.bing.com/th/id/OIP.AiUGm2aZPVwXfc86XKjGQgAAAA?rs=1&pid=ImgDetMain"
		}
		
		let searchMedicine = document.getElementById("search-medicine").value.toUpperCase();
		let prodinfo = document.getElementById("prod-info");
		let heroImg = document.getElementById("hero-image");
		console.log(heroImg);
		let xhr = new XMLHttpRequest();
		if(selectedMedicine){
			
			prodinfo.style.display = "flex";
			heroImg.style.display = "none";
			xhr.open("GET","Med?medicineName="+selectedMedicine,true);
			selectImg.src = medicineImages[selectedMedicine];
			document.getElementById("medicine-name").innerHTML = selectedMedicine;
		}else if(searchMedicine){
			prodinfo.style.display = "flex";
			heroImg.style.display = "none";
			xhr.open("GET","Med?medicineName="+searchMedicine,true);
			selectImg.src = medicineImages[searchMedicine];
			document.getElementById("medicine-name").innerHTML = searchMedicine;
		}
		else{
			 imageElement.src = "https://integratedlaboratories.in/wp-content/uploads/2022/08/Paracetamol-500mg-Tablets-Intemol-500-2.jpeg";
             imageElement.alt = "medicine";
		    console.error("Neither selectedMedicine nor searchMedicine is set");
		    return;
		}
		xhr.onreadystatechange = function(){
			if (xhr.readyState === 4 && xhr.status === 200) {
                const obj = JSON.parse(xhr.responseText);
                if(selectedMedicine)document.getElementById("prod-name").value = selectedMedicine;
                else document.getElementById("prod-name").value = searchMedicine;
                document.getElementById("price").value = obj.price;
                document.getElementById("stock").value = obj.stock;
                document.getElementById("exp_date").value = obj.exp_date;
            }
		};
		xhr.send();
	}
	function calculateSum(){
		let price = parseInt(document.getElementById("price").value);
		let quantity = parseInt(document.getElementById("qty").value);//2
		let stock = parseInt(document.getElementById("stock").value);//2
		let outofstock = document.getElementById("outofstock");
		console.log(price+" "+quantity);
		let amount = 0;
		if(quantity > 0) {
			amount= price * quantity;
		}
		console.log(amount);
		let medicineName = document.getElementById("med-select").value;
		let medicineName1 = document.getElementById("search-medicine").value;
		
		if(medicineName && !isNaN(amount) && !isNaN(quantity) && quantity>0){
			if (quantity > stock) {
			    outofstock.style.display = "block";
			    return;
			} else {
			    outofstock.style.display = "none";
			}
			const table = document.getElementById("medicineTable");
            const row = table.insertRow();
            row.insertCell(0).innerHTML = medicineName;
            row.insertCell(1).innerHTML = quantity;
            row.insertCell(2).innerHTML = amount;

		 	totalAmount += amount;
         	document.getElementById("total-amount").value = totalAmount;
         	stock--;
		}else if(medicineName1 && !isNaN(amount) && !isNaN(quantity) && quantity>0){
			if (quantity > stock) {
			    outofstock.style.display = "block";
			    return;
			} else {
			    outofstock.style.display = "none";
			}
			const table = document.getElementById("medicineTable");
            const row = table.insertRow();
            row.insertCell(0).innerHTML = medicineName1;
            row.insertCell(1).innerHTML = quantity;
            row.insertCell(2).innerHTML = amount;
            
            totalAmount += amount;
         	document.getElementById("total-amount").value = totalAmount;
		}
	}
</script>
<script>
function confirmLogout() {
    document.getElementById("confirm-container").style.display = "block";
}
</script>
<body>
	<input type="hidden" id="status" value=<%=request.getAttribute("status")%>>
	<div id="top-container">
		<div id="content-1">
			<a href="About.jsp">About Us </a>
			<a href="Blog.jsp">Blog </a>
			<a href="ContactUs.jsp">Contact Us </a>
		</div>
		<p id="content-2">
			Save up to 10% on all products with "GET20OFF" code
		</p>
		<p id="content-3">
			Free Shipping on orders over $100!
		</p>
	</div>
    <div id="main-container" >
    	<div id="logo">
    		<h1>MED</h1>
    		<img alt="logo" src="https://www.freepnglogos.com/uploads/plus-icon/red-plus-clip-art-clkerm-vector-clip-art-online-15.png">
    	</div>
    	<div class="category-container">
        <div class="shop-category">
        	<i class="fa-solid fa-bars"></i>
        	<p>Shop By Category</p>
        	</div>
        <div class="dropdown-content">
            <ul>
                <li><a href="https://www.bing.com/search?pglt=427&q=vitamines+and+sup%3Bliments&cvid=32ca4ec68814445a8e57e6e93b6a12cc&gs_lcrp=EgRlZGdlKgYIABBFGDkyBggAEEUYOTIGCAEQABhAMgYIAhAAGEDSAQg1OTA2ajBqMagCALACAA&FORM=ANNTA1&ucpdpc=UCPD&adppc=EDGEDBB&PC=HCTS">Vitamins & Supplements</a></li>
                <li><a href="https://www.bing.com/search?q=Ayurveda%20%26%20Herbs&qs=n&form=QBRE&sp=-1&lq=0&pq=ayurveda%20%26%20herbs&sc=12-16&sk=&cvid=6192E3E975704EAF9D35DF35C7F53AC9">Ayurveda & Herbs</a></li>
                <li><a href="https://www.amazon.in/s/?ie=UTF8&keywords=health+mix+drink&index=aps&tag=msndeskstdin-21&ref=pd_sl_9rpyp3ogxf_b&adgrpid=1316117025931939&hvadid=82257581320677&hvnetw=o&hvqmt=b&hvbmt=bb&hvdev=c&hvlocint=&hvlocphy=148587&hvtargid=kwd-82258191692786:loc-90&hydadcr=5845_2377525&mcid=ef008c2481d63f6787c98cea42b68ccb&msclkid=bbac2f91168b1f062adc47825e59a73d">Health Food & Drinks</a></li>
                <li><a href="https://www.amazon.in/s?k=Fitness+medicines&crid=1KTEMUGYKH2TX&sprefix=fitness+medicine%2Caps%2C314&ref=nb_sb_noss_1">Fitness</a></li>
            </ul>
        </div>
    </div>
    	<div id="login-signup">
    <%
        if (username == null) {
    %>
        <div id="login-header">
            <a href="login.jsp">LOGIN</a>
        </div>
        <div id="signup-header">
            <a href="signup.jsp">SIGNUP</a>
        </div>
    <%
        } else {
    %>
        <h2 id="name-after-login">Welcome, <%= username %>!</h2>
       <a id="logout" href="#" onclick="confirmLogout()">LOGOUT</a>
		<div id="confirm-container">
    		<p>Confirm to Log Out?</p>
    		<div id="y-n">
        		<a href="logout.jsp">Yes</a>
        		<a href="index.jsp">No</a>
    		</div>
		</div>
             
    <%
        }
    %>
</div>
    </div>
    <marquee id="running-text">Flat 15% off + extra cashback up to 15% - Upto 30% off for purchasing above Rs.2000/- </marquee>
    <div id="search-box">
	<select id="med-select" onchange="fetchMedName()">
  		<option value="">--MEDICINES AVAILABLE--</option>
  		<%
  			//database connetivity
  			Connection con = null;
  			ResultSet rs = null;
  			Statement stmt = null;
  			try{
  				Class.forName("com.mysql.cj.jdbc.Driver");
  				final String url = "jdbc:mysql://localhost:3306/medicine";
  				final String user = "root";
  				final String password = "Lonalove27kundu12";
  				con = DriverManager.getConnection(url,user,password);
  				stmt = con.createStatement();
  				rs = stmt.executeQuery("SELECT medicineName FROM MEDICINE_TABLE");
  				while(rs.next()){
  					String medicine_name = rs.getString("medicineName");
  					
		%>		
				<option value = "<%= medicine_name %>"><%= medicine_name %></option>
		<%
  				}
  			}catch(ClassNotFoundException e){
  				e.printStackTrace();
  			}
  			
  			finally{
  				if(con != null) con.close();
  				if(rs != null) rs.close();
  				if(stmt != null) stmt.close();
  			}	
  		
  		%>
	</select>
	
	<div class="search-container">
        <input id="search-medicine" placeholder="SEARCH FOR MEDICINES">
        <button type="submit" class="search-button" onclick="fetchMedName()">
            <i class="fa-solid fa-magnifying-glass"></i>
        </button>
    </div>
	</div>
	<!-- slide show -->
	<div id="hero-image">
		<div id="hero-sec-1">
			<div id="off"><p>Sale up to 30% off</p></div>
			<div id="hero-sec-2">
				<h1>Take Care</h1>
				<h1>Of your health</h1>
			</div>
			<p>To maintain good health, always keep basic medicines
			 and first-aid supplies from a trusted medical store at home.
			  Consult the pharmacist before using any new medicine to ensure
			   safe and proper usage.
			</p>
			<button><a href="#Section">Shop Now</a></button>
		</div>
		<img src="image/hero-img.png" alt="photo">
	</div>
	<!--  -->
	
		<div id="prod-info">
		<div id="images-med">
		<img id="med-img" alt="medicine" src="https://integratedlaboratories.in/wp-content/uploads/2022/08/Paracetamol-500mg-Tablets-Intemol-500-2.jpeg">
		<p id="medicine-name">PARACETAMOL 500<p>
	</div>
	<form action="updateStock.jsp" method="post">
		<div id="info">
			<label for="name">NAME:</label><br>
  			<input type="text" id="prod-name" name="prod-name" readonly><br><br>
			<label for="price">PRICE:</label><br>
  			<input type="text" id="price"  name="price" readonly><br><br>
  			<label for="stock">STOCK:</label><br>
  			<input type="text" id="stock"  name="stock" readonly><br><br>
  			<label for="exp">EXP. DATE:</label><br>
  			<input type="text" id="exp_date"  name="exp_date" readonly><br><br>
  			<label for="qty">QUANTITY:</label><br>
  			<input type="number" id="qty"  name="qty" oninput="calculateSum()" >
  			<p id="outofstock">OUT OF STOCK<p><br><br>
  			<div id="purchase-med">
				<button id="purchase" >BUY NOW</button>
			</div>
		</div>
		</form>
		</div>
		<div id="table-section">
			<table border="1" id="medicineTable">
				<tr>
					<th>MEDICINE NAME</th>
					<th>QUANTITY</th>
					<th>AMOUNT</th>
				</tr>
			</table><br>
			<input type="text" id="total-amount" placeholder="TOTAL AMOUNT"readonly>
		</div>
		
		<!-- more items section -->
  <section class="featured-section">
    <h2>Featured Products</h2>
    <p class="subtitle">Product authorized by top brands.</p>

    <div class="product-grid">

      <!-- Product Card -->
      <div class="product-card">
        <img src="image/liver.jpeg" alt="Product">
        <span class="category">Syrup</span>
        <h3>Natural Liver Cleanse Herbal Tonic</h3>
        <div class="stars">*****</div>
        <div class="price">$316.10</div>
        <button class="cart-btn">Buy Now</button>
      </div>
      
      <div class="product-card">
        <img src="image/capsules.jpeg" alt="Product">
        <span class="category">Tablets</span>
        <h3>High Quality OEM Dietary Supplement Capsules 500Mg</h3>
        <div class="stars">*****</div>
        <div class="price">$10.00</div>
        <button class="cart-btn">Buy Now</button>
      </div>

      <!-- Copy and edit this card for more products -->
      <div class="product-card">
        <img src="image/skincare.jpeg" alt="Product">
        <span class="category">Skin Care</span>
        <h3>Divya Himalayan Skin Glow</h3>
        <div class="stars">*****</div>
        <div class="price">$668.00</div>
        <button class="cart-btn">Buy Now</button>
      </div>

    </div>
  </section>
	<!--  -->
	
	<!-- footer section  -->
	<footer class="footer">
  <div class="footer-container">

    <!-- Column 1: Company Info -->
    <div class="footer-col">
      <h2 class="logo">Med+</h2>
      <p>To maintain good health, always keep basic medicines and first-aid supplies from a trusted medical store at home. Consult the pharmacist
       before using any new medicine to ensure safe
        and proper usage.</p>
      <p class="phone">+91-1234567890</p>
      <p>081 Subhaspally Main Road, Asansol</p>
      <p>contact@medplus12.com</p>
      <p>Hours: 10:00 - 18:00, Mon - Sat</p>
    </div>
    <!-- Column 2: Latest News -->
    <div class="footer-col">
      <h3>Latest News</h3>
      <ul class="news-list">
        <li>
          <img src="image/smoking-1.jpg" alt="" style=" height: 60px;">
          <div>
            <p class="date">2025-04-09</p>
            <p><a href="https://www.medindia.net/news/smoking-booze-and-couch-life-triple-threat-to-your-future-health-219703-1.htm">Smoking, Booze and Couch Life: Triple Threat to Your Future Health</a></p>
          </div>
        </li>
        <li>
          <img src="image/fetus.jpg" alt="image" style=" height: 60px;">
          <div>
            <p class="date">2025-03-12</p>
            <p><a href="https://www.medindia.net/news/thinking-about-prenatal-testing-why-not-go-needle-free-219739-1.htm">Thinking About Prenatal Testing? Why Not Go Needle-Free?</a></p>
          </div>
        </li>
        <li>
          <img src="image/lungs.jpg" alt="image" style=" height: 60px;">
          <div>
            <p class="date">2025-03-01</p>
            <p><a href="https://www.medindia.net/news/healthwatch/deepteks-chest-x-ray-ai-achieves-eu-mdr-certification-219701-1.htm">DeepTek's Chest X-ray AI Achieves EU MDR Certification</a></p>
          </div>
        </li>
        <li>
          <img src="image/gene-editing-therapy.jpg" alt="image" style=" height: 60px;">
          <div>
            <p class="date">2025-02-06</p>
            <p><a href="https://www.medindia.net/news/healthwatch/one-time-gene-editing-therapy-shows-big-promise-for-cholesterol-219719-1.htm">One-Time Gene Editing Therapy Shows Big Promise for Cholesterol</a></p>
          </div>
        </li>
      </ul>
    </div>

    <!-- Column 3: Newsletter -->
    <div class="footer-col">
      <h3>Sign up for Newsletter & get 20% off</h3>
      <form class="newsletter">
        <input type="email" placeholder="Enter your email">
        <button type="submit" style="width: 100px;">Subscribe</button>
      </form>

      <h3>Follow us</h3>
      <div class="social-icons">
        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
        <a href="#"><i class="fa-brands fa-twitter"></i></a>
        <a href="#"><i class="fa-brands fa-instagram"></i></a>
        <a href="#"><i class="fa-brands fa-linkedin"></i></a>
        <a href="#"><i class="fa-brands fa-youtube"></i></a>
      </div>

      <h3>Payment methods</h3>
      <img id = "payment-method-image" src="https://t4.ftcdn.net/jpg/05/76/85/01/360_F_576850175_DfN3gojvgeZtFxAWURuCgLUgCuRiL14F.jpg" alt="Payments">
    </div>
  </div>

  <!-- Bottom links -->
  <div class="footer-bottom">
    <ul class="footer-links">
      <li><a href="#">About Us</a></li>
      <li><a href="#">Contact Us</a></li>
      <li><a href="#">Blog</a></li>
      <li><a href="#">Customer Services</a></li>
      <li><a href="#">Privacy Policy</a></li>
      <li><a href="#">FAQs</a></li>
    </ul>
    <p class="copyright">
      © 2025 Med+ All Rights Reserved. Designed by Shribas Kundu.
    </p>
  </div>
</footer>

<!-- FontAwesome CDN -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
	
	<!--  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = documnet.getElementById("status").value;
		if(status == "success"){
			alert()
			swal("Item purchased Successfully!","success");
		}
	</script>
</body>
</html>