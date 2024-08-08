import '../../models/stall.dart';

abstract class StallService {
  Future<Stall> getStallById(String id);
  Future<List<Stall>> getAllStalls();
  Future<Stall> addStall(Stall stall);
  Future<void> deleteStall(String id);
  Future<Stall> updateStall(String id, Stall stall);
}
