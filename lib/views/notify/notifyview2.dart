import 'package:sprint2_latest/views/adminDashboard.dart';
import 'package:sprint2_latest/views/custDashboard.dart';
import 'package:sprint2_latest/views/menuCust/addtocartPage.dart';
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import 'package:sprint2_latest/views/notify/notifyviewmodel.dart';
import '../../models/menuAdmin.dart';
import '../menuAdmin/menu_viewmodel.dart';

class NotifyView2 extends StatelessWidget {
  NotifyView2({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MenuViewModel>(
        builder: (_, viewmodel) => Scaffold(
            appBar: AppBar(
              title: Text('Food Order Status'),
              backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
            ),
            body: ListView.builder(
              itemCount: viewmodel.selectedcount,
              itemBuilder: (_, index) {
                MenuAdmin selectedMenu = viewmodel.selectedmenus[index];
                //  final status = viewModel.updateOrderStatus;
                // viewModel.updateOrderStatus(
                //     order.OrderId, order.OrderStatus);
                return Column(
                  children: [
                    ListTile(
                      title: Text('Order ID: ${selectedMenu.id}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(selectedMenu.name),
                          Text(
                              'Status: ${viewmodel.updateStatus(selectedMenu.name)} ')
                          //${viewModel.updateStatus(order.OrderStatus)}'),

                          // Replace 'OrderDate' with the actual property in your order model
                        ],
                      ), //display food in cart
                      // trailing: ElevatedButton(
                      //     child: Icon(Icons.check), // Approval icon
                      //     onPressed: () {
                      //       viewmodel.markOrderAsReady(selectedMenu.name);

                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => SelectedMenuPage()));
                      //     }

                      //     //selectedMenu: selectedMenu.name,

                      //     ),
                    ),
                  ],
                );
              },
            )));
  }
}
