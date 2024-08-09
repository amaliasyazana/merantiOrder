import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';

import '../../models/menuAdmin.dart';
import '../menuAdmin/menu_viewmodel.dart';

class DisplayMenuBody extends StatelessWidget {
  final String stallId;
  const DisplayMenuBody({Key? key, required this.stallId}) : super(key: key);

  Future<void> _addMenu(
      MenuViewModel viewmodel, BuildContext context, int index) async {
    // Get the selected menu based on the index
    MenuAdmin? selectedMenu = viewmodel.menus[index];

    if (selectedMenu != null) {
      // Add the selected menu to the list in MenuViewModel
      await viewmodel.addSelectedMenu(selectedMenu);

      // Show a SnackBar to inform the user that the menu is added
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Menu added to your selection'),
          duration: Duration(seconds: 1),
        ),
      );
    }
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
                    // Container(
                    //   height: 100,
                    //   width: 100,
                    //   child: Image.network(
                    //     viewmodel.menus[index].imageUrl,
                    //   ),
                    // ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewmodel.menus[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'RM ' + viewmodel.menus[index].price,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () =>
                                    _addMenu(viewmodel, context, index),
                                child: const Icon(Icons.add))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
