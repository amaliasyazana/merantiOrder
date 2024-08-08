import 'package:flutter/material.dart';

class StallAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StallAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Available Stalls'),
      backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
