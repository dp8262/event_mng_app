import 'package:event_mng_app/screens/aboutus.dart';
import 'package:event_mng_app/screens/bookinfo.dart';
import 'package:event_mng_app/screens/feedback.dart';
import 'package:event_mng_app/screens/login.dart';
import 'package:event_mng_app/screens/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class Package {
  final String name;
  final String price;
  final String description;

  Package({
    required this.name,
    required this.price,
    required this.description,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class EventManagementPage extends StatefulWidget {
  const EventManagementPage({super.key});

  @override
  _EventManagementPageState createState() => _EventManagementPageState();
}

class _EventManagementPageState extends State<EventManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 0,
            centerTitle: false,
            leading: const SizedBox(),
            title: const Text('Dazzleevents', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.orange),
        body: Column(children: [
          Row(children: [
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    },
                    child: Image.asset('assets/images/events.png', scale: 3))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PackageListPage()));
                    },
                    child: Image.asset('assets/images/pkgess.jpg', scale: 5)))
          ]),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => BookingForm()),
          //     );
          //     // Add your celebration image functionality
          //   },
          //   child: Image.asset(
          //     'assets/images/bookevent.png',
          //     width: 100,
          //     height: 100,
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () {
          //
          //     // Add your celebration image functionality
          //   },
          //   child: Image.asset(
          //     'assets/images/vendors.png',
          //     width: 100,
          //     height: 100,
          //   ),
          // ),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackForm()));
                    },
                    child: Image.asset('assets/images/feed.jpg', scale: 1.2))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AboutUsPage()),
                      );
                    },
                    child: Image.asset('assets/images/about.png', scale: 1.2)))
          ])
        ]));
  }
}//Profile page
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        leading: const SizedBox(),
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure you want to logout?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Implement logout functionality
                          // For example:
                          // logout();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())); // Navigate to LoginPage after logout
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // ListTile(
          //   title: Text('Liked Events'),
          //   onTap: () {
          //     // Implement navigation to payment page
          //   },
          // ),
          ListTile(
            title: Text('Booking Info'),
            onTap: () {
              // Implement navigation to package information page
            },
          ),

        ],
      ),
    );
  }
}

// SignupPage class
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 20),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                _validateAndSignUp(context); // Pass context to access Navigator
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  // Validate and sign up
  void _validateAndSignUp(BuildContext context) {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _errorMessage = 'Please fill in all fields.';
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _errorMessage = 'Passwords does not match.';
      });
      return;
    }

    // Clear error message if validation passes
    setState(() {
      _errorMessage = '';
    });

    // Navigate back to LoginPage and pass signup details
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(signupDetails: {'email': email, 'password': password})),
    );
  }
}


//Log in page

// LoginPage
