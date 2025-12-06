import 'package:flutter/material.dart';

class ProfileMenuCard extends StatelessWidget {
  final String title;
  final String iconPath;
  const ProfileMenuCard({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            Image.asset(
              iconPath,
              // 'assets/images/setting_icon.png',
              fit: BoxFit.contain,
            ),
            Text(
              // "Pengaturan Akun",
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Color(0xff384700),
              ),
            ),
          ],
        ),
        Image.asset("assets/images/arrow_button_dark.png"),
      ],
    );
  }
}
