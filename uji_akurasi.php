<?php
//session_start();
if (!isset($_SESSION['kepribadian_naive_bayes_id'])) {
    header("location:index.php?menu=forbidden");
}

include_once "database.php";
include_once "fungsi.php";
include_once "fungsi_proses.php";
include_once "import/excel_reader2.php";
?>
<div class="content-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line">Uji Akurasi</h4>
            </div>
        </div>
        <?php
        //object database class
        $db_object = new database();

        $pesan_error = $pesan_success = "";
        if (isset($_GET['pesan_error'])) {
            $pesan_error = $_GET['pesan_error'];
        }
        if (isset($_GET['pesan_success'])) {
            $pesan_success = $_GET['pesan_success'];
        }

        if (isset($_POST['submit'])) {
            // if(!$input_error){
            $data = new Spreadsheet_Excel_Reader($_FILES['file_data_uji']['tmp_name']);

            $baris = $data->rowcount($sheet_index = 0);
            $column = $data->colcount($sheet_index = 0);
            //import data excel dari baris kedua, karena baris pertama adalah nama kolom
            // $temp_date = $temp_produk = "";
            for ($i=2; $i<=$baris; $i++) {
//                for($c=1; $c<=$column; $c++){
//                    $value[$c] = $data->val($i, $c);
//                }
                $value = "(\"".$data->val($i, 2)."\", '".$data->val($i, 3)."', "
                        .$data->val($i, 4).", '".$data->val($i, 5)."', "
                        .$data->val($i, 6).", ".$data->val($i, 7).", "
                        .$data->val($i, 8).", ".$data->val($i, 9).", '".$data->val($i, 10)."')";
                $sql = "INSERT INTO data_uji "
                    . " (nama, jenis_kelamin, usia, sekolah, jawaban_a, jawaban_b, jawaban_c, jawaban_d, kelas_asli)"
                    . " VALUES ".$value;
                $result = $db_object->db_query($sql);
            }
            //$values = implode(",", $value);
            
            if($result){
                ?>
                <script> location.replace("?menu=uji_akurasi&pesan_success=Data berhasil disimpan");</script>
                <?php
            }
            else{
                ?>
                <script> location.replace("?menu=uji_akurasi&pesan_error=Data gagal disimpan");</script>
                <?php
            }
        }

        if (isset($_POST['delete'])) {
            $sql = "TRUNCATE data_uji";
            $db_object->db_query($sql);
            ?>
            <script> location.replace("?menu=uji_akurasi&pesan_success=Data uji berhasil dihapus");</script>
            <?php
        }
        
        $sql = "SELECT * FROM data_uji";
        $query = $db_object->db_query($sql);
        $jumlah = $db_object->db_num_rows($query);
        ?>

        <div class="row">
            <div class="col-md-12">
                <!--UPLOAD EXCEL FORM-->
                <form method="post" enctype="multipart/form-data" action="">
                    <div class="form-group">
                        <div class="input-group">
                            <label>Import data from excel</label>
                            <input name="file_data_uji" type="file" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <input name="submit" type="submit" value="Upload Data" class="btn btn-success">
                    
                        <button name="delete" type="submit"  class="btn btn-danger" onclick="">
                            <i class="fa fa-trash-o"></i> Delete All Data Uji
                        </button>
                    </div>
                    
                    <div class="form-group">
                        <button name="uji_akurasi" type="submit"  class="btn btn-default" onclick="">
                            <i class="fa fa-check"></i> Uji Akurasi
                        </button>
                    </div>
                </form>

                <?php
                if (!empty($pesan_error)) {
                    display_error($pesan_error);
                }
                if (!empty($pesan_success)) {
                    display_success($pesan_success);
                }


                echo "Jumlah data: " . $jumlah . "<br>";
                if ($jumlah == 0) {
                    echo "Data kosong...";
                } 
                else {
                    ?>
                    <strong>DATA UJI:</strong>
                    <table class='table table-bordered table-striped  table-hover'>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Jenis Kelamin</th>
                            <th>Usia</th>
                            <th>Sekolah</th>
                            <th>Jawaban A</th>
                            <th>Jawaban B</th>
                            <th>Jawaban C</th>
                            <th>Jawaban D</th>
                            <th>Kelas Asli</th>
                        </tr>
                        <?php
                        $no = 1;
                        while ($row = $db_object->db_fetch_array($query)) {
                            echo "<tr>";
                            echo "<td>" . $no . "</td>";
                            echo "<td>" . $row['nama'] . "</td>";
                            echo "<td>" . $row['jenis_kelamin'] . "</td>";
                            echo "<td>" . $row['usia'] . "</td>";
                            echo "<td>" . $row['sekolah'] . "</td>";
                            echo "<td>" . $row['jawaban_a'] . "</td>";
                            echo "<td>" . $row['jawaban_b'] . "</td>";
                            echo "<td>" . $row['jawaban_c'] . "</td>";
                            echo "<td>" . $row['jawaban_d'] . "</td>";
                            echo "<td>" . $row['kelas_asli'] . "</td>";
                            echo "</tr>";
                            $no++;
                        }
                        ?>
                    </table>
                    <?php
                }
                
                if(isset($_POST['uji_akurasi'])){
                    //proses menghitung naive bayes
                    //loop data uji nya
                    $sql_hit = "SELECT * FROM data_uji ";
                    $res = $db_object->db_query($sql_hit);
                    $aa=1;
                    while($row = $db_object->db_fetch_array($res)){
                        echo "<center>";
                        echo "<b>Data Uji ke-".$aa."</b>";
                        ProsesNaiveBayes($db_object, $row['id'], $row['jenis_kelamin'], $row['usia'], $row['sekolah'], 
                                $row['jawaban_a'], $row['jawaban_b'], $row['jawaban_c'], $row['jawaban_d']);
                        $aa++;
                        echo "<br><br>";
                        echo "</center>";
                    }
                }
                ?>
            </div>
        </div>
    </div>
</div>

