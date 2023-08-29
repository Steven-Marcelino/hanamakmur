<?php
// Kode untuk menghubungkan ke basis data dan melakukan query diperlukan di sini

if (isset($_POST['export'])) {
    // Query SQL untuk mengambil data dari basis data, misalnya:
    // $query = "SELECT * FROM detail_pinjam d, produk p WHERE d.orderid='$orderids' AND d.idproduk=p.idproduk ORDER BY d.idproduk ASC";
    // $result = mysqli_query($conn, $query);
    
    // Menggunakan perintah header untuk mengatur tipe konten file
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="data_pemesanan.csv"');
    
    // Membuka output stream untuk menulis data CSV
    $output = fopen('php://output', 'w');
    
    // Menulis baris header (nama kolom) ke dalam file CSV
    fputcsv($output, array('Kolom1', 'Kolom2', 'Kolom3'));
    
    // Loop melalui hasil query dan menulis baris data ke dalam file CSV
    while ($row = mysqli_fetch_assoc($result)) {
        fputcsv($output, $row);
    }
    
    // Tutup output stream
    fclose($output);
    
    // Keluar dari skrip setelah ekspor selesai
    exit;
}
?>

<!DOCTYPE html> 
<html>
<head>
    <title>Halaman Pemesanan</title>
</head>
<body>
    <!-- Isi konten halaman di sini -->

    <!-- Tombol untuk mengaktifkan ekspor data -->
    <form method="post">
        <button type="submit" name="export">Export Data</button>
    </form>
</body>
</html>
