import '../../models/user.dart';

abstract class UserService {
//perform CRUD operations
  Future<User> getUserById(String id); //SELECT *from user WHERE user.id = is;
  Future<List<User>> getAllUser(); //SELECT *from user
  Future<User> addUser(
      User user); //INSERT INTO user VALUES(user.username, user.password)
  Future<void> deleteUser(String id); //DELETE FROM user where user.id = id;
  Future<User> updateUser(
      String id,
      User
          user); //UPDATE user SET username = new.username, password = new.password  WHERE user.id = id;
  Future<void> getEmail(String email);
  Future<void> getPassword(String password);
  Future<bool> compareUser(String email, String password);
  // Future<User> validateEmail(String email);
  // Future<User> validatePassword(String password);
}



//Talking to external resource takes some time
//API uses asynchronous call  






// abstract class UserService {
// //perform CRUD operations
//   Future<User> getUserById(String id); //SELECT *from user WHERE user.id = is;
//   Future<List<User>> getAllUser(); //SELECT *from user
//   Future<User> addUser(
//       User user); //INSERT INTO user VALUES(user.username, user.password)
//   Future<void> deleteUser(String id); //DELETE FROM user where user.id = id;
//   Future<User> updateUser(
//       String id,
//       User
//           user); //UPDATE user SET username = new.username, password = new.password  WHERE user.id = id;
//   Future<void> getEmail(String email);
//   Future<void> getPassword(String password);
//   Future<void> compareUser(String email, String password);
//   // Future<User> validateEmail(String email);
// //   // Future<User> validatePassword(String password);
// }



//cth nak dapatkan list food,   getFoodbyName(String name)
//function service, untuk modelkan database. buat CRUD 
// counter_service is just an abstract 
// 'Future' keyword represent asynchronous
