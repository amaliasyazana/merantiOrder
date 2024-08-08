import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../views/payment/screen/payment_done.dart';
import '../../views/payment/payment_view_model.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<PaymentViewModel>(
      builder: (_, viewmodel) => FloatingActionButton.extended(
        onPressed: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (context) => const DonePayment());
          Navigator.push(context, route);
        },
        label: const Text(
          'Confirm and Pay',
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(Icons.arrow_forward),
        backgroundColor: const Color.fromRGBO(120, 196, 164, 1),
      ),
    );
  }
}
