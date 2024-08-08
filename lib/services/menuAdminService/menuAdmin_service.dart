import '../../models/menuAdmin.dart';

abstract class MenuAdminService {
  Future<MenuAdmin> getMenuById(String id);
  Future<List<MenuAdmin>> getAllMenus();
  Future<List<MenuAdmin>> getAllMenusByStallId(String stallId);
  Future<MenuAdmin> addMenu(MenuAdmin menu);
  Future<void> deleteMenu(String id);
  Future<MenuAdmin> updateMenu(String id, MenuAdmin menu);
  Future<MenuAdmin> addSelectedMenu(MenuAdmin selectedMenu);
  Future<List<MenuAdmin>> getAllSelectedMenus();
  Future<void> deleteSelectedMenu(int index);
  String updateStatus(MenuAdmin selectedMenu);
  String markOrderAsReady(MenuAdmin selectedMenu);
}
