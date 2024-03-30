import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latihan_strukturdata_diflutter/views/home.dart';
import 'package:latihan_strukturdata_diflutter/widget/card.dart';
import 'package:latihan_strukturdata_diflutter/widget/customPaint.dart';

class HomeTeacher extends StatelessWidget {
  const HomeTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final firstLayerHeight = screenHeight * 0.3;
    final secondLayerHeight = screenHeight - firstLayerHeight;
    List<Map<String, dynamic>> nmCard = [
      {'nm': 'Absen Mahasiswa', 'pict': "assets/absen.svg", "hsize": screenHeight / 4.5, "wsize" : screenHeight / 3, "hpsize": screenHeight / 6 },
      {'nm': 'Notes Teacher', 'pict': "assets/absen.svg", "hsize": screenHeight / 4.5, "wsize" : screenHeight / 3, "hpsize": screenHeight / 6 },
      {'nm': 'Nilai Mahasiswa', 'pict': "assets/absen.svg", "hsize": screenHeight / 4.5, "wsize" : screenHeight / 3, "hpsize": screenHeight / 6 },
    ];

    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: firstLayerHeight,
            width: screenWidth,
            color: Colors.blue,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hallo Teachers......!",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text("Have a good Day",
                    style: TextStyle(fontSize: 20, color: Colors.white))
              ],
            )),
        Positioned(
          top: firstLayerHeight,
          height: secondLayerHeight,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: CustomPaint(
              painter: myCustomPaint(),
              child: Container(),
            ),
          ),
        ),
        Positioned(
            top: 55,
            left: -25,
            child: SvgPicture.asset(
              'assets/Symbols.svg',
              height: 200,
            )),
        Positioned(
          top: 30,
          right: 0,
          child: ElevatedButton(
            child: Text("MyProfile"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black12,
            ),
            onPressed: () {},
          ),
        ),
        Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(
                height: 160,
              ),

              for (int i = 0; i < nmCard.length; i++)
              GestureDetector(
                child: buildCard(titileCard: "${nmCard[i]['nm']}", assetPic: "${nmCard[i]['pict']}", hsize: nmCard[i]['hsize'], wsize: nmCard[i]['wsize'], hpsize: nmCard[i]['hpsize']),
                onTap: (){
                  switch (i) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HighArrayExample()),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HighArrayExample()),
                      );
                      break;
                    default:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HighArrayExample()),
                      );
                  }
                },
              ),

            ]))
      ],
    ));
  }
}

