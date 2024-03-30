import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildCard({
  required double? hsize,
  required double? wsize,
  required double? hpsize,
 required String? titileCard, required String? assetPic
}) {
  return Container(
    padding: EdgeInsets.all(5),
    height: hsize,
    width: wsize,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text("$titileCard"),
      SvgPicture.asset(
        '$assetPic',
        height: hpsize,
      )
    ]),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.white,
      border: Border.all(
        color: Color(0xFF5399F5),
        width: 2,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
  );

}