import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:the_eternal_tournament/shared/login_button_widget.dart';
import 'package:the_eternal_tournament/views/authentication/widgets/background_custom_clipper.dart';

import '../../../configs/app_configs.dart';

class LoginPageForWebAndTablet extends StatelessWidget {
  const LoginPageForWebAndTablet({
    Key? key,
    required ScrollController scrollController,
    required Widget leftSlider,
  })  : _scrollController = scrollController,
        _leftSlider = leftSlider,
        super(key: key);

  final ScrollController _scrollController;
  final Widget _leftSlider;

  @override
  Widget build(BuildContext context) {
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
                child: _leftSlider,
              ),
              Expanded(
                flex: 1,
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
}
