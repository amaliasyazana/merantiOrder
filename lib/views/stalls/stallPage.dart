import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../views/stalls/stall_app_bar.dart';
import '../../views/stalls/stall_body.dart';
import '../../views/stalls/stall_float.dart';

class StallPage extends StatelessWidget {
  const StallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StallAppBar(),
      body: StallBody(),
      floatingActionButton: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            StallFloat(),
          ],
        ),
      ),
    );
  }
}
