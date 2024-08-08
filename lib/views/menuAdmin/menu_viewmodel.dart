import 'package:map_mvvm/view/viewmodel.dart';
import '../../configs/service_locator.dart';
import '../../services/menuAdminService/menuAdmin_service.dart';

import '../../models/menuAdmin.dart';

class MenuViewModel extends Viewmodel {
  List<MenuAdmin> _menus = [];
  List<MenuAdmin> _menuSelected = [];

  final MenuAdminService _menuAdminService = locator();

  List<MenuAdmin> get menus => _menus;
  int get count => _menus.length;

  List<MenuAdmin> get selectedmenus => _menuSelected;
  int get selectedcount => _menuSelected.length;

  Future<void> addNewMenu(MenuAdmin menu) async {
    MenuAdmin added = await _menuAdminService.addMenu(menu);
    _menus.add(added);
    update();
  }

  Future<void> deleteMenu(String id) async {
    _menuAdminService.deleteMenu(id);
    _menus.removeWhere((MenuAdmin menu) => menu.id == id);
    update();
  }

  Future<void> editMenu(String id, MenuAdmin toUpdate) async {
    MenuAdmin updated = await _menuAdminService.updateMenu(id, toUpdate);
    int index = _menus.indexWhere((menu) => menu.id == id);
    _menus[index] = updated;

    update();
  }

  Future<void> getAllMenus() async {
    final list = await _menuAdminService.getAllMenus();
    _menus = list;

    update();
  }

  Future<List<MenuAdmin>> getAllMenusByStallId(String stallId) async {
    final list = await _menuAdminService.getAllMenusByStallId(stallId);
    _menus = list;

    return _menus;
  }

  Future<void> addSelectedMenu(MenuAdmin selectedMenu) async {
    // Assuming your _menuAdminService has a method to add selected menus
    MenuAdmin added = await _menuAdminService.addSelectedMenu(selectedMenu);
    _menuSelected.add(added);
    update();
  }

  Future<List<MenuAdmin>> getAllSelectedMenus() async {
    final list = await _menuAdminService.getAllSelectedMenus();
    _menuSelected = list;

    return _menuSelected;
  }

  Future<void> deleteSelectedMenu(int index) async {
    await _menuAdminService.deleteSelectedMenu(index);
    _menuSelected.removeAt(index);
    update();
  }

  String updateStatus(String selectedMenu) {
    if (selectedMenu.isEmpty) {
      return 'Completed';
    } else {
      return 'Pending';
    }
  }

  String markOrderAsReady(String selectedMenu) {
    if (selectedMenu.isEmpty) {
      return 'Status: Pending';
    } else {
      return 'Status: Completed';
    }
  }

  @override
  void init() {
    getAllMenus();
    super.init();
  }
}
