import 'package:event_mng_app/screens/aboutus.dart';
import 'package:event_mng_app/screens/bookinfo.dart';
import 'package:event_mng_app/screens/booking.dart';
import 'package:event_mng_app/screens/feedback.dart';
import 'package:event_mng_app/screens/forgetpass.dart';
import 'package:event_mng_app/screens/secondpage.dart';
import 'package:flutter/material.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: EventManagementPage(),
    );
  }
}

class EventManagementPage extends StatefulWidget {
  @override
  _EventManagementPageState createState() => _EventManagementPageState();
}

class _EventManagementPageState extends State<EventManagementPage> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dazzleevents', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.black),
        showUnselectedLabels: false,
        backgroundColor: Colors.orange,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedItemIndex = index;
          });
          if (index == 1) {
            // Implement your authentication logic here
            bool isLoggedIn = true; // Example: Assume user is not logged in
            if (isLoggedIn) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }
          }
        },
        currentIndex: _selectedItemIndex,
        selectedFontSize: 18,
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Image.asset(
                'assets/images/events.png',
                width: 100,
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PackageListPage(

                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/pkgess.jpg',
                width: 100,
                height: 100,
              ),
            ),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackForm()),
                );
                // Add your celebration image functionality
              },
              child: Image.asset(
                'assets/images/feed.jpg',
                width: 100,
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
                // Add your celebration image functionality
              },
              child: Image.asset(
                'assets/images/about.png',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}//Profile page
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
        title: Text('Sign Up'),
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
class LoginPage extends StatelessWidget {
  final Map<String, String>? signupDetails; // Add this variable to receive signup details

  LoginPage({Key? key, this.signupDetails}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();

                // Check if login details match (dummy check)
                if (signupDetails != null &&
                    email == signupDetails!['email'] &&
                    password == signupDetails!['password']) {
                  // Navigate to ProfilePage if login details match
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                } else if (email == 'khushikoriya118@gmail.com' && password == '123') {
                  // Navigate to DummyPage if dummy login details match
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                } else {
                  // Show error message if login details do not match
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Email or password is incorrect.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }

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