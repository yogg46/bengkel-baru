import 'package:bengkel/auth/register.dart';
import 'package:bengkel/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _passwordVisible = false;
  bool _isPasswordValid = true; // Variable to track password validity

  @override
  void initState() {
    super.initState();
    // Check if a user is already signed in
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
    }
  }

  @override
  Future<User?> loginUsingEmailPassword(
      {required String email, required String password}) async {
    User? user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Perform password validation
    if (password.length < 8 || password.length > 12) {
      setState(() {
        _isPasswordValid = false;
      });
      return;
    }

    User? user = await loginUsingEmailPassword(
      email: email,
      password: password,
    );

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Error'),
            content: Text('Password email salah.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _resetPassword() async {
    String email = _emailController.text;

    try {
      await _auth.sendPasswordResetEmail(email: email);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Atur Ulang Kata Sandi.'),
            content: Text(
              'Email pengaturan ulang kata sandi telah dikirim ke alamat email Anda. Silakan periksa kotak masuk Anda untuk mengatur ulang kata sandi Anda.',
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Reset Password Error'),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Purnomo Mobil',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Raleway',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 121, 35, 8),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 300,
                child: Image.asset(
                  "assets/icons/logo1.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_passwordVisible,
                onChanged: (value) {
                  setState(() {
                    _isPasswordValid = true;
                  });
                  if (value.length < 8 || value.length > 12) {
                    setState(() {
                      _isPasswordValid = false;
                    });
                  }
                },
              ),
              if (!_isPasswordValid)
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Kata sandi harus antara 8 dan 12 karakter.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text(
                  "Masuk",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 121, 35, 8),
                  fixedSize: Size(140, 40),
                ),
              ),
              TextButton(
                child: Text(
                  'Daftar',
                  style: TextStyle(color: Color.fromARGB(255, 120, 44, 44)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
              ),
              TextButton(
                child: Text(
                  'Atur Ulang Kata Sandi?',
                  style: TextStyle(color: Color.fromARGB(255, 120, 44, 44)),
                ),
                onPressed: _resetPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
