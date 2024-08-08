import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../views/menuAdmin/menuPage.dart';
import '../../views/stalls/open_edit_stall.dart';

import '../../models/menuAdmin.dart';
import '../../models/stall.dart';
import '../menuAdmin/menu_viewmodel.dart';
import 'stall_viewmodel.dart';

class StallBody extends StatelessWidget {
  const StallBody({super.key});

  Future<void> _editStall(
      StallViewModel viewmodel, Stall stall, BuildContext context) async {
    Stall? result = await openEditStall(viewmodel, stall, context);

    if (result == null) return;

    viewmodel.updateStall(stall.id, result);
  }

  void _deleteStall(StallViewModel viewmodel, int index) {
    final Stall stall = viewmodel.stalls[index];

    viewmodel.deleteStall(stall.id);
  }

  void _deleteMenu(MenuViewModel viewmodel, int index) {
    final MenuAdmin menu = viewmodel.menus[index];

    viewmodel.deleteMenu(menu.id);
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<StallViewModel>(
      builder: (_, viewmodel) => ListView.builder(
          itemCount: viewmodel.stallCount,
          itemBuilder: (_, index) => Card(
                child: ListTile(
                  title: Text(viewmodel.stalls[index].name),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MenuPage(stallId: viewmodel.stalls[index].id),
                      ),
                    );
                  },
                ),
              )),
    );
  }
}
