import '../../models/admin.dart';
import 'admin_service.dart';

//we are defining a note service that make use of internal memory approach

class AdminServiceMemoryImpl implements AdminService {
  final List<Admin> _admin = [
    Admin(id: '1', email: 'Admin Amalia', password: '1111'),
    Admin(id: '2', email: 'Admin Farah', password: '2222'),
    Admin(id: '3', email: 'Admin Farhanah', password: '3333'),
    Admin(id: '4', email: 'Admin Dini', password: '4444'),
  ];

  @override
  Future<bool> compareUser(String email, String password) async {
    bool found = false;

    for (Admin admin in _admin) {
      if (admin.email == email && admin.password == password) {
        // User found, login successful
        print('Login successful for user ${admin.email}');
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
  Future<Admin> getAdminById(String id) async {
    Admin result = _admin.firstWhere((admin) => admin.id == id);
    return result;
  }

  @override
  Future<List<Admin>> getAllAdmin() async {
    return [..._admin];
  }

  @override
  Future<Admin> addAdmin(Admin admin) async {
    String id = "${int.parse(_admin.last.id) + 1}";
    admin.id = id;
    _admin.add(admin);
    return admin;
  }

  @override
  Future<void> deleteAdmin(String id) async {
    _admin.removeWhere((admin) => admin.id == id);
  }

  @override
  Future<Admin> updateAdmin(String id, Admin admin) async {
    //find the mote to update
    //update node
    int index = _admin.indexWhere((a) => a.id == id);
    _admin[index] = admin;
    return admin;
  }

  @override
  Future<Admin> getEmail(String email, Admin admin) async {
    admin.email = email;
    return admin;
  }

  @override
  Future<void> getPassword(String password) async {
    Admin result = _admin.firstWhere((admin) => admin.password == password);
  }
}
