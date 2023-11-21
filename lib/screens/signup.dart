import 'package:flutter/material.dart';
import 'package:signup_screen/screens/loginscreen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    // Perform sign-up logic here

    // Show pop-up message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Up Successful'),
          content: const Text('Please check your email.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                const SizedBox(height: 50.0),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 90.0),
                    const Text(
                      'Bright Star',
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 180.0),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Username',
                    fillColor: Colors.white70,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Password',
                    fillColor: Colors.white70,
                  ),
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleSignUp,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black26,
                      padding: const EdgeInsets.all(12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:20
                  ),
                ),
                const SizedBox(height: 12.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreen(fname: '',)),
                    );
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize:25,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}