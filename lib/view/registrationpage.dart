import 'package:flutter/material.dart';
import 'package:flutter_project_test/view/loginpage.dart';
import 'package:flutter_project_test/view/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistationPage extends StatelessWidget {
  const RegistationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 210, 113),
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Hi!Create Your Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            TextFiwidget(
              controller: emailController,
              icon: const Icon(Icons.person),
              labaltext: 'Enter your Email',
            ),
            TextFiwidget(
              controller: passwordController,
              icon: const Icon(Icons.lock),
              labaltext: 'Enter Password',
            ),
            TextFiwidget(
              controller: confirmPasswordController,
              icon: const Icon(Icons.lock),
              labaltext: 'Confirm Password',
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a User?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text("Login"),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('email', emailController.text);
                prefs.setString('Password', passwordController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: const Text(
                'SIGN UP',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
