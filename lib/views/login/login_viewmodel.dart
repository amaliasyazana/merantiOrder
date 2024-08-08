import 'package:map_mvvm/view/viewmodel.dart';
import '../../configs/service_locator.dart';
import '../../models/user.dart';
import '../../services/user/user_service.dart';

class LoginViewModel extends Viewmodel {
  List<User> _user = [];
  final String _email = "";
  final String _password = "";

  final UserService _userService = locator();
  List<User> get user => _user;

  int get count => _user.length;
  String get email => _email;
  String get password => _password;

  Future<bool> compareUserLogin(String email, String password) async {
    bool loginSuccess = await _userService.compareUser(email, password);
    return loginSuccess;
  }

  Future<void> getAllUser() async {
    final _list = await _userService.getAllUser();
    _user = _list;
    update();
  }

  Future<void> getUserEmail(String email) async {
    _userService.getEmail(email);
  }

  Future<void> getUserPassword(String password) async {
    _userService.getPassword(password);
  }

  Future<void> addNewUser(User user) async {
    //getting data from view
    //forward the process to services
    //signal the viiew that things get done
    User added = await _userService.addUser(user);
    _user.add(added);
    update();
  }

  Future<void> editUser(String id, User toUpdate) async {
    User updated = await _userService.updateUser(id, toUpdate);
    int index = _user.indexWhere((user) => user.id == id);
    _user[index] = updated;
    update();
  }

  String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b').hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return email;
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter your password';
    } else if (password.length < 2) {
      return 'Password should be at least 8 characters long';
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