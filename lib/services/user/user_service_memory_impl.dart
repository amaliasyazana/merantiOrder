import '../../models/user.dart';
import 'user_service.dart';

//we are defining a note service that make use of internal memory approach

class UserServiceMemoryImpl implements UserService {
  final List<User> _user = [
    User(id: '1', email: 'Amalia', password: '1111'),
    User(id: '2', email: 'Farah', password: '2222'),
    User(id: '3', email: 'Farhanah', password: '3333'),
    User(id: '4', email: 'Dini', password: '4444'),
  ];

  @override
  Future<bool> compareUser(String email, String password) async {
    bool found = false;

    for (User user in _user) {
      if (user.email == email && user.password == password) {
        // User found, login successful
        print('Login successful for user ${user.email}');
        found = true;
        break; // No need to continue checking other users
      }
    }

    if (!found) {
      // User not found, login failed
      print('Login failed. Invalid email or password.');
    }

    return found;
  }

  @override
  Future<User> getUserById(String id) async {
    User result = _user.firstWhere((user) => user.id == id);
    return result;
  }

  @override
  Future<List<User>> getAllUser() async {
    return [..._user];
  }

  @override
  Future<User> addUser(User user) async {
    String id = "${int.parse(_user.last.id) + 1}";
    user.id = id;
    _user.add(user);
    return user;
  }

  @override
  Future<void> deleteUser(String id) async {
    _user.removeWhere((user) => user.id == id);
  }

  @override
  Future<User> updateUser(String id, User user) async {
    //find the mote to update
    //update node
    int index = _user.indexWhere((u) => u.id == id);
    _user[index] = user;
    return user;
  }

  @override
  Future<void> getEmail(String email) async {
    User result = _user.firstWhere((user) => user.email == email);
  }

  @override
  Future<void> getPassword(String password) async {
    User result = _user.firstWhere((user) => user.password == password);
  }
}
