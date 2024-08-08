import 'package:flutter/material.dart';
import '../../views/stallCust/displayStall_body.dart';

class DisplayStall extends StatelessWidget {
  const DisplayStall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Stalls'),
        centerTitle: true,
      ),
      body: displayStallBody(),
    );
  }
}
