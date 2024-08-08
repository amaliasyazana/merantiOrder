import 'package:flutter/material.dart';
import '../../views/menuCust/displayMenu_body.dart';
import 'addtocartPage.dart';

class DisplayMenu extends StatelessWidget {
  final String stallId;
  const DisplayMenu({super.key, required this.stallId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
          title: const Text('Menu'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectedMenuPage()),
                  );
                },
                icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        body: DisplayMenuBody(stallId: stallId));
  }
}
