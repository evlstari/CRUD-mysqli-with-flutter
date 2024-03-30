import 'package:flutter/material.dart';
import 'package:latihan_strukturdata_diflutter/views/home.dart';
import 'package:latihan_strukturdata_diflutter/views/login.dart';
import 'package:lottie/lottie.dart';

class LoadWidget extends StatelessWidget {
  const LoadWidget({super.key});

  Future<String> loadingPage() async{
    await Future.delayed(Duration(seconds: 3 ));
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5399F5),
      body: FutureBuilder(
        future: loadingPage(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Tampilkan loading indicator saat data masih diambil
            return Center(
              child: Container(
                  width: 200,
                  child: Lottie.asset('assets/hand_animation.json')),
            );
          } else if (snapshot.hasError) {
            // Tampilkan pesan error jika terjadi kesalahan
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Tampilkan halaman home jika proses selesai
            return LoginPage();
          }
        },
      )
    );
  }
  
}
