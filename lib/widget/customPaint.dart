import 'dart:math';
import 'package:flutter/material.dart';



class myCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.grey[600]!; // Warna pola
    paint.strokeWidth = 2;

    final random = Random();

    //Menggambar tabung secara acak
    for (int i = 0; i < 150; i++) {
      final centerX = random.nextDouble() * size.width;
      final centerY = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2 + 5;
      final width = random.nextDouble() * 10;
      final height = random.nextDouble() * 10;

      canvas.save(); // Simpan keadaan awal canvas
      canvas.translate(
          centerX, centerY); // Pindahkan titik pusat ke posisi elips
      canvas.rotate(
          30 * pi / 180); // Rotasi canvas sebesar 30 derajat (diubah ke radian)
      canvas.drawOval(
          Rect.fromCenter(center: Offset(0, 0), width: width, height: height),
          paint);
      canvas.restore(); // Kembalikan keadaan canvas ke sebelumnya
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
