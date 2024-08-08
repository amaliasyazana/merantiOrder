import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../views/payment/paymentScreen.dart';
import '../../views/payment/payment_view_model.dart';

class PaymentBody2 extends StatelessWidget {
  const PaymentBody2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<PaymentViewModel>(
        builder: (_, viewmodel) => ListView.builder(
              itemCount: viewmodel.count,
              itemBuilder: (_, index) => ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  child: Image.network(viewmodel.payments[index].imageUrl),
                ),
                title: Text(viewmodel.payments[index].paymentType),
                onTap: () {
                  viewmodel.selectPaymentMethod(
                      viewmodel.payments[index].paymentType);
                  String selected = viewmodel.paymentMethod;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            paymentScreen(selectedpayment: selected)),
                  );
                  SizedBox(
                    height: 10,
                  );
                },
              ),
            ));
  }
}
