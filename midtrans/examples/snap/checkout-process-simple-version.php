<?php
// This is just for very basic implementation reference, in production, you should validate the incoming requests and implement your backend more securely.
// Please refer to this docs for snap popup:
// https://docs.midtrans.com/en/snap/integration-guide?id=integration-steps-overview

namespace Midtrans;

require_once dirname(__FILE__) . '/../../Midtrans.php';
// Set Your server key
// can find in Merchant Portal -> Settings -> Access keys
Config::$serverKey = 'SB-Mid-server-sO8CNdea8LJqF2fsduLN5PuO';
Config::$clientKey = 'SB-Mid-client-T2Hb3FWlgc3XaENd';

// non-relevant function only used for demo/example purpose
printExampleWarningMessage();

// Uncomment for production environment
// Config::$isProduction = true;
Config::$isSanitized = Config::$is3ds = true;

// Required

include "../../../dbconnect.php";
$order_id = $_GET['order_id'];

// Query untuk menampilkan data siswa berdasarkan NIS yang dikirim
$query = "SELECT * FROM payment WHERE order_id='" . $order_id . "'";
$sql = mysqli_query($conn, $query);  // Eksekusi/Jalankan query dari variabel $query
$data = mysqli_fetch_array($sql);

$nama = $data['nama'];
$email = $data['email'];
// $no_hp = $data['no_hp'];
$biaya = $data['biaya'];
// $nama_kategori = $data['nama_kategori'];
$jumlah = 1;
$transaction_details = array(
    'order_id' => $order_id,
    'gross_amount' =>  $biaya, // no decimal allowed for creditcard
);
// Optional
$item_details = array(
    array(
        'id' => 'a1',
        'price' => $biaya,
        'quantity' => $jumlah,
        'name' => "Pembayaran"
    ),
);
// Optional
$customer_details = array(
    'first_name'    => "$nama",
    'last_name'     => "",
    'email'         => "$email",
    // 'phone'         => "$no_hp",
    // 'billing_address'  => $billing_address,
    // 'shipping_address' => $shipping_address
);
// Fill transaction details
$transaction = array(
    'transaction_details' => $transaction_details,
    'customer_details' => $customer_details,
    'item_details' => $item_details,
);

$snap_token = '';
try {
    $snap_token = Snap::getSnapToken($transaction);
} catch (\Exception $e) {
    echo $e->getMessage();
}


function printExampleWarningMessage()
{
    if (strpos(Config::$serverKey, 'your ') != false) {
        echo "<code>";
        echo "<h4>Please set your server key from sandbox</h4>";
        echo "In file: " . __FILE__;
        echo "<br>";
        echo "<br>";
        echo htmlspecialchars('Config::$serverKey = \'SB-Mid-server-sO8CNdea8LJqF2fsduLN5PuO\';');
        die();
    }
}

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PAYMENT </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body style="  display:flex; flex-direction:column; justify-content:center; align-items: center; min-height:90vh;">
    <br>
    <br>
    <div class="container">
        <div class="card">
            <div class="card-body" style=" box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);">
                <center>
                    <b>
                <p>Pembayaranmu hampir selesai nihh!!! <br> <br> Yukk.. Selesaikan sekarang dengan memilih metode pembayaranmu</p>
                </b>
                <lottie-player src="https://lottie.host/aec8b6b0-1a87-4f2b-ac6e-015a71657b69/ri76ASujUg.json" background="transparent"  speed="1"  style="width: 250px; height: 250px;" loop autoplay></lottie-player>
               <br>
                <button id="pay-button" class="btn" style="padding-left:15px; padding-right: 15px; background-color: #fe3f26; color: white">PILIH METODE PEMBAYARAN</button>
                <br>
                <!-- TODO: Remove ".sandbox" from script src URL for production environment. Also input your client key in "data-client-key" -->
                <script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="<?php echo Config::$clientKey; ?>"></script>
                <script type="text/javascript">
                    document.getElementById('pay-button').onclick = function() {
                        // SnapToken acquired from previous step
                        snap.pay('<?php echo $snap_token ?>');
                    };
                </script>
                </center>
            </div>
        </div>
    </div>
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>

</html>

</html>