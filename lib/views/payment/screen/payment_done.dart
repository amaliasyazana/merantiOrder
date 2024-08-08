import 'package:flutter/material.dart';

import '../../custDashboard.dart';
import '../../notify/notifyview2.dart';

class DonePayment extends StatefulWidget {
  const DonePayment({super.key});

  @override
  State<DonePayment> createState() => _DonePaymentState();
}

class _DonePaymentState extends State<DonePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(120, 196, 164, 1),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: Image(
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3146/3146600.png'),
                    fit: BoxFit.cover, // Adjust the fit property as needed
                  ),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Payment Success !',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Your order #33-A45E has been successfully processed.',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => CustDashboard()));
                  },
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(120, 196, 164, 1),
                      fixedSize: const Size(200, 40),
                      elevation: 0),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (context) => NotifyView2());
              Navigator.pushReplacement(context, route);
            },
            child: Text(
              'Track Order',
              style: TextStyle(color: Color.fromRGBO(120, 196, 164, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
