import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configs/app_configs.dart';
import '../../../shared/login_button_widget.dart';
import 'background_custom_clipper.dart';

class LoginPageForMobile extends StatefulWidget {
  @override
  State<LoginPageForMobile> createState() => _LoginPageForMobileState();
}

class _LoginPageForMobileState extends State<LoginPageForMobile> {
  final CarouselController _controller = CarouselController();

  final ScrollController _scrollController = ScrollController();

  int current = 0;

  final List<Widget> imagesList = [
    Image.asset(
      'assets/images/xzXLK6exq3yz8TPpgHKp6F-970-80.png',
      height: 372.h,
      width: 428.w,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/Rainbow-Six-Siege-Team-1.png',
      height: 372.h,
      width: 428.w,
      // height: ScreenUtil().screenHeight,
      fit: BoxFit.cover,
    ),
    FittedBox(
      fit: BoxFit.cover,
      child: Image.asset(
        'assets/images/capsule_616x353.png',
      ),
    ),
    FittedBox(
      fit: BoxFit.cover,
      child: Image.asset(
        'assets/images/unnamed.png',
      ),
    ),
  ];

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
     context,
     designSize: const Size(428, 926),
      minTextAdapt: true,
      
    );
    return Scaffold(
      // backgroundColor: AppConfigs.loginPageBGColor,
      body: Stack(
        // alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            // bottom:0,
            child: imageSlider(),
          ),
          Positioned(
            left: 0,
            top: 328.h,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                // topRight: Radius.circular(30.r),
              ),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                decoration: BoxDecoration(
                  color: AppConfigs.loginPageBGColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                    left: 0.w,
                    child: const BackGroundCustomClipper(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 18.h),
                      AutoSizeText(
                        'Login',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff192248),
                          fontSize: ScreenUtil().setSp(22),
                        ),
                        // maxFontSize:35,
                      ),
                      AutoSizeText('Please login to your account',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff818BB3),
                            fontSize: ScreenUtil().setSp(15),
                          ),
                          // maxFontSize:35,
                          textAlign: TextAlign.center),
                      SizedBox(height: 30.h),
                      LoginButtonWidget(
                        imagePath: 'assets/icons/google_logo.svg',
                        onClickButton: () {},
                        title: 'Login With Google',
                      ),
                      SizedBox(height: 30.h),
                      LoginButtonWidget(
                        imagePath: 'assets/icons/apple_logo.svg',
                        onClickButton: () {},
                        title: 'Login With Apple',
                      ),
                      SizedBox(height: 30.h),
                      LoginButtonWidget(
                        imagePath: 'assets/icons/twitter_logo.svg',
                        onClickButton: () {},
                        title: 'Login With Twitter',
                      ),
                      SizedBox(height: 30.h),
                      AutoSizeText.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account? ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff4089B9),
                                fontSize: ScreenUtil().setSp(15),
                              )),
                          TextSpan(
                            text: 'Register now',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff192248),
                              fontSize: ScreenUtil().setSp(15),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 30.h),
                      Image.asset(
                        'assets/icons/logo.png',
                        width: 112.w,
                        height: 112.h,
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
          Positioned(
            top: 277.h,
            left: 158.w,
            right: 158.w,
            child: Container(
              height: 112.h,
              width: 112.w,
              // margin: EdgeInsets.only(bottom: 67.h),
              padding: EdgeInsets.fromLTRB(19.w, 19.h, 18.33.w, 18.33.h),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffBBC2DD),
                    Color(0xff386FC7),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/icons/bottom_logo.png',
                height: 74.67.h,
                width: 74.67.w,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container imageSlider() {
    return Container(
      alignment: Alignment.centerLeft,
      // color: Colors.amber,
      // width: ScreenUtil().screenWidth * 0.5,
      height: 372.h,
      width: ScreenUtil().screenWidth,

      // height: 1117.h,
      child: Stack(
        alignment:Alignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: imagesList.length,
            itemBuilder: (context, index, pageViewIndex) {
              return imagesList[index];
            },
            carouselController: _controller,

            options: CarouselOptions(
              height: 372.h,
              disableCenter: true,

              // aspectRatio: 17 / 18,

              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              // enlargeCenterPage: true,
              // aspectRatio: 2.0,
              autoPlay: false,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              viewportFraction: 1,
              onPageChanged: onPageChange,
              pageSnapping: true,

              // initialPage: 1,
              // enableInfiniteScroll: true,
              // reverse: false,
              // autoPlay: true,
              // autoPlayInterval: Duration(seconds: 3),
              // autoPlayAnimationDuration: Duration(milliseconds: 800),
              // autoPlayCurve: Curves.fastOutSlowIn,
              // pauseAutoPlayOnTouch: Duration(seconds: 10),
              // scrollDirection: Axis.horizontal,
            ),
            // items: imagesList,
          ),
          Positioned(
            top: ScreenUtil().setHeight(35),
            left: ScreenUtil().setWidth(30),
            child: SizedBox(
              width: 200.w,
              // height:30.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/cd_player_icon.svg',
                    width: ScreenUtil().setWidth(30),
                    height: ScreenUtil().setHeight(30),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(6)),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Madness Heavy',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            // fontSize:23,
                          ),

                          // minFontSize: ScreenUtil().setSp(16),
                          minFontSize: 11,
                          maxFontSize: 12,
                        ),
                        AutoSizeText(
                          'Joe',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff192248),
                          ),
                          minFontSize: 9,
                          maxFontSize: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 226.h,
           
            child: Container(
              constraints:BoxConstraints(
                minWidth: ScreenUtil().screenWidth,
                maxWidth:ScreenUtil().screenWidth,
                minHeight:ScreenUtil().screenHeight*0.05,
                maxHeight: ScreenUtil().screenHeight*0.1
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagesList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: current == entry.key ? 8.0.w : 8.0.w,
                        height: 8.0.h,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0.h, horizontal: 12.0.w),
                        decoration: BoxDecoration(
                          shape: current == entry.key
                              ? BoxShape.circle
                              : BoxShape.circle,
                          // borderRadius: current == entry.key
                          //     ? BorderRadius.circular(55)
                          //     : BorderRadius.circular(65.r),
                          color:
                              current == entry.key ? Colors.white : Colors.grey,
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 0.7,
                          ),
                        ),
                      ),
                    );
                  }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
