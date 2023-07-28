import 'package:bengkel/auth/login.dart';
import 'package:bengkel/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purnomo Mobil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}




// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(LoginApp());
// }

// class LoginApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login App',
//       theme: ThemeData(
//         backgroundColor: Color.fromARGB(255, 121, 35, 8),
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => LoginPage(),
//         '/register': (context) => RegistrationApp(),
//         '/dashboard': (context) => HomePage(),
//       },
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class LoadingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     checkLoggedIn();
//   }

//   void checkLoggedIn() async {
//     setState(() {
//       _isLoading = true;
//     });

//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       Navigator.pushReplacementNamed(context, '/dashboard');
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   Future<void> loginWithEmailAndPassword() async {
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );

//       Navigator.pushReplacementNamed(context, '/dashboard');
//     } on FirebaseAuthException catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Login Error'),
//             content: Text(e.message ?? ''),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   void forgotPassword() async {
//     String emailAddress = _emailController.text;

//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);

//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Password Reset Email Sent'),
//             content: Text(
//                 'Please check your email for password reset instructions.'),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     } on FirebaseAuthException catch (e) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Password Reset Error'),
//             content: Text(e.message ?? ''),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   void navigateToRegister() {
//     Navigator.pushNamed(context, '/register');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Login',
//           textAlign: TextAlign.center,
//         ),
//         backgroundColor: Color.fromARGB(255, 121, 35, 8),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.center,
//                 height: 300,
//                 child: Image.asset(
//                   "assets/icons/logo1.jpg",
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//               ),
//               SizedBox(height: 12.0),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//               ),
//               SizedBox(height: 24.0),
//               _isLoading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       child: Text(
//                         'Login',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                         ),
//                       ),
//                       onPressed: () {
//                         loginWithEmailAndPassword();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: const Color.fromARGB(255, 121, 35, 8),
//                         fixedSize: Size(140, 40),
//                       ),
//                     ),
//               SizedBox(height: 12.0),
//               TextButton(
//                 child: Text(
//                   'Lupa Password?',
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 120, 44, 44),
//                   ),
//                 ),
//                 onPressed: () {
//                   forgotPassword();
//                 },
//               ),
//               TextButton(
//                 child: Text(
//                   'Register',
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 120, 44, 44),
//                   ),
//                 ),
//                 onPressed: () {
//                   navigateToRegister();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RegistrationApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Registration',
//       theme: ThemeData(
//         primaryColor: Color.fromARGB(255, 120, 44, 44),
//       ),
//       home: RegistrationScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class RegistrationScreen extends StatefulWidget {
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   void registerUser() async {
//     String username = usernameController.text;
//     String email = emailController.text;
//     String password = passwordController.text;

//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       if (userCredential.user != null) {
//         await FirebaseFirestore.instance.collection('users').add({
//           'username': username,
//           'email': email,
//           'password': password,
//         });

//         usernameController.clear();
//         emailController.clear();
//         passwordController.clear();

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Registration successful!'),
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Registration failed. Error: $e'),
//         ),
//       );
//     }
//   }

//   void navigateToLogin() {
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Registration',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Color.fromARGB(255, 120, 44, 44),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: usernameController,
//               decoration: InputDecoration(
//                 labelText: 'Username',
//               ),
//             ),
//             SizedBox(height: 12.0),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             SizedBox(height: 12.0),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             SizedBox(height: 24.0),
//             ElevatedButton(
//               child: Text(
//                 'Register',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                 ),
//               ),
//               onPressed: () {
//                 registerUser();
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: const Color.fromARGB(255, 120, 44, 44),
//                 fixedSize: Size(140, 40),
//               ),
//             ),
//             SizedBox(height: 12.0),
//             TextButton(
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 120, 44, 44),
//                 ),
//               ),
//               onPressed: () {
//                 navigateToLogin();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
