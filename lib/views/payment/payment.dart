import 'package:flutter/material.dart';
import '../payment/payment_app_bar.dart';
import '../payment/payment_body2.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  static Route route() => MaterialPageRoute(builder: (_) => const Payment());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PaymentAppBar(),
      body: PaymentBody2(),
      //floatingActionButton: PaymentButton(),
    );
  }
}
