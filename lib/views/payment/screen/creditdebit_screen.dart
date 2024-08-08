import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';

import '../payment_view_model.dart';

// ignore: camel_case_types
class creditdebit_screen extends StatelessWidget {
  const creditdebit_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<PaymentViewModel>(
        builder: (_, viewmodel) => const Text('Credit/Debit Screen'));
  }
}
