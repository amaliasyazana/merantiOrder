// ignore: file_names
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../payment/payment_view_model.dart';

// ignore: camel_case_types
class tngScreen extends StatelessWidget {
  const tngScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<PaymentViewModel>(
        builder: (_, viewmodel) => const Text('TNG Screen'));
  }
}
