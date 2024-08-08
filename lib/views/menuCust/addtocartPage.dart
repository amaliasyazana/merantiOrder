import '../../views/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';

import '../../models/menuAdmin.dart';
import '../menuAdmin/menu_viewmodel.dart';

class SelectedMenuPage extends StatelessWidget {
  const SelectedMenuPage({Key? key}) : super(key: key);

  void _deleteSelectedMenu(
      MenuViewModel viewmodel, int index, BuildContext context) {
    //final MenuAdmin menu = viewmodel.menus[index];

    viewmodel.deleteSelectedMenu(index);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item removed from your cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MenuViewModel>(
      builder: (_, viewmodel) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
          title: const Text('My Cart'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: viewmodel.selectedcount,
          itemBuilder: (_, index) {
            MenuAdmin selectedMenu = viewmodel.selectedmenus[index];
            return Card(
              child: ListTile(
                leading: Image.network(viewmodel.selectedmenus[index].imageUrl),
                title: Text(selectedMenu.name),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price: RM ${selectedMenu.price}'),
                    ElevatedButton(
                        onPressed: () {
                          _deleteSelectedMenu(viewmodel, index, context);
                        },
                        child: const Icon(Icons.delete))
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (viewmodel.selectedcount != 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Payment(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Your cart is empty'),
                  duration: Duration(seconds: 1),
                ),
              );
            }
          },
          label: Text('Make Payment'),
          backgroundColor: Color.fromRGBO(120, 196, 164, 1.000),
          icon: Icon(Icons.arrow_forward),
          elevation: 0,
        ),
      ),
    );
  }
}
