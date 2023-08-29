<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Pembelian</title>
    <style Type="text/css">
        @import "media/css/demo_table_jui.css";
        @import "media/themes/sunny/jquery-ui-1.8.4.custom.css";
        @import "extras/TableTools/media/css/TableTools.css";
    </style>
    <script src="media/js/jquery.js"></script>
    <script src="media/js/jquery.dataTables.js"></script>
    <script src="extras/TableTools/media/js/zeroClipboard.js"></script>
    <script src="extras/TableTools/media/js/TableTools.js"></script>
    <script Type="text/javascript">
        $ (document).ready(function(){
            oTable = $('#contoh').dataTable({
                "bJqueryUI" : true,
                "sPaginationType": "full_numbers",

                "sDom": 'T<"clear">1frtip',
                "oTableTools";{
                "sSwfPath": "extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
                },
                "oLanguage": {
                "sLengthMenu": "Tampilan_MENNU_data",
                "sSearch": "Cari :",
                "sZeroRecords": "Tidak ditemukan data yang sesuai",
                "sInfo": "_START_sampai_END_dari_TOTAL_data",
                "sInfoEmpty": "0 hingga 0 dari entri",
                "sInfoFiltered": "(disaring dari_MAX_entri keseluruhan)",
                
                "oPaginate"{
                    "sFirst": "Awal",
                    "sLast": "Akhir",
                    "sPrevious": "Baik",
                    "sNext": "Lanjut"
                }
              }
            });
        })
    </script>
</head>
<body>
    <table id="contoh" class="display">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Jumlah</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            $konek = mysqli_connect("localhost","root","","perpus")
            $orderids = mysqli_real_escape_string($conn, $orderids);
			$query = "SELECT * FROM detail_pinjam d, produk p WHERE orderid='$orderids' AND d.idproduk=p.idproduk ORDER BY d.idproduk ASC";
			$no=1;
			while($p=mysqli_fetch_array($brgs)){
												
			?>
												
			<tr>
			<td><?php echo $no++ ?></td>
			<td><?php echo $p['namaproduk'] ?></td>
			<td><?php echo $p['qty'] ?></td>
			</tr>
			<?php 
			    }
			?>
        </tbody>
    </table>
</body>
</html>