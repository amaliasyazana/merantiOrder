import 'package:flutter/material.dart';
import '../../views/edit/edit.dart';
import '../../views/menuAdmin/menu_viewmodel.dart';

import '../../models/menuAdmin.dart';

Future<MenuAdmin?> openEditNote(MenuViewModel viewmodel, MenuAdmin menu,
    BuildContext context, String stallId) async {
  MenuAdmin? result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Edit(
                menu: menu,
                stallId: stallId,
              )));

  if (result == null) return null;
  return result;
}
