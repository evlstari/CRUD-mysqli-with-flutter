import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latihan_strukturdata_diflutter/model/mhs_model.dart';

class HighArray {
  int nElement;
  List<Mahasiswa> arr;

  HighArray({required int max})
      : arr = [],
        nElement = 0;

  void insert(Mahasiswa mahasiswa) {
    arr.add(mahasiswa);
    nElement++;
  }

  bool findKey(int key) {
    int i;
    for (i = 0; i < nElement; i++) {
      if (arr[i] == key) {
        break;
      }
      return true;
    }
    if (i == nElement) {
      return false;
    } else {
      return true;
    }
  }

  bool delete(int value) {
    int i;
    for (i = 0; i < nElement; i++) {
      if (value == arr[i]) {
        break;
      }
    }
    if (i == nElement) {
      return false;
    } else {
      for (int j = i; j < nElement; j++) {
        arr[j] = arr[j + 1];
      }
      nElement--;
      return true;
    }
  }

  Future<void> deleteData(int x) async {
    arr.removeAt(x);
    nElement--;
  }

  void printAllMahasiswa() {
    arr.forEach((mahasiswa) {
      print(
          'Nama: ${mahasiswa.name}, NIM: ${mahasiswa.nim}, Asal: ${mahasiswa.asal}');
    });
  }
}

class MhsManager {
  HighArray highArray = HighArray(max: 100);
  List<Mahasiswa> dataList = [];

  Future<void> insertMahasiswa(String name, String nim, String asal) async {
    highArray.insert(Mahasiswa(name: name, nim: nim, asal: asal,));

    var url = Uri.parse('http://172.20.10.2/db_absenmhs/create.php/');
    try {
      var response = await http.post(
        url,
        body: {
          'name': name,
          'nim': nim,
          'asal': asal,
        },
      );

      if (response.statusCode == 200) {
        print("Message: ${response.statusCode}");
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

  Future<void> deleteMahasiswa(int x) async {
    highArray.deleteData(x);

    var url = Uri.parse("http://172.20.10.2/db_absenmhs/delete.php");
    try {
      var response = await http.post(
        url,
        body: {
          'id': x.toString(),
        },
      );

      if (response.statusCode == 200) {
        print("berhasil mengirim data");
      } else {
        print('Gagal mengirim data: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

  Future<List<Mahasiswa>> fetchMahasiswa() async {
    var url = Uri.parse("http://172.20.10.2/db_absenmhs/read.php");
    try{
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //final jsonData = json.decode(response.body);
        List<dynamic> jsonData = jsonDecode(response.body);
        dataList = jsonData.map((e) => Mahasiswa.fromJson(e)).toList();
        return dataList;
      } else {
        throw Exception('Failed to load data from server: ${response.reasonPhrase}');
      }
    }catch(e){
      // Tangani kesalahan saat melakukan permintaan HTTP
      print('Error fetching data: $e');
      throw Exception('Error fetching data: $e');
    }

  }

  // Fungsi untuk mengirim data ke server PHP
  Future<void> updateMahasiswa(int id, String name, String nim, String asal) async {
    // URL ke file PHP di server Anda
    String url = 'http://172.20.10.2/db_absenmhs/update.php';

    // Kirim data menggunakan metode POST
    var response = await http.post(Uri.parse(url), body: {
      'id': id.toString(),
      'name': name,
      'nim': nim,
      'asal': asal,
    });

    // Cek status response
    if (response.statusCode == 200) {
      print('Data mahasiswa berhasil diupdate.');
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }
}
