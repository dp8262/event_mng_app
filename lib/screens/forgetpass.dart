import 'package:flutter/material.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Forget Password'),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ForgetPasswordForm(),
      ),
    );
  }
}

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _newPassword;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text('EMAIL', style: TextStyle(color: Colors.orange)),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              style: const TextStyle(fontSize: 18.0),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!isValidEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (value) {
                _email = value;
              },
            ),
            const SizedBox(height: 16.0),
            const Text('PASSWORD', style: TextStyle(color: Colors.orange)),
            TextFormField(
              initialValue: _password,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: 'Enter password (minimum 8 characters)',
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              style: const TextStyle(fontSize: 18.0),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                return null;
              },
              onSaved: (value) {
                _password = value;
              },
            ),
            const SizedBox(height: 16.0),
            const Text('NEW PASSWORD', style: TextStyle(color: Colors.orange)),
            TextFormField(
              initialValue: _newPassword,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: 'Enter new password (minimum 8 characters)',
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              style: const TextStyle(fontSize: 18.0),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your new password';
                }
                if (value.length < 8) {
                  return 'New password must be at least 8 characters long';
                }
                if (value == _password) {
                  return 'New password should be different from the old password';
                }
                return null;
              },
              onSaved: (value) {
                _newPassword = value;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  // Do something with the form data, like sending it to a server
                  // For example:
                  // authService.sendForgetPasswordData(_email, _otp, _password, _newPassword);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(fontSize: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                backgroundColor: Colors.orange, // Background color
                foregroundColor: Colors.white, // Text color
              ),
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    // Email validation regex pattern
    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
