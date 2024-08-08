import '../views/login/loginpage.dart';
import '../views/menuCust/addtocartPage.dart';
import 'package:flutter/material.dart';
import '../views/stallCust/displayStall.dart';
import 'notify/notifyview2.dart';

class CustDashboard extends StatelessWidget {
  const CustDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meranti Diner'),
        backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectedMenuPage()),
                );
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (context) => NotifyView2());
            Navigator.push(context, route);
          },
          child: Text('Track Status'),
        ),
      ),
      body: DisplayStall(),
    );
  }
}
