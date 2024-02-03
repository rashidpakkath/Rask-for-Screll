import 'package:flutter/material.dart';
import 'package:flutter_project_test/view/homepage.dart';
import 'package:flutter_project_test/view/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 210, 113),
        title: Text(
          "Login Page",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Welcome Back!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          TextFiwidget(
            controller: emailController,
            icon: const Icon(Icons.person),
            labaltext: 'Enter your Name',
          ),
          TextFiwidget(
            controller: passwordController,
            icon: const Icon(Icons.lock),
            labaltext: 'Enter Password',
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final email = prefs.getString('email');
              final password = prefs.getString('password');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );

              // if (email == emailController && password == passwordController) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => HomePage(),
              //     ),
              //   );
              // }
            },
            child: const Text(
              'LOGIN',
            ),
          ),
        ],
      ),
    );
  }
}
