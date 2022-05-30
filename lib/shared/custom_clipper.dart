import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BackGroundClipper extends CustomClipper<Path> {
 

  @override
  Path getClip(Size size) {
   Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width * 0.4553187, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.close();
 return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
    // throw UnimplementedError();
  }
}
