import '../../models/menuAdmin.dart';
import 'menuAdmin_service.dart';

class MenuAdminServiceMemoryImpl implements MenuAdminService {
  final List<MenuAdmin> _menus = [
    MenuAdmin(
        id: '1',
        name: 'Chicken Chop',
        category: 'Western',
        description: 'Chicken Chop with Blackpepper Sauce',
        price: "10",
        stallId: '1',
        imageUrl:
            'https://dishbyili.com/wp-content/uploads/2019/08/Edited-Post-2-1140x700.jpeg'),
    MenuAdmin(
        id: '2',
        name: 'Fish n Chip',
        category: 'Western',
        description: 'Fish n Chip with Tartar Sauce',
        price: "9",
        stallId: '1',
        imageUrl:
            'https://www.thespruceeats.com/thmb/k8Ejnb3LR7yrhwGirJEC2x6r1sg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/best-fish-and-chips-recipe-434856-Hero-5b61b89346e0fb00500f2141.jpg'),
    MenuAdmin(
        id: '3',
        name: 'Nasi Goreng Ayam',
        category: 'Rice',
        description: 'Fried rice with chicken',
        price: "9.50",
        stallId: '2',
        imageUrl:
            'https://www.ceriasihat.com/wp-content/uploads/2021/06/rsz_nasi-goreng-kg.jpg'),
    MenuAdmin(
        id: '4',
        name: 'Kuey Teow Goreng',
        category: 'Mee',
        description: 'Fried Kuey Teow',
        price: "6",
        stallId: '2',
        imageUrl:
            'https://resepichenom.com/media/Kuey_Teow_watermark_1_of_1.jpg'),
  ];

  List<MenuAdmin> _selectedMenus = [];

  List<MenuAdmin> get selectedMenus => _selectedMenus;

  @override
  Future<MenuAdmin> getMenuById(String id) async {
    MenuAdmin result = _menus.firstWhere((menu) => menu.id == id);
    return result;
  }

  Future<List<MenuAdmin>> getAllMenusByStallId(String stallId) async {
    List<MenuAdmin> menusByStall =
        _menus.where((menu) => menu.stallId == stallId).toList();
    return menusByStall;
  }

  @override
  Future<List<MenuAdmin>> getAllMenus() async {
    return [..._menus];
  }

  @override
  Future<MenuAdmin> addMenu(MenuAdmin menu) async {
    String id = "${int.parse(_menus.last.id) + 1}";
    menu.id = id;
    _menus.add(menu);

    return menu;
  }

  @override
  Future<void> deleteMenu(String id) async {
    _menus.removeWhere((MenuAdmin menuAdmin) => menuAdmin.id == id);
  }

  @override
  Future<MenuAdmin> updateMenu(String id, MenuAdmin menu) async {
    int index = _menus.indexWhere((n) => n.id == id);
    _menus[index] = menu;

    return menu;
  }

  @override
// Method to add selected menu to the list
// Method to add selected menu to the list
  Future<MenuAdmin> addSelectedMenu(MenuAdmin selectedMenu) async {
    String id;
    if (_selectedMenus.isEmpty) {
      id = '1';
    } else {
      id = "${int.parse(_selectedMenus.last.id) + 1}";
    }
    selectedMenu.id = id;
    _selectedMenus.add(selectedMenu);

    return selectedMenu;
  }

  @override
  // Method to get all selected menus
  Future<List<MenuAdmin>> getAllSelectedMenus() async {
    return [..._selectedMenus];
  }

  @override
  Future<void> deleteSelectedMenu(int index) async {
    // _selectedMenus
    //     .removeWhere((MenuAdmin selectedmenu) => selectedmenu.id == id);
    _selectedMenus.removeAt(index);
  }

  @override
  String updateStatus(MenuAdmin selectedMenu) {
    if (selectedMenu == 'Completed') {
      return 'Completed';
    } else {
      return 'Pending';
    }
  }

  @override
  String markOrderAsReady(MenuAdmin selectedMenu) {
    if (selectedMenu == 'Pending') {
      return 'Pending';
    } else {
      return 'Complete';
    }
  }
}
