import 'package:flutter/material.dart';

class Notify {
  final String OrderId;
   final String OrderStatus;


  Notify({
    required this.OrderId,
    required this.OrderStatus,

  });

  get updateOrderStatus => null;

  Map<String, dynamic> toMap() {
    return {
      'OrderId': OrderId,
      'OrderStatus': OrderStatus,
   
    };
  }
}
