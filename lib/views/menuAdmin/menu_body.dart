import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../models/menuAdmin.dart';
import '../../views/menuAdmin/menu_viewmodel.dart';
import '../../views/menuAdmin/open_edit_menu.dart';

class MenuBody extends StatelessWidget {
  final String stallId;
  const MenuBody({super.key, required this.stallId});

  Future<void> _editMenu(
      MenuViewModel viewmodel, MenuAdmin menu, BuildContext context) async {
    MenuAdmin? result = await openEditNote(viewmodel, menu, context, stallId);
    if (result == null) return;

    viewmodel.editMenu(menu.id, result);
  }

  void _deleteMenu(MenuViewModel viewmodel, int index) {
    final MenuAdmin menu = viewmodel.menus[index];

    viewmodel.deleteMenu(menu.id);
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MenuViewModel>(
      builder: (_, viewmodel) => FutureBuilder(
          future: viewmodel.getAllMenusByStallId(stallId),
          builder: (_, snapshot) {
            List<MenuAdmin>? menus = snapshot.data;

            return ListView.builder(
                itemCount: menus?.length ?? 0,
                itemBuilder: (_, index) => Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                  viewmodel.menus[index].imageUrl),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viewmodel.menus[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  'RM ' + viewmodel.menus[index].price,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                        onPressed: () => _editMenu(viewmodel,
                                            viewmodel.menus[index], context),
                                        child: Text(
                                          'Edit Item',
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                    TextButton(
                                        onPressed: () =>
                                            _deleteMenu(viewmodel, index),
                                        child: Text(
                                          'Delete Item',
                                          style: TextStyle(color: Colors.red),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
          }),
    );
  }
}
