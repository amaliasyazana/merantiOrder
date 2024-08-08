import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../payment/payment_button.dart';
import '../payment/screen/cash_screen.dart';
import '../payment/screen/tngScreen.dart';
import '../payment/screen/grabpay_screen.dart';
import 'screen/creditdebit_screen.dart';

// ignore: camel_case_types
class paymentScreen extends StatelessWidget {
  final String selectedpayment;
  const paymentScreen({super.key, required this.selectedpayment});

  Widget selectedPaymentBody() {
    switch (selectedpayment) {
      case 'TNG':
        return const tngScreen();
      case 'Cash':
        return const cash_screen();
      case 'Grab Pay':
        return const grabpay_screen();
      default:
        return const creditdebit_screen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Gateway',
        ),
        backgroundColor: const Color.fromRGBO(120, 196, 164, 1),
        elevation: 0,
      ),
      body: selectedPaymentBody(),
      floatingActionButton: const PaymentButton(),
    );
  }
}
