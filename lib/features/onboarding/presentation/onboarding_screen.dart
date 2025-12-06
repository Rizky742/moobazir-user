import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = const [
    {
      'image': 'assets/images/splash_icon_1.png',
      'title': 'Save Food, Save Money',
      'subtitle':
          'Temukan makanan berkualitas dengan harga hemat dari restoran di sekitar Anda.',
    },
    {
      'image': 'assets/images/splash_icon_2.png',
      'title': 'Find Deals Near You',
      'subtitle':
          'Lihat makanan surplus dari lokasi terdekat dan ambil langsung di toko.',
    },
    {
      'image': 'assets/images/splash_icon_3.png',
      'title': 'Reduce Food Waste Together',
      'subtitle': 'Setiap pesanan membantu mengurangi sampah makanan dan emisi karbon.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              Expanded(
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: onboardingData.length,
                      itemBuilder: (context, index, realIndex) {
                        final data = onboardingData[index];
                        return Column(
                          children: [
                            Image.asset(
                              data['image']!,
                              height: 250,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  onboardingData.asMap().entries.map((entry) {
                                    return Container(
                                      width: 10,
                                      height: 10,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            _currentIndex == entry.key
                                                ? const Color(0xFF3B4500)
                                                : const Color(0xFFC4C4C4),
                                      ),
                                    );
                                  }).toList(),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              data['title']!,
                              textAlign: TextAlign.center,
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF3B4500),
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              data['subtitle']!,
                              textAlign: TextAlign.center,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFF768351),
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        height: 500,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              // const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () => context.go('/login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B4500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Masuk Sekarang',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () => context.go('/register'),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFF3B4500),
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Buat Akun Sekarang',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3B4500),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
