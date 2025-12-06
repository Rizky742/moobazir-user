import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String info;
  const InformationCard({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Color(0xffEEF4D6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title:',
                      style: TextStyle(
                        color: Color(0xff181E00),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Text("0812-3456-7890"),
                    Text(
                      info,
                      style: TextStyle(
                        color: Color(0xff181E00),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 10,
                height: double.infinity,
                color: Color(0xff00A68B),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
