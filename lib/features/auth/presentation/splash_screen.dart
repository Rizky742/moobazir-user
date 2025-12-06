import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dcart';

const String assetName = 'assets/logo.svg';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFFEF),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SvgPicture.asset('as', width: 200, height: 200),

            // SvgPicture.asset("assets/logo.svg", width: 700, height: 700,),
            Text('sdfds'),
          ],
        ),
      ),
    );
  }
}
