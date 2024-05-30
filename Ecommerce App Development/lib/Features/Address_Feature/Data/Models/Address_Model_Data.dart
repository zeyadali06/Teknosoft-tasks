// ignore_for_file: file_names

import 'dart:convert';

class Address {
  final String country;
  final String street;
  final String buildNumber;
  final String city;
  final String district;
  final String phone;
  final String uid;

  Address({
    required this.uid,
    required this.phone,
    required this.country,
    required this.street,
    required this.buildNumber,
    required this.city,
    required this.district,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'street': street,
      'buildNumber': buildNumber,
      'city': city,
      'district': district,
      'phone': phone,
      'uid': uid,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      country: map['country'],
      street: map['street'],
      buildNumber: map['buildNumber'],
      city: map['city'],
      district: map['district'],
      phone: map['phone'],
      uid: map['uid'],
    );
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Address.fromJson(String source) {
    return Address.fromMap(json.decode(source));
  }

  @override
  String toString() {
    return 'country: $country, street: $street, buildNumber: $buildNumber, city: $city, district: $district, phone: $phone, uid: $uid';
  }

  static bool compareAddresses(Address a1, Address a2) {
    return a1.uid == a2.uid && a1.phone == a2.phone && a1.country == a2.country && a1.street == a2.street && a1.buildNumber == a2.buildNumber && a1.city == a2.city && a1.district == a2.district;
  }
}
