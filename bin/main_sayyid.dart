import 'dart:io';

void main() {
  ManajemenSiswaSayyid manajemenSiswa = ManajemenSiswaSayyid();
  bool isRunning = true;

  //pbo_as4_xii_sayyid

  //tambah data
  //edit data
  //hapus data
    //hapus data-nis
    //hapus data-nama
    //hapus data-kelas
    //kembali
  //cari data
    //cari data-nis
    //cari data-nama
    //cari data-kelas
    //kembali
  //lihat data
  //keluar

  //tambahkan field alamat di class

  //update sesuai perintah atas di manajemen siswa

  //file main tersebut minimum dikumpulkan 15 menit sebelum ujian berakhir                                     

  while (isRunning) {
    print('\n===MENU UTAMA PENDATAAN SISWA by Sayyid===');
    print('1. Tambah Data Siswa');
    print('2. Lihat Data Siswa');
    print('3. Hapus Data Siswa');
    print('4. Keluar');
    stdout.write('Pilih Menu 1-2-3-4: ');
    String? pilihan = stdin.readLineSync()?.trim();

    switch (pilihan) {
      case '1':
        Map<String, dynamic> studentDetails =
            manajemenSiswa.inputStudentDetails();
        if (studentDetails.isNotEmpty) {
          manajemenSiswa.tambahSiswa(
            SiswaSayyid(studentDetails['nama'], studentDetails['umur'],
                studentDetails['nis'], studentDetails['kelas']),
          );
        }
        break;
      case '2':
        manajemenSiswa.lihatSiswa();
        break;
      case '3':
        stdout.write('Masukkan NIS yang akan dihapus: ');
        String? nis = stdin.readLineSync()?.trim();
        if (nis != null) {
          manajemenSiswa.hapusSiswa(nis);
        } else {
          print('NIS tidak valid.');
        }
        break;
      case '4':
        isRunning = false;
        print('===Terima Kasih===');
        break;
      default:
        print('Pilihan tidak valid.');
        break;
    }
  }
}

class PersonSayyid {
  String nama;
  int umur;

  PersonSayyid(this.nama, this.umur);

  void displayInfo() {
    print('Nama: $nama, Umur: $umur');
  }
}

class SiswaSayyid extends PersonSayyid {
  String nis;
  String kelas;

  SiswaSayyid(super.nama, super.umur, this.nis, this.kelas);

  @override
  void displayInfo() {
    print('- NIS: $nis, Nama: $nama, Umur: $umur, Kelas: $kelas');
  }
}

class ManajemenSiswaSayyid {
  List<SiswaSayyid> daftarSiswa = [];

  void tambahSiswa(SiswaSayyid siswa) {
    daftarSiswa.add(siswa);
    print('Siswa berhasil ditambahkan.');
  }

  void lihatSiswa() {
    if (daftarSiswa.isEmpty) {
      print('Belum ada data siswa.');
    } else {
      for (var siswa in daftarSiswa) {
        siswa.displayInfo();
      }
    }
  }

  void hapusSiswa(String nis) {
    bool found = false;
    for (var siswa in daftarSiswa) {
      if (siswa.nis == nis) {
        daftarSiswa.remove(siswa);
        print('Siswa dengan NIS $nis berhasil dihapus.');
        found = true;
        break;
      }
    }
    if (!found) {
      print('Siswa dengan NIS $nis tidak ditemukan.');
    }
  }

  Map<String, dynamic> inputStudentDetails() {
    stdout.write('Masukkan Nama: ');
    String? nama = stdin.readLineSync()?.trim();
    stdout.write('Masukkan Umur: ');
    int? umur = int.tryParse(stdin.readLineSync()?.trim() ?? '');
    stdout.write('Masukkan NIS: ');
    String? nis = stdin.readLineSync()?.trim();
    stdout.write('Masukkan Kelas: ');
    String? kelas = stdin.readLineSync()?.trim();
    if (nama == null || umur == null || nis == null || kelas == null) {
      print('Data tidak valid. Harap ulangi.');
      return inputStudentDetails();
    }
    return {'nama': nama, 'umur': umur, 'nis': nis, 'kelas': kelas};
  }
}
