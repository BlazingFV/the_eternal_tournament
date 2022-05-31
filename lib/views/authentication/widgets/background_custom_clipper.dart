

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'package:the_eternal_tournament/shared/custom_clipper.dart';
class BackGroundCustomClipper extends StatelessWidget {
  const BackGroundCustomClipper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackGroundClipper(),
      child: Container(
        height: ScreenUtil().screenHeight,
        width:ScreenUtil().screenWidth<500?ScreenUtil().screenWidth * 0.70 :ScreenUtil().screenWidth * 0.35,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            const Color(0xffC8CEE8).withOpacity(1),
            Colors.white.withOpacity(0)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.repeated,
        )),
      ),
    );
  }
}