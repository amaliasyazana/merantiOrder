import 'package:sprint2_latest/views/notify/notifyview2.dart';

import '../views/login/loginpage.dart';
import 'package:flutter/material.dart';
import '../../views/stalls/stallPage.dart';
import 'notify/notifyview.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meranti Diner'),
          backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => StallPage());
                  Navigator.push(context, route);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(170, 170),
                    backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                child: const Text(
                  "Stalls",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => NotifyView());
                  Navigator.push(context, route);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(170, 170),
                    backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                child: const Text(
                  "Customer Order",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ));
    //   body: StallPage(),
    // );
  }
}
