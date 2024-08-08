import 'package:map_mvvm/view/viewmodel.dart';
import '../../configs/service_locator.dart';
import '../../models/stall.dart';
import '../../services/stallService/stall_service.dart';

class StallViewModel extends Viewmodel {
  List<Stall> _stalls = [];

  final StallService _stallService = locator();

  List<Stall> get stalls => _stalls;
  int get stallCount => _stalls.length;

  Future<void> addNewStall(Stall stall) async {
    Stall added = await _stallService.addStall(stall);
    _stalls.add(added);
    update();
  }

  Future<void> deleteStall(String id) async {
    _stallService.deleteStall(id);
    _stalls.removeWhere((Stall stall) => stall.id == id);

    update();
  }

  Future<void> updateStall(String id, Stall toUpdate) async {
    Stall updated = await _stallService.updateStall(id, toUpdate);
    int index = _stalls.indexWhere((stall) => stall.id == id);
    _stalls[index] = updated;

    update();
  }

  Future<void> getAllStalls() async {
    final list = await _stallService.getAllStalls();
    _stalls = list;

    update();
  }

  @override
  void init() {
    getAllStalls();
    super.init();
  }
}
