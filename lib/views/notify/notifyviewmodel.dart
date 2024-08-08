import 'package:map_mvvm/view/viewmodel.dart';
import 'package:sprint2_latest/configs/service_locator.dart';
import 'package:sprint2_latest/models/notifymodel.dart';
import 'package:sprint2_latest/services/notifyService/notifyservices.dart';
//import 'package:meranti_menu/service/menuservices.dart';
//import 'package:meranti_menu/config/servicelocator.dart';

class NotifyViewModel extends Viewmodel {
  NotifyService _notifyService = locator<NotifyService>();
  List<Notify> _notify = [];
  String _status = "";
  final bool _isLoading = false;

  List<Notify> get notify => _notify;
  String get status => _status;
  bool get isLoading => _isLoading;

  // Method to update the loading state
  void setLoading(bool isLoading) {
    isLoading = _isLoading;
    notifyListeners(); // Notify any listeners that the state has changed
  }

  // Method to update the status message
  void setStatus(String status) {
    _status = status;
    notifyListeners(); // Notify any listeners that the state has changed
  }

  Future<void> fetchAllOrders() async {
    setLoading(true);
    try {
      _notify =
          await _notifyService.getAllOrder(); // Fetch orders from the service
      // Handle successful fetch here, e.g., notify listeners
    } catch (e) {
      // Handle errors here, e.g., setting an error message
    } finally {
      setLoading(false);
    }
    notifyListeners(); // Notify the UI about the change in the orders list
  }

  // Method to update an order's status
  Future<void> updateOrderStatus(String OrderId, String OrderStatus) async {
    setLoading(true);
    try {
      await _notifyService.updateOrderStatus(OrderId, OrderStatus);
      setStatus("Ready to be collected");
      await fetchAllOrders(); // Refresh the orders list
    } catch (e) {
      setStatus("Error updating order status: ${e.toString()}");
    } finally {
      setLoading(false);
    }
  }

  String updateStatus(String OrderStatus) {
    if (OrderStatus.isEmpty) {
      return 'Pending';
    } else {
      return 'Completed';
    }
    return OrderStatus;
  }
}
