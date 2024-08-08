import '../../models/notifymodel.dart';

abstract class NotifyService {
  Future<List<Notify>> getAllOrder();
  Future<Notify> updateOrder(String OrderId, Notify notify);
  Future<Notify> updateOrderStatus(
    String OrderId,
    String OrderStatus,
  );
}
