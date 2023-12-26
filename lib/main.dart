import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'home.dart';
import 'splash.dart';
import 'onboarding.dart';
import 'auth.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondaryTextColor = Color(0xff2D4379);
    final primaryColor = Color(0xff376AED);
    ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: primaryColor,
              ),
            ),
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          onBackground: primaryTextColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          background: Color(0xffFBFCFF),
          surface: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          foregroundColor: primaryTextColor,
          elevation: 0,
          titleSpacing: 32,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor,

        ),
        textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 18,
            ),
            headline4: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 24,
              color: primaryTextColor,
              fontWeight: FontWeight.w700,
            ),
            caption: const TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              color: Color(0xFF7B8BB2),
              fontSize: 10,
            ),
            headline5: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 20,
              color: primaryTextColor,
              fontWeight: FontWeight.w700,
            ),
            bodyText2: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
                fontSize: 12),
            subtitle1: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
            subtitle2: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
      ),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(
      //       child: HomeScreen(),
      //     ),
      //     Positioned(
      //       left: 0,
      //       right: 0,
      //       top: 0,
      //       bottom: 0,
      //       child: _BottomNavigation(),
      //     )
      //   ],
      // ),
      home: SplashScreen(),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: 85,
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(0xaa9B8487),
                )
              ]),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    iconFileName: 'Home.png',
                    title: 'Home',
                    activeIconFileName: 'Home.png',
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    title: 'Articles',
                    activeIconFileName: 'Articles.png',
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Search.png',
                    title: 'Search',
                    activeIconFileName: 'Search.png',
                  ),
                  BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    title: 'Menu',
                    activeIconFileName: 'Menu.png',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 13,
            child: Center(
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: Color(0XFF376AED),
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String title;
  final String activeIconFileName;

  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.title,
      required this.activeIconFileName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
