import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signup_screen/screens/signup.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                const SizedBox(height: 130.0),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 30.0),
                    const Text(
                      'Bright Star',
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.cyanAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 150.0),
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
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                      // Perform login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black26,
                      padding: const EdgeInsets.all(12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.cyanAccent,
                      fontSize:20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signup()),
                        );
                      },
                      child: const Text(

                        'Sign Up',
                        style: TextStyle(
                          fontSize:20,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize:20,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Perform action for Google icon
                      },
                      icon: SvgPicture.asset(
                        'assets/google.svg',
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Perform action for Facebook icon
                      },
                      icon: SvgPicture.asset(
                        'assets/facebook.svg',
                        color: Colors.white
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Perform action for Twitter icon
                      },
                      icon: SvgPicture.asset(
                        'assets/twitter.svg',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}