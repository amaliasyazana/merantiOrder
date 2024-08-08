import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../models/menuAdmin.dart';
import '../../views/menuAdmin/menu_viewmodel.dart';
import '../../views/menuAdmin/open_edit_menu.dart';

class MenuFloat extends StatelessWidget {
  final String stallId;
  const MenuFloat({super.key, required this.stallId});

  Future<void> _addMenu(MenuViewModel viewmodel, BuildContext context) async {
    MenuAdmin? result =
        await openEditNote(viewmodel, MenuAdmin(), context, stallId);
    if (result == null) return;

    viewmodel.addNewMenu(result);
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MenuViewModel>(
      builder: (_, viewmodel) => FloatingActionButton(
        onPressed: () => _addMenu(viewmodel, context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
