import 'package:flutter/material.dart';
import 'package:moobazir_user/features/profile/presentation/widgets/information_card.dart';
import 'package:moobazir_user/features/profile/presentation/widgets/profile_menu_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFFEF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Toko",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff384700),
                        ),
                      ),
                      Text(
                        'Pastikan informasi toko selalu up-to-date',
                        style: TextStyle(color: Color(0xff8AA624)),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xffFEA405),
                    ),

                    child: Image.asset(
                      'assets/images/edit_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48),
              Row(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // spacing: 5,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            Text(
                              "Ikon AYCE Surabaya",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff181E00),
                              ),
                            ),
                            Text(
                              "Restoran Cepat Saji",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff181E00),
                              ),
                            ),
                            Text(
                              "Dapur Sehat Bu Rina – Jl. Ahmad Yani No. 25, Surabaya",
                            ),
                          ],
                        ),
                        // Spacer(),
                        SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff5AC556),
                              ),
                            ),
                            Text("Akun Aktif"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                spacing: 20,
                children: [
                  InformationCard(
                    title: "Nomor Kontak",
                    info: "0812-3456-7890",
                  ),
                  InformationCard(title: "Email", info: "ikonayce@gmail.com"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                spacing: 20,
                children: [
                  InformationCard(
                    title: "Jam Operasional",
                    info: "10.00 – 22.00 WIB",
                  ),
                  InformationCard(title: "Rekening", info: "BCA – 123456789"),
                ],
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xffFAFFEF),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  spacing: 15,
                  children: [
                    ProfileMenuCard(
                      title: "Pengaturan Akun",
                      iconPath: 'assets/images/setting_icon.png',
                    ),
                    ProfileMenuCard(
                      title: "Notifikasi",
                      iconPath: 'assets/images/notification_icon.png',
                    ),
                    ProfileMenuCard(
                      title: "Syarat & Ketentuan",
                      iconPath: 'assets/images/terms_condition_icon.png',
                    ),
                    ProfileMenuCard(
                      title: "Bantuan / Hubungi Admin",
                      iconPath: 'assets/images/help_icon.png',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xffEA0000),
                ),
                child: Center(
                  child: Text(
                    "Keluar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffFAFFEF),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
