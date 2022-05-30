import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_eternal_tournament/configs/app_configs.dart';
import 'package:the_eternal_tournament/shared/custom_clipper.dart';

import '../../shared/login_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final CarouselController _controller = CarouselController();
  final ScrollController _scrollController = ScrollController();
  int current = 0;
  final List<Widget> imagesList = [
    FittedBox(
      fit: BoxFit.fill,
      child: Image.asset(
        'assets/images/xzXLK6exq3yz8TPpgHKp6F-970-80.png',
        // width: ScreenUtil().screenWidth / 2,
        // height: ScreenUtil().screenHeight,
        // fit:BoxFit.fill,
      ),
    ),
    FittedBox(
      fit: BoxFit.fill,
      child: Image.asset(
        'assets/images/Rainbow-Six-Siege-Team-1.png',
      ),
    ),
    FittedBox(
      fit: BoxFit.fill,
      child: Image.asset(
        'assets/images/capsule_616x353.png',
      ),
    ),
    FittedBox(
      fit: BoxFit.fill,
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
    log('=========================Screen Width: ${ScreenUtil().screenWidth}=========================');
    log('=========================Screen Height: ${ScreenUtil().screenHeight}=========================');
    return Scaffold(
      backgroundColor: AppConfigs.loginPageBGColor,
      body: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: leftSideImageSlider(),
              ),
              Expanded(
                flex:1,
                child: SizedBox(
                  width: ScreenUtil().screenWidth * 0.5,
                  height: ScreenUtil().screenHeight,
                  child: Stack(
                    children: [
                      const BackGroundCustomClipper(),
                      Positioned(
                        left: 175.w,
                        top: ScreenUtil().screenHeight * 0.005,
                        child: SizedBox(
                          height: ScreenUtil().screenHeight,
                          child: Scrollbar(
                            controller: _scrollController,
                            isAlwaysShown: false,
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 70.h),
                                  Image.asset(
                                    'assets/icons/logo.png',
                                  ),
                                  AutoSizeText(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff192248),
                                      fontSize: ScreenUtil().setSp(35),
                                    ),
                                    // maxFontSize:35,
                                  ),
                                  AutoSizeText('Please login to your account',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff818BB3),
                                        fontSize: ScreenUtil().setSp(21),
                                      ),
                                      // maxFontSize:35,
                                      textAlign: TextAlign.center),
                                  SizedBox(height: 50.h),
                                  LoginButtonWidget(
                                    imagePath: 'assets/icons/google_logo.svg',
                                    onClickButton: () {},
                                    title: 'Login With Google',
                                  ),
                                  SizedBox(height: 40.h),
                                  LoginButtonWidget(
                                    imagePath: 'assets/icons/apple_logo.svg',
                                    onClickButton: () {},
                                    title: 'Login With Apple',
                                  ),
                                  SizedBox(height: 40.h),
                                  LoginButtonWidget(
                                    imagePath: 'assets/icons/twitter_logo.svg',
                                    onClickButton: () {},
                                    title: 'Login With Twitter',
                                  ),
                                  SizedBox(height: 50.h),
                                  AutoSizeText.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                          text:
                                              'By signing up, you are agree with our ',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff4089B9),
                                            fontSize: ScreenUtil().setSp(20),
                                          )),
                                      TextSpan(
                                        text: 'Terms and Conditions',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff192248),
                                          fontSize: ScreenUtil().setSp(20),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(height: 75.h),
                                  Container(
                                    height: 162.h,
                                    width: 162.w,
                                    margin: EdgeInsets.only(bottom: 67.h),
                                    padding: EdgeInsets.fromLTRB(
                                        30.w, 30.h, 24.w, 24.h),
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
                                        'assets/icons/bottom_logo.png'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // CustomPaint(
              //   painter: BackGroundClipper(),
              // )
            ],
          )),
    );
  }

  Container leftSideImageSlider() {
    return Container(
      alignment: Alignment.centerLeft,
      // color: Colors.amber,
      width: ScreenUtil().screenWidth * 0.5,
      // height: ScreenUtil().screenHeight,

      // height: 1117.h,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: imagesList.length,
            itemBuilder: (context, index, pageViewIndex) {
              return imagesList[index];
            },
            carouselController: _controller,

            options: CarouselOptions(
              height: ScreenUtil().screenHeight,
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
            top: ScreenUtil().setHeight(49),
            left: ScreenUtil().setWidth(66),
            child: SizedBox(
              width: ScreenUtil().screenWidth / 2,
              // height: ScreenUtil().screenHeight * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/cd_player_icon.svg',
                    width: ScreenUtil().setWidth(72),
                    height: ScreenUtil().setHeight(72),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(14.4)),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'Music Name will be Here',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            // fontSize:23,
                          ),

                          // minFontSize: ScreenUtil().setSp(16),
                          minFontSize: 16,
                          maxFontSize: 23,
                        ),
                        AutoSizeText(
                          'Artist Name',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff192248),
                          ),
                          minFontSize: 16,
                          maxFontSize: 23,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().screenHeight * 0.8570456580125335,
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imagesList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: current == entry.key ? 14.0.w : 14.0.w,
                      height: 14.0.h,
                      margin: EdgeInsets.symmetric(
                          vertical: 8.0.h, horizontal: 4.0.w),
                      decoration: BoxDecoration(
                        shape: current == entry.key
                            ? BoxShape.circle
                            : BoxShape.circle,
                        // borderRadius: current == entry.key
                        //     ? BorderRadius.circular(55)
                        //     : BorderRadius.circular(65.r),
                        color: current == entry.key
                            ? Colors.white
                            : Colors.transparent,
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 0.7,
                        ),
                      ),
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}

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
        width: ScreenUtil().screenWidth * 0.35,
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
