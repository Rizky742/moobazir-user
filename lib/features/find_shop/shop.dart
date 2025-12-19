import 'package:latlong2/latlong.dart';
import 'package:moobazir_user/features/find_shop/menu.dart';

class Shop {
  final String name;
  final String address;
  final String city;
  final String description;
  final double distanceInKm;
  final List<MenuItem> menuItem;
  
  // final String phone;
  final String closeHour;
  final LatLng location;

  Shop({
    required this.name,
    required this.city,
    required this.menuItem,
    required this.distanceInKm,
    required this.address,
    required this.description,
    // required this.phone,
    required this.closeHour,
    required this.location,
  });
}
