//modelkan screen
import 'package:map_mvvm/view/viewmodel.dart';
import '../../configs/service_locator.dart';
import '../../models/payment.dart';
import '../../services/payment/payment_service.dart';

class PaymentViewModel extends Viewmodel {
  List<Payment> _payments = [];
  String _paymentmethod = "";

  final PaymentService _paymentService = locator();
  List<Payment> get payments => _payments;

  int get count => _payments.length;
  String get paymentMethod => _paymentmethod;

  void selectPaymentMethod(String paymentMethod) {
    _paymentmethod = paymentMethod;
  }

  Future<void> addNewPayment(Payment payment) async {
    Payment added = await _paymentService.addPayment(payment);
    _payments.add(added);

    update();
  }

  Future<void> getAllPayment() async {
    final list = await _paymentService.getAllPaymentType();
    _payments = list;
    update();
  }

  @override
  void init() {
    getAllPayment();
    super.init();
  }

  //viewmodel = service.getAll()
  //view = viewmodel.getAll()
}
