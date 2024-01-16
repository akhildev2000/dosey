import 'dart:async';
import 'package:dosa_wala/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        PageTransition(
            child: const HomePage(),
            type: PageTransitionType.leftToRightWithFade),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 220,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'dosa',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 36.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Wala.',
                          style: GoogleFonts.poppins(
                            color: Colors.yellow,
                            fontSize: 36.0,
                          ),
                        ),
                      ]),
                ),
                Text(
                  'the taste of south',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 13.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
