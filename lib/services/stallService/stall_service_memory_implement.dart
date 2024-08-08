import '../../models/stall.dart';

import '../../models/menuAdmin.dart';
import '../../services/stallService/stall_service.dart';

class StallServiceMemoryImpl implements StallService {
  final List<Stall> _stalls = [
    Stall(id: '1', name: 'EZ Western', category: 'Western'),
    Stall(id: '2', name: 'Bangkok Terminal', category: 'Thai'),
  ];

  @override
  Future<Stall> getStallById(String id) async {
    Stall result = _stalls.firstWhere((stall) => stall.id == id);
    return result;
  }

  @override
  Future<List<Stall>> getAllStalls() async {
    return [..._stalls];
  }

  @override
  Future<Stall> addStall(Stall stall) async {
    String id = "${int.parse(_stalls.last.id) + 1}";
    stall.id = id;
    _stalls.add(stall);

    return stall;
  }

  @override
  Future<void> deleteStall(String id) async {
    _stalls.removeWhere((Stall stall) => stall.id == id);
  }

  @override
  Future<Stall> updateStall(String id, Stall stall) async {
    int index = _stalls.indexWhere((n) => n.id == id);
    _stalls[index] = stall;

    return stall;
  }
}
