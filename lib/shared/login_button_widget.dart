import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButtonWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onClickButton;
  const LoginButtonWidget(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.onClickButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onClickButton,
      child: Container(
        alignment: Alignment.centerLeft,
        width: 514.w,
        height: 68.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(440.r),
          gradient: const LinearGradient(
            colors: [
              Color(0xffBBC2DD),
              Color(0xff386FC7),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
              height: 56.h,
              width: 56.h,
              margin: EdgeInsets.only(left:6.w,top: 6.h, bottom: 6.h),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                imagePath,
                // width: ScreenUtil().setWidth(15),
                // height: ScreenUtil().setHeight(15),
              ),
            ),
            SizedBox(
              width: 105.w,
            ),
            Center(
              child: AutoSizeText(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
