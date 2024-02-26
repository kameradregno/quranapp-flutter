import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/pages/homescreen.dart';
import 'package:quran_app/themes.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'splashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "QuranApp",
                style: GoogleFonts.brygada1918(
                  color: primary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Learn Quran and\nRecite once Everyday",
                textAlign: TextAlign.center,
                style: GoogleFonts.brygada1918(
                  color: primary,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset('assets/svg/splash.svg'),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: -20,
                    child: Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                colors: [
                                  Color.fromARGB(255, 19, 186, 164),
                                  Color.fromARGB(255, 19, 186, 164),
                                ]),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.brygada1918(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
