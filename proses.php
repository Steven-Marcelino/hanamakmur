<?php
// Load file koneksi.php
include "dbconnect.php";
// 
if (isset($_POST["register"])) {
$nama = $_POST['nama'];
$alamat = $_POST['alamat'];
$email = $_POST['email'];
$biaya = 25000;
$orderid= rand();
$transaction_status= 1;
$transaction_id = "";

// menginput data ke database
mysqli_query($conn,"insert into payment  values('','$nama','$alamat','$biaya','$email','$orderid','$transaction_status','$transaction_id')");
 
// mengalihkan halaman kembali ke index.php
header("location:./midtrans/examples/snap/checkout-process-simple-version.php?order_id=$orderid");

}
?>


