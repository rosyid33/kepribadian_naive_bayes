<?php 
$menu = '';
if(isset($_GET['menu'])){
    $menu = $_GET['menu'];
}

?>
<!-- HEADER END-->
<div class="navbar navbar-inverse set-radius-zero" style="height: 90px;">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="" style="width: 950px;">
                Klasifikasi Karakteristik Kepribadian Manusia 
                (Metode Naïve Bayes)
            </a>
        </div>

    </div>
</div>

<!-- LOGO HEADER END-->
<section class="menu-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="navbar-collapse collapse ">
                    <ul id="menu-top" class="nav navbar-nav navbar-right">
                        <li><a <?php echo ($menu==''||$menu=='home')?"class='menu-top-active'":""; ?> 
                             href="index.php">Home</a></li>
                        <?php
                        if (empty($_SESSION['kepribadian_naive_bayes_id'])) {
                        ?>
                            <li><a href="login.php">Login</a></li>
                        <?php 
                        }
                        else{
                            if($_SESSION['kepribadian_naive_bayes_level'] == 2){
                                ?>
                                <li><a <?php echo ($menu=='klasifikasi')?"class='menu-top-active'":""; ?>
                                        href="index.php?menu=klasifikasi">Klasifikasi</a></li>
                                <?php
                            }
                            else{
                                ?>
                                <li><a <?php echo ($menu=='data_latih')?"class='menu-top-active'":""; ?>
                                        href="index.php?menu=data_latih">Data Latih</a></li>
                                <li><a <?php echo ($menu=='data_soal')?"class='menu-top-active'":""; ?>
                                        href="index.php?menu=data_soal">Data Soal</a></li>
                                <li><a <?php echo ($menu=='uji_akurasi')?"class='menu-top-active'":""; ?> 
                                        href="index.php?menu=uji_akurasi">Uji Akurasi</a></li>
                                
                                <li><a <?php echo ($menu=='laporan_hasil')?"class='menu-top-active'":""; ?> 
                                        href="index.php?menu=laporan_hasil">Laporan Hasil Klasifikasi</a></li>
                                <li><a <?php echo ($menu=='data_siswa')?"class='menu-top-active'":""; ?> 
                                        href="index.php?menu=data_siswa">Data Siswa</a></li>
                                <?php
                            }
                            ?>
                            <li><a href="logout.php">Logout</a></li>
                            <?php
                        }
                        ?>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- MENU SECTION END-->