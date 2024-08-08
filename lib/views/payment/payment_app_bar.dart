import 'package:flutter/material.dart';

class PaymentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PaymentAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Select Payment Method',
      ),
      backgroundColor: const Color.fromRGBO(120, 196, 164, 1),
      elevation: 0,
    );
  }
}
