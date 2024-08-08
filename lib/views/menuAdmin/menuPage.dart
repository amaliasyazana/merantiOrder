import 'package:flutter/material.dart';
import '../../views/menuAdmin/menu_app_bar.dart';
import '../../views/menuAdmin/menu_body.dart';
import '../../views/menuAdmin/menu_float.dart';

class MenuPage extends StatelessWidget {
  final String stallId;
  const MenuPage({super.key, required this.stallId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(),
      body: MenuBody(stallId: stallId),
      floatingActionButton: MenuFloat(stallId: stallId),
    );
  }
}
