import 'package:event_mng_app/main.dart';
import 'package:event_mng_app/screens/tab_bar_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Map<String, String>? signupDetails; // Add this variable to receive signup details

  LoginPage({Key? key, this.signupDetails}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: const SizedBox(),
        title: const Text('Login',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800,color: Colors.black)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // String email = _emailController.text.trim();
                // String password = _passwordController.text.trim();
                //
                // // Check if login details match (dummy check)
                // if (signupDetails != null &&
                //     email == signupDetails!['email'] &&
                //     password == signupDetails!['password']) {
                //   // Navigate to ProfilePage if login details match
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => EventManagementPage()),
                //   );
                // } else if (email == 'khushikoriya118@gmail.com' && password == '123') {
                //   // Navigate to DummyPage if dummy login details match
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => EventManagementPage()),
                //   );
                // }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TabBarScreen(tabIndex: 0)),
                );
                // else {
                //   // Show error message if login details do not match
                //   showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                //         title: Text('Error'),
                //         content: Text('Email or password is incorrect.'),
                //         actions: <Widget>[
                //           TextButton(
                //             onPressed: () {
                //               Navigator.of(context).pop();
                //             },
                //             child: Text('OK'),
                //           ),
                //         ],
                //       );
                //     },
                //   );
                // }

              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Text('SignUp'),),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
            //     );
            //   },
            //   child: Text('Forget Password'),),




          ],
        ),
      ),
    );
  }
}