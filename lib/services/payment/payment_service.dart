import '../../models/payment.dart';

abstract class PaymentService {
  Future<List<Payment>> getAllPaymentType();

  Future<Payment> addPayment(Payment payment);
  Future<void> deletePayment(String id);
  Future<Payment> updatePayment(String id, Payment payment);
  Future<String> paymentMethod();
  Future<void> setPaymentMethod(String paymentMet);
}
