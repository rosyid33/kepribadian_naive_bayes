<?php
//session_start();
if (!isset($_SESSION['kepribadian_naive_bayes_id'])) {
    header("location:index.php?menu=forbidden");
}

include_once "database.php";
include_once "fungsi.php";

?>
<div class="content-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4 class="page-head-line">Laporan Hasil</h4>
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

        if (isset($_POST['delete'])) {
            $sql = "TRUNCATE data_hasil_klasifikasi";
            $db_object->db_query($sql);
            ?>
            <script> location.replace("?menu=data_latih&pesan_success=Data hasil berhasil dihapus");</script>
            <?php
        }

        $sql = "SELECT siswa.`nama_siswa`, hasil.* 
            FROM data_hasil_klasifikasi hasil,
            data_siswa siswa
            WHERE siswa.`id` = hasil.`id_siswa`";
        $query = $db_object->db_query($sql);
        $jumlah = $db_object->db_num_rows($query);
        ?>

        <div class="row">
            <div class="col-md-12">
                <!--UPLOAD EXCEL FORM-->
                <!--<form method="post"  action="">-->
<!--                    <div class="form-group">
                        <div class="input-group">
                            <label>Import data from excel</label>
                            <input name="file_data_latih" type="file" class="form-control">
                        </div>
                    </div>-->
<!--                    <div class="form-group">
                        <input name="submit" type="submit" value="Upload Data" class="btn btn-success">
                    
                        <button name="delete" type="submit"  class="btn btn-danger" onclick="">
                            <i class="fa fa-trash-o"></i> Delete All Data Hasil
                        </button>
                    </div>-->
                <!--</form>-->

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
                            <th>Kelas Hasil</th>
                        </tr>
                        <?php
                        $no = 1;
                        while ($row = $db_object->db_fetch_array($query)) {
                            echo "<tr>";
                            echo "<td>" . $no . "</td>";
                            echo "<td>" . $row['nama_siswa'] . "</td>";
                            echo "<td>" . $row['jenis_kelamin'] . "</td>";
                            echo "<td>" . $row['usia'] . "</td>";
                            echo "<td>" . $row['sekolah'] . "</td>";
                            echo "<td>" . $row['jawaban_a'] . "</td>";
                            echo "<td>" . $row['jawaban_b'] . "</td>";
                            echo "<td>" . $row['jawaban_c'] . "</td>";
                            echo "<td>" . $row['jawaban_d'] . "</td>";
                            echo "<td>" . $row['kelas_hasil'] . "</td>";
                            echo "</tr>";
                            $no++;
                        }
                        ?>
                    </table>
                    <?php
                }
                ?>
            </div>
        </div>
    </div>
</div>

