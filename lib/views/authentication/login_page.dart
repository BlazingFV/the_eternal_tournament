import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_eternal_tournament/configs/app_configs.dart';
import 'package:the_eternal_tournament/shared/custom_clipper.dart';
import 'package:the_eternal_tournament/views/authentication/widgets/login_page_mobile_widget.dart';

import '../../shared/login_button_widget.dart';
import 'widgets/login_page_web_widget.dart';

class LoginPage extends StatefulWidget {
  final bool isMobile;
  const LoginPage({Key? key, required this.isMobile}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final CarouselController _controller = CarouselController();
  final ScrollController _scrollController = ScrollController();
  int current = 0;
  final List<Widget> imagesList = [
    Image.asset(
      'assets/icons/arena_de_combate.png',
      width: ScreenUtil().screenWidth / 2,
      // height: ScreenUtil().screenHeight,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/icons/arena.png',
      width: ScreenUtil().screenWidth / 2,
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
    log('=========================Screen Width: ${ScreenUtil().screenWidth}=========================');
    log('=========================Screen Height: ${ScreenUtil().screenHeight}=========================');
    return ScreenUtil().screenWidth<500
        ? LoginPageForMobile()
        : LoginPageForWebAndTablet(
            scrollController: _scrollController,
            leftSlider: leftSideImageSlider(),
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
