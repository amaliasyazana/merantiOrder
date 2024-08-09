import '../../views/adminDashboard.dart';
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../adminLogin/adminLogin_viewmodel.dart';

class adminLoginView extends StatelessWidget {
  final adminLoginViewModel viewModel = adminLoginViewModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
        title: const Text(""),
      ),
      body: ViewWrapper<adminLoginViewModel>(
        builder: (_, viewModel) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'WELCOME, ADMIN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Container(
                 height: 300,
                  width: 300,
                  child: Image.asset(
                    'images/logo.jpeg',
                    fit: BoxFit.cover, // Adjust how the image fits inside the container
                  ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  prefixIcon: const Icon(Icons.email),
                ),
                //onChanged: (email) => viewModel.getUserEmail(email,user),
                validator: (email) => viewModel.validateEmail(email.toString()),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  filled: true,
                  prefixIcon: const Icon(Icons.lock),
                ),
                //onChanged: (password) => viewModel.getUserPassword(password),
                validator: (password) =>
                    viewModel.validatePassword(password.toString()),
              ),
              const SizedBox(height: 20.0),
              //const SizedBox(height: 32.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () async {
                  bool loginSuccess = await viewModel.compareAdminLogin(
                      _emailController.text, _passwordController.text);
                  if (loginSuccess) {
                    // Navigate to HomePage
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AdminDashboard(),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Invalid email or password. Please try again.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
