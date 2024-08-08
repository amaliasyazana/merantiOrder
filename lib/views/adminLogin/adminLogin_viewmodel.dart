import 'package:map_mvvm/view/viewmodel.dart';
import '../../configs/service_locator.dart';
import '../../models/admin.dart';
import '../../services/admin/admin_service.dart';

class adminLoginViewModel extends Viewmodel {
  List<Admin> _admin = [];
  final String _email = "";
  final String _password = "";

  final AdminService _adminService = locator();
  List<Admin> get admin => _admin;

  int get count => _admin.length;
  String get email => _email;
  String get password => _password;

  Future<bool> compareAdminLogin(String email, String password) async {
    bool loginSuccess = await _adminService.compareUser(email, password);
    update();
    return loginSuccess;
  }

  Future<void> getAllAdmin() async {
    final _list = await _adminService.getAllAdmin();
    _admin = _list;
    update();
  }

  Future<void> getAdminEmail(String email, Admin admin) async {
    _adminService.getEmail(email, admin);
  }

  Future<void> getAdminPassword(String password) async {
    _adminService.getPassword(password);
  }

  Future<void> addNewAdmin(Admin admin) async {
    //getting data from view
    //forward the process to services
    //signal the viiew that things get done
    Admin added = await _adminService.addAdmin(admin);
    _admin.add(added);
    update();
  }

  Future<void> editAdmin(String id, Admin toUpdate) async {
    Admin updated = await _adminService.updateAdmin(id, toUpdate);
    int index = _admin.indexWhere((admin) => admin.id == id);
    _admin[index] = updated;
    update();
  }

  String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter your email';
    }
    return email;
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter your password';
    }
    return password;
  }
}




// kene letak list kalau nak amik data dari services
// contoh nak list makanan,  List<Food> food
// view model, kita letak function yang nak guna, contoh addFood, untuk guna di view
// contoh:

// void addFood(){}
// void searchFood(String foodType){}  //maksudnya nak search based on food type