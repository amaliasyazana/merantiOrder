import '../../models/payment.dart';
import '../../services/payment/payment_service.dart';

class PaymentServiceMock implements PaymentService {
  final List<Payment> _payment = [
    Payment(
        id: '1',
        paymentType: 'TNG',
        imageUrl:
            'https://drive.google.com/uc?export=view&id=18bw5yQqrRk4oYFifhST8rDyIV_FKGpeg'),
    Payment(
        id: '2',
        paymentType: 'Cash',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/2489/2489756.png'),
    Payment(
        id: '3',
        paymentType: 'Grab Pay',
        imageUrl:
            'https://assets.grab.com/wp-content/uploads/sites/8/2021/11/26235239/GrabPay_Final_Logo_RGB_green_StackedVersion-01.png'),
    Payment(
        id: '4',
        paymentType: 'Credit/Debit',
        imageUrl:
            'https://w7.pngwing.com/pngs/363/177/png-transparent-visa-mastercard-logo-visa-mastercard-computer-icons-visa-text-payment-logo.png')
  ];

  String paymentmethod = '';

  @override
  Future<void> setPaymentMethod(String paymentMet) async {
    paymentmethod = paymentMet;
  }

  Future<String> paymentMethod() async {
    return paymentmethod;
  }

  Future<List<Payment>> getAllPaymentType() async {
    return [..._payment];
  }

  @override
  Future<Payment> addPayment(Payment payment) async {
    String id = "${int.parse(_payment.last.id) + 1}";
    payment.id = id;
    _payment.add(payment);

    return payment;
  }

  @override
  Future<void> deletePayment(String id) async {
    _payment.removeWhere((Payment payment) => payment.id == id);
  }

  @override
  Future<Payment> updatePayment(String id, Payment payment) async {
    int index = _payment.indexWhere((payment) => payment.id == id);
    _payment[index] = payment;

    return payment;
  }
}
