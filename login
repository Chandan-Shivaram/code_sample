<?php

session_start();
 
if(isset($_POST['submit'])){

	$name = $_POST['usermail'];
    $pwd = $_POST['userpwd'];
    
    $_SESSION['Email'] = $name;

if(isset($_POST['usermail']) && isset($_POST['userpwd']) && isset($_POST['submit'])){

	$connection = mysqli_connect("localhost","root","","dbms");

	$query = "SELECT * FROM register WHERE email='$name'  AND password = '$pwd'";
    $result = mysqli_query($connection,$query);
    $row = mysqli_fetch_assoc($result);
    
    $_SESSION['Name']=  $row['Name']; 

        $_SESSION['dob'] = $row['dob'];
        $_SESSION['area'] = $row['area'];
        $_SESSION['city'] = $row['city'];
        $_SESSION['pincode'] = $row['pincode'];
        $_SESSION['mobno'] = $row['mobno'];
        $_SESSION['npassword'] = $row['password'];
        $_SESSION['cpassword'] = $row['password'];
    
    

		if(($row['email'] == $name) && ( $row['password'] == $pwd)){

         echo"<script>
            window.location.href='donor_edit_display.php'
            </script>";
			  
	}
	else{
		echo" <script>

			alert('User does not exist');
			 window.location.href='signui.php';
			  </script>";
	}


	
}

}

?>
