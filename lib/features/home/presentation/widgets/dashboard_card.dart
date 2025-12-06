import 'package:flutter/material.dart';
enum DashboardType { greenLight, greenDark }
class DashboardCard extends StatelessWidget {
  final Color background;
  final String title;
  final int value;
  final DashboardType type; 

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.background, required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: type == DashboardType.greenDark ? Color(0xffFAFFEF) : Color(0xff181E00), fontSize: 14)),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 5,
            children: [
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: type == DashboardType.greenDark ? Color(0xffFAFFEF) : Color(0xff384700),
                ),
              ),
              Text(
                "pcs",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: type == DashboardType.greenDark ? Color(0xffFAFFEF) : Color(0xff384700),
                ),
              ),
            ],
          ),
          Row(
            //  crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: type == DashboardType.greenDark ? Color(0xffFEA405) : Color(0xff384700),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Image.asset(
                  'assets/images/arrow_button.png',
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
