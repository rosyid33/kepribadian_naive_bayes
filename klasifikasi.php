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
                <h4 class="page-head-line">Klasifikasi</h4>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <?php
                //object database class
                $db_object = new database();
                $sql = "SELECT * FROM data_soal";
                $query = $db_object->db_query($sql);
                $jumlah = $db_object->db_num_rows($query);

                $pesan_error = $pesan_success = "";
                if (isset($_GET['pesan_error'])) {
                    $pesan_error = $_GET['pesan_error'];
                }
                if (isset($_GET['pesan_success'])) {
                    $pesan_success = $_GET['pesan_success'];
                }

                if (isset($_POST['submit'])) {
                    $success = true;
                    $lihat_hasil = false;
                    $pesan_gagal = $pesan_sukses = "";
                    $idSiswa = $_SESSION['kepribadian_naive_bayes_id_siswa'];
                    if($idSiswa <=0){
                        $success = false;
                        $pesan_gagal = "Anda bukan siswa";
                    }
                    
                    if(sudah_klasifikasi($db_object, $idSiswa)){
                        $success = false;
                        $lihat_hasil = true;
                        $pesan_gagal = "Anda sudah melakukan klasifikasi";
                    }
                    
                    if($success){
                    $val_in = $di_jawab_a = $di_jawab_b = $di_jawab_c = $di_jawab_d = array();
                    foreach ($_POST['soal'] as $key => $value) {
                        if(empty($value)){
                            $success = false;
                            $pesan_gagal = "Ada yang belum diisi";
                            break;
                        }
                        //key = id_soal, value=jawaban A/B/C/D
                        $val_in[] = "(".$_SESSION['kepribadian_naive_bayes_id'].",".$idSiswa.
                                ",".$key.",'".$value."')";
                        if($value=='A'){
                            $di_jawab_a[] = $key;
                        }
                        if($value=='B'){
                            $di_jawab_b[] = $key;
                        }
                        if($value=='C'){
                            $di_jawab_c[] = $key;
                        }
                        if($value=='D'){
                            $di_jawab_d[] = $key;
                        }

                    }
                    //insert ke jawaban_kuisioner
                    if($idSiswa > 0){
                        $value_sql_to_in = implode(",", $val_in);
                        $sql_in_jawaban = "INSERT INTO jawaban_kuisioner
                                            (id_user, id_siswa, id_soal, jawaban)
                                            VALUES ".$value_sql_to_in;
                        $db_object->db_query($sql_in_jawaban);

                        //hitung naive bayes
                        $siswa = get_data_siswa($db_object, $idSiswa);
                        $jawaban_a = count($di_jawab_a);
                        $jawaban_b = count($di_jawab_b);
                        $jawaban_c = count($di_jawab_c);
                        $jawaban_d = count($di_jawab_d);
                        $hasil = ProsesNaiveBayes($db_object, 0, $siswa['jenis_kelamin'], $siswa['usia'], $siswa['sekolah'], 
                            $jawaban_a, $jawaban_b, $jawaban_c, $jawaban_d, false);

                        //simpan ke table hasil
                        $sql_in_hasil = "INSERT INTO data_hasil_klasifikasi
                                    (id_siswa, jenis_kelamin, usia, sekolah, jawaban_a, jawaban_b, jawaban_c, jawaban_d, 
                                    kelas_hasil, nilai_sanguin, nilai_koleris, nilai_melankolis, nilai_plegmatis)
                                    VALUES
                                    ($idSiswa, '".$siswa['jenis_kelamin']."', ".$siswa['usia'].", '".$siswa['sekolah']."', "
                                .$jawaban_a. ", ".$jawaban_b.", ".$jawaban_c.", ".$jawaban_d.", "
                                . "'".$hasil[0]."', '".$hasil[1]."', '".$hasil[2]."', '".$hasil[3]."', '".$hasil[4]."')";
                        $db_object->db_query($sql_in_hasil);
                        
                        //simpan juga ke data uji
                        $sql_data_uji = "INSERT INTO data_uji"
                                . "(nama, jenis_kelamin, usia, sekolah, jawaban_a, jawaban_b, jawaban_c, jawaban_d, kelas_asli) "
                                . " VALUES "
                                . " ('".$siswa['nama_siswa']."' , '".$siswa['jenis_kelamin']."' , '".$siswa['usia']."' "
                                . ", '".$siswa['sekolah']."' , '".$jawaban_a."' , '".$jawaban_b."' "
                                . ", '".$jawaban_c."' , '".$jawaban_d."' , '".$hasil[0]."' ) ";
                        $db_object->db_query($sql_data_uji);
                        //nama, jenis_kelamin, usia, sekolah, jawaban_a, jawaban_b, jawaban_c, jawaban_d, kelas_asli
                    }
                    
                    }
                    

                    if ($success) {
                        echo "Klasifikasi karakteristik kepribadian Anda: ".$hasil[0];
                        echo "<br>";
                        echo "Probabilitas:";
                        echo "<br>";
                        echo "Nilai Sanguin:".$hasil[1];
                        echo "<br>";
                        echo "Nilai Koleris:".$hasil[2];
                        echo "<br>";
                        echo "Nilai Melankolis:".$hasil[3];
                        echo "<br>";
                        echo "Nilai Plegmatis:".$hasil[4];
                    } 
                    else {
                        display_error($pesan_gagal);
                        if($lihat_hasil){
                            $hasilSiswa = get_hasil_klasifikasi($db_object, $idSiswa);
                            echo "Klasifikasi karakteristik kepribadian Anda: ".$hasilSiswa['kelas_hasil'];
                            echo "<br>";
                            echo "Probabilitas:";
                            echo "<br>";
                            echo "Nilai Sanguin:".$hasilSiswa['nilai_sanguin'];
                            echo "<br>";
                            echo "Nilai Koleris:".$hasilSiswa['nilai_koleris'];
                            echo "<br>";
                            echo "Nilai Melankolis:".$hasilSiswa['nilai_melankolis'];
                            echo "<br>";
                            echo "Nilai Plegmatis:".$hasilSiswa['nilai_plegmatis'];
                        }
                    }
                }
        
        
//                if (!empty($pesan_error)) {
//                    display_error($pesan_error);
//                }
//                if (!empty($pesan_success)) {
//                    display_success($pesan_success);
//                }
                                
                if (!isset($_POST['submit'])) {
                    if(sudah_klasifikasi($db_object, $_SESSION['kepribadian_naive_bayes_id_siswa'])){
                        $hasilSiswa = get_hasil_klasifikasi($db_object, $_SESSION['kepribadian_naive_bayes_id_siswa']);
                            echo "Klasifikasi karakteristik kepribadian Anda: ".$hasilSiswa['kelas_hasil'];
                            echo "<br>";
                            echo "Probabilitas:";
                            echo "<br>";
                            echo "Nilai Sanguin:".$hasilSiswa['nilai_sanguin'];
                            echo "<br>";
                            echo "Nilai Koleris:".$hasilSiswa['nilai_koleris'];
                            echo "<br>";
                            echo "Nilai Melankolis:".$hasilSiswa['nilai_melankolis'];
                            echo "<br>";
                            echo "Nilai Plegmatis:".$hasilSiswa['nilai_plegmatis'];
                    }
                    else{

                        if($jumlah <= 0){
                            echo "Data Soal masih belum ada...";
                        }
                        else{
                ?>
                <!--UPLOAD EXCEL FORM-->
                <form method="post" action="">
                    <?php
                    while($row = $db_object->db_fetch_array($query)){
                    ?>
                    <label>No. <?php echo $row['id']; ?></label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="soal[<?php echo $row['id']; ?>]" value="A" required=""/>
                            <?php echo $row['pilihan_a']; ?>
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="soal[<?php echo $row['id']; ?>]" value="B" required=""/>
                            <?php echo $row['pilihan_b']; ?>
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="soal[<?php echo $row['id']; ?>]" value="C" required=""/>
                            <?php echo $row['pilihan_c']; ?>
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="soal[<?php echo $row['id']; ?>]" value="D" required=""/>
                            <?php echo $row['pilihan_d']; ?>
                        </label>
                    </div>
                    <?php 
                    }
                    ?>

                    <div class="form-group">
                        <input name="submit" type="submit" value="Submit" class="btn btn-success">
                    </div>
                </form>
                <?php
                        }
                    }
                }
                ?>
            </div>
        </div>
    </div>
</div>

