import 'notifyservices.dart';
import '../../models/notifymodel.dart';
import 'package:map_mvvm/view/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:map_mvvm/service/rest.dart';

class NotifyServiceMemory implements NotifyService {
  final List<Notify> _notify = [
    Notify(OrderId: '1', OrderStatus: ''),
    Notify(OrderId: '2', OrderStatus: ''),
    Notify(OrderId: '3', OrderStatus: ''),
  ];

  @override
  Future<List<Notify>> getAllOrder() async {
    return [..._notify];
  }

  @override
  Future<Notify> updateOrder(String OrderId, Notify notify) async {
    int index = _notify.indexWhere((n) => n.OrderId == OrderId);

    _notify[index] = notify;
    return notify;
  }

  @override
  Future<Notify> updateOrderStatus(String OrderId, String OrderStatus) async {
    // Find the index of the Notify object with the given OrderId
    int index = _notify.indexWhere((n) => n.OrderId == OrderId);
    if (index != -1) {
      // Update the Notify object with the new OrderStatus
      Notify updatedNotify = Notify(
        OrderId: _notify[index].OrderId, // Keep the original OrderId
        OrderStatus: OrderStatus, // Update with new OrderStatus
      );
      _notify[index] =
          updatedNotify; // Replace the old object with the updated one
      return updatedNotify;
    } else {
      throw Exception(
          'Order not found'); // Throw an exception if the order is not found
    }
  }
}
