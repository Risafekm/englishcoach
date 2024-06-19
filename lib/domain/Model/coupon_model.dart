// To parse this JSON data, do
//
//     final coupon = couponFromJson(jsonString);

import 'dart:convert';

List<Coupon> couponFromJson(String str) => List<Coupon>.from(json.decode(str).map((x) => Coupon.fromJson(x)));

String couponToJson(List<Coupon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coupon {
    String couponId;
    String couponName;
    String couponReduction;
    String couponCount;

    Coupon({
        required this.couponId,
        required this.couponName,
        required this.couponReduction,
        required this.couponCount,
    });

    factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        couponId: json["coupon_id"],
        couponName: json["coupon_name"],
        couponReduction: json["coupon_reduction"],
        couponCount: json["coupon_count"],
    );

    Map<String, dynamic> toJson() => {
        "coupon_id": couponId,
        "coupon_name": couponName,
        "coupon_reduction": couponReduction,
        "coupon_count": couponCount,
    };
}
